#!/usr/bin/env ruby

require "bibtex"
require "yaml"
require "fileutils"

BIB_PATH = File.expand_path("../assets/bib/publications.bib", __dir__)
METADATA_PATH = File.expand_path("../_data/publications.yml", __dir__)
OUTPUT_PATH = File.expand_path("../_data/publications_from_bib.yml", __dir__)

unless File.exist?(BIB_PATH)
  warn "No BibTeX file found at assets/bib/publications.bib; keeping the existing publications.yml fallback."
  exit 0
end

def clean_text(value)
  value.to_s
       .gsub(/[{}]/, "")
       .gsub(/\\&/, "&")
       .gsub(/\\_/, "_")
       .strip
end

def normalize_title(value)
  clean_text(value).downcase.gsub(/[^[:alnum:]]+/, " ").strip
end

def format_authors(value)
  clean_text(value)
    .split(/\s+and\s+/i)
    .map do |name|
      if name.include?(",")
        parts = name.split(",").map(&:strip)
        [parts[1..]&.join(" "), parts[0]].compact.join(" ").strip
      else
        name.strip
      end
    end
    .reject(&:empty?)
    .join(", ")
end

def venue_for(entry)
  %i[journal booktitle publisher school institution organization howpublished]
    .map { |field| clean_text(entry[field]) }
    .find { |value| !value.empty? } || ""
end

def type_for(entry)
  case entry.type.to_s.downcase
  when "article" then "Journal"
  when "inproceedings", "conference" then "Conference"
  when "incollection", "inbook" then "Book Chapter"
  when "book" then "Book"
  when "phdthesis", "mastersthesis" then "Thesis"
  else entry.type.to_s.capitalize
  end
end

def topics_for(entry, metadata)
  return Array(metadata["topics"]) if metadata && metadata["topics"]

  raw = clean_text(entry[:keywords])
  return [] if raw.empty?

  raw.split(/[;,]/).map(&:strip).reject(&:empty?)
end

def links_for(entry, metadata)
  url = clean_text(entry[:url])
  doi = clean_text(entry[:doi])

  links = []
  links << url unless url.empty?
  links << "https://doi.org/#{doi}" unless doi.empty? || links.any? { |link| link.include?(doi) }

  if links.empty? && metadata
    links.concat(Array(metadata["links"]).compact.map(&:to_s).map(&:strip).reject(&:empty?))
  end

  links.uniq
end

metadata_entries = File.exist?(METADATA_PATH) ? YAML.safe_load(File.read(METADATA_PATH), aliases: true) : []
metadata_entries ||= []
metadata_by_title = metadata_entries.each_with_object({}) do |item, index|
  next unless item.is_a?(Hash) && item["title"]
  index[normalize_title(item["title"])] = item
end

bibliography = BibTeX.open(BIB_PATH)
publications = bibliography.entries.filter_map do |entry|
  title = clean_text(entry[:title])
  year = clean_text(entry[:year])
  next if title.empty? || year.empty?

  metadata = metadata_by_title[normalize_title(title)]
  note = metadata && metadata["note"] ? metadata["note"].to_s : ""

  {
    "title" => title,
    "year" => year.to_i,
    "authors" => format_authors(entry[:author]),
    "venue" => venue_for(entry),
    "type" => type_for(entry),
    "topics" => topics_for(entry, metadata),
    "note" => note,
    "links" => links_for(entry, metadata)
  }
end

publications.sort_by! { |pub| [-pub["year"], pub["title"].downcase] }

FileUtils.mkdir_p(File.dirname(OUTPUT_PATH))
File.write(OUTPUT_PATH, publications.to_yaml(line_width: -1))
puts "Generated #{publications.length} publications from #{BIB_PATH}."
