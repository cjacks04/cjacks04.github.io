# Publications BibTeX source

Place the site's canonical bibliography at:

`assets/bib/publications.bib`

Before Jekyll builds the site, `scripts/bib_to_publications.rb` converts the BibTeX entries into `_data/publications_from_bib.yml`. The Publications page uses that generated file when it exists and falls back to `_data/publications.yml` otherwise.

The BibTeX file controls citation information such as title, authors, year, venue, DOI, and URL. The existing `_data/publications.yml` file is retained for website-only metadata such as topic tags and short notes; the generator matches those fields to BibTeX entries by normalized title.

Useful BibTeX fields:

- `title`
- `author`
- `year`
- `journal` or `booktitle`
- `doi`
- `url`
- `keywords` (optional; used for site topic tags when no matching metadata entry exists)
