---
layout: page
title: Publications
permalink: /publications/
---

<div class="publications">

  <div class="pub-filter-panel">
    <p><strong>Filter by research area</strong></p>
    <div class="pub-chip-row" role="group" aria-label="Filter publications by research area">
      <button class="pub-chip active" type="button" data-filter="all" aria-pressed="true">All Papers</button>
      <button class="pub-chip" type="button" data-filter="augmented expertise" aria-pressed="false">Augmented Expertise</button>
      <button class="pub-chip" type="button" data-filter="hybrid intelligence systems" aria-pressed="false">Hybrid Intelligence Systems</button>
      <button class="pub-chip" type="button" data-filter="algorithmic and data justice" aria-pressed="false">Algorithmic &amp; Data Justice</button>
      <button class="pub-chip" type="button" data-filter="civic data and participation" aria-pressed="false">Civic Data &amp; Participation</button>
    </div>
  </div>

  {% assign publication_data = site.data.publications_from_bib | default: site.data.publications %}
  {% assign years = publication_data | map: "year" | uniq | sort | reverse %}

  {% for year in years %}
    {% assign year_id = 'pub-year-' | append: year %}
    <div class="pub-year-group" data-year-group>
      <button class="pub-year-toggle" type="button" aria-expanded="false" aria-controls="{{ year_id }}">{{ year }}</button>
      <div class="pub-year-content" id="{{ year_id }}">
        {% for pub in publication_data %}
          {% if pub.year == year %}
            {% assign research_areas = site.data.publication_research_areas[pub.title] %}
            {% assign area_string = research_areas | join: '|' | downcase %}
            {% assign primary_link = pub.links %}
            {% if pub.links.first %}
              {% assign primary_link = pub.links.first %}
            {% endif %}

            <div class="publication-entry" data-research-areas="{{ area_string }}">
              {% assign apa_authors = pub.authors
                | replace: 'Corey Brian Jackson', '<strong>Corey Brian Jackson</strong>'
                | replace: 'Corey B. Jackson', '<strong>Corey B. Jackson</strong>'
                | replace: 'Corey Jackson', '<strong>Corey Jackson</strong>'
                | replace: 'C. B. Jackson', '<strong>C. B. Jackson</strong>'
                | replace: 'C.B. Jackson', '<strong>C.B. Jackson</strong>'
                | replace: 'Jackson, C. B.', '<strong>Jackson, C. B.</strong>'
                | replace: 'Jackson, C.', '<strong>Jackson, C.</strong>'
              %}

              <p class="pub-citation">
                {{ apa_authors }} ({{ pub.year }}).
                {% if primary_link and primary_link != "" %}
                  <a href="{{ primary_link | strip }}" target="_blank" rel="noopener">{{ pub.title }}</a>.
                {% else %}
                  {{ pub.title }}.
                {% endif %}
                <em>{{ pub.venue }}</em>.
              </p>

              {% if research_areas and research_areas.size > 0 %}
                <p class="pub-tags pub-research-areas" aria-label="Research areas">
                  {% for area in research_areas %}
                    <span class="pub-tag pub-area-tag">{{ area }}</span>
                  {% endfor %}
                </p>
              {% endif %}

              {% if pub.topics and pub.topics.size > 0 %}
                <p class="pub-tags pub-secondary-tags" aria-label="Additional topics">
                  {% for topic in pub.topics %}
                    <span class="pub-tag">{{ topic }}</span>
                  {% endfor %}
                </p>
              {% endif %}

              {% if pub.note and pub.note != "" %}
                <p class="pub-note">{{ pub.note }}</p>
              {% endif %}
            </div>
          {% endif %}
        {% endfor %}
      </div>
    </div>
  {% endfor %}

</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const yearToggles = document.querySelectorAll(".pub-year-toggle");
  const filterButtons = document.querySelectorAll(".pub-chip");
  const entries = document.querySelectorAll(".publication-entry");
  const yearGroups = document.querySelectorAll("[data-year-group]");

  yearToggles.forEach((toggle) => {
    toggle.addEventListener("click", function () {
      const content = this.nextElementSibling;
      const isOpen = this.getAttribute("aria-expanded") === "true";
      this.setAttribute("aria-expanded", String(!isOpen));
      this.classList.toggle("open", !isOpen);
      content.classList.toggle("open", !isOpen);
    });
  });

  document.querySelectorAll(".pub-year-content").forEach((content, index) => {
    if (index === 0) {
      content.classList.add("open");
      content.previousElementSibling.classList.add("open");
      content.previousElementSibling.setAttribute("aria-expanded", "true");
    }
  });

  filterButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const selectedFilter = this.dataset.filter;

      filterButtons.forEach((btn) => {
        btn.classList.remove("active");
        btn.setAttribute("aria-pressed", "false");
      });
      this.classList.add("active");
      this.setAttribute("aria-pressed", "true");

      entries.forEach((entry) => {
        const areas = entry.dataset.researchAreas || "";
        const shouldShow = selectedFilter === "all" || areas.includes(selectedFilter);
        entry.style.display = shouldShow ? "" : "none";
      });

      yearGroups.forEach((group) => {
        const visibleEntries = group.querySelectorAll(".publication-entry:not([style*='display: none'])");
        const content = group.querySelector(".pub-year-content");
        const toggle = group.querySelector(".pub-year-toggle");

        if (visibleEntries.length === 0) {
          group.style.display = "none";
        } else {
          group.style.display = "";
          content.classList.add("open");
          toggle.classList.add("open");
          toggle.setAttribute("aria-expanded", "true");
        }
      });
    });
  });
});
</script>