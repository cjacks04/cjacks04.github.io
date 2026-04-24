---
layout: page
title: Publications
permalink: /publications/
---

<div class="publications">

  <div class="pub-filter-panel">
    <p><strong>Filter publications</strong></p>
    <div class="pub-chip-row">
      <button class="pub-chip active" type="button" data-filter="all">All Papers</button>
      <button class="pub-chip" type="button" data-filter="social computing">Social Computing</button>
      <button class="pub-chip" type="button" data-filter="responsible ai">Responsible AI</button>
      <button class="pub-chip" type="button" data-filter="citizen science">Citizen Science</button>
      <button class="pub-chip" type="button" data-filter="civic tech">Civic Technology</button>
    </div>
  </div>

  {% assign years = site.data.publications | map: "year" | uniq | sort | reverse %}

  {% for year in years %}
    <div class="pub-year-group" data-year-group>
      <button class="pub-year-toggle" type="button">{{ year }}</button>
      <div class="pub-year-content">
        {% for pub in site.data.publications %}
          {% if pub.year == year %}
            {% assign topic_string = pub.topics | join: '|' | downcase %}
            <div class="publication-entry" data-topics="{{ topic_string }}">
              {% assign valid_links = pub.links | compact %}
              {% if valid_links.size > 0 %}
                <h3>
                  <a href="{{ valid_links.first | strip }}" target="_blank" rel="noopener">
                    {{ pub.title }}
                  </a>
                </h3>
              {% else %}
                <h3>{{ pub.title }}</h3>
              {% endif %}
              {% if pub.authors %}
                <p class="pub-line"><strong>Authors:</strong> {{ pub.authors }}</p>
              {% endif %}
              {% if pub.venue %}
                <p class="pub-line"><strong>Venue:</strong> {{ pub.venue }}</p>
              {% endif %}
              {% if pub.type %}
                <p class="pub-line"><strong>Type:</strong> {{ pub.type }}</p>
              {% endif %}
              {% if pub.topics %}
                <p class="pub-tags">
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
      this.classList.toggle("open");
      content.classList.toggle("open");
    });
  });

  document.querySelectorAll(".pub-year-content").forEach((content, index) => {
    if (index === 0) {
      content.classList.add("open");
      content.previousElementSibling.classList.add("open");
    }
  });

  filterButtons.forEach((button) => {
    button.addEventListener("click", function () {
      const selectedFilter = this.dataset.filter;

      filterButtons.forEach((btn) => btn.classList.remove("active"));
      this.classList.add("active");

      entries.forEach((entry) => {
        const topics = entry.dataset.topics || "";
        const shouldShow =
          selectedFilter === "all" || topics.includes(selectedFilter);

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
        }
      });
    });
  });
});
</script>