---
layout: page
title: Publications
permalink: /publications/
---

<div class="publications">

  <div class="pub-filter-panel">
    <p><strong>Selected publications</strong></p>
    <div class="pub-chip-row">
      <span class="pub-chip active">All Papers</span>
      <span class="pub-chip">Social Computing</span>
      <span class="pub-chip">Responsible AI</span>
      <span class="pub-chip">Citizen Science</span>
      <span class="pub-chip">Civic Technology</span>
    </div>
  </div>

  <h2>Publications</h2>

  {% assign years = site.data.publications | map: "year" | uniq | sort | reverse %}

  {% for year in years %}
    <div class="pub-year-group">
      <button class="pub-year-toggle" type="button">{{ year }}</button>
      <div class="pub-year-content">


  {% for pub in site.data.publications %}
  {% if pub.year == year %}
    <div class="publication-entry">
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
      <p class="pub-line"><strong>Venue:</strong> {{ pub.venue }}, {{ pub.year }}</p>
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

<script>
document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".pub-year-toggle");

  toggles.forEach((toggle) => {
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
});
</script>