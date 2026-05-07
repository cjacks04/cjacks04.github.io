---
layout: page
title: Tools
permalink: /tools/
---

<div class="research-page tools-page">

  <div class="research-intro">
    <p>
      The Collaborative Computing Group develops research tools that help communities, researchers, and public-interest organizations collect, interpret, and act on data. This page highlights systems created by our group and collaborators, including tools for civic data analysis, participatory science, responsible AI, and public-sector decision-making.
    </p>
  </div>

  <!-- CCS KNOWLEDGE MAP -->
  <div class="research-card collapsible-card">
    <button class="research-card-toggle" type="button">
      <span>CCS Knowledge Map</span>
    </button>
    <div class="research-card-content">
      <p class="research-question">
        A web-based tool for helping researchers and community groups upload, map, and visualize community-generated data.
      </p>

      <div class="research-image tool-image-placeholder">
        <img src="/assets/img/tools/ccs-knowledge-map.png" alt="Screenshot of the CCS Knowledge Map interface" />
        <p class="media-caption">Image placeholder: add a screenshot at <code>/assets/img/tools/ccs-knowledge-map.png</code>.</p>
      </div>

      <p>
        The CCS Knowledge Map is designed to make community and civic data easier to explore for people who may not have extensive programming or statistics backgrounds. Users can upload CSV-style datasets, identify important columns such as geography, demographics, and survey questions, and generate visual summaries directly in the browser. The tool supports workflows for comparing community-generated datasets with public benchmarks, including Census-backed demographic comparisons where appropriate. More broadly, the system reflects our group’s interest in building accessible data tools that help communities examine representativeness, surface local knowledge, and communicate findings to public audiences.
      </p>

      <div class="research-section">
        <strong>Contributors</strong>: Corey Jackson, [Student contributor], [Collaborator], [Designer/Developer]
      </div>

      <div class="research-section">
        <strong>Link</strong>: <a href="https://github.com/madcollab-jrg/ccs-map-v2" target="_blank" rel="noopener">https://github.com/madcollab-jrg/ccs-map-v2</a>
      </div>
    </div>
  </div>

  <!-- FUTURE TOOL TEMPLATE -->
  <div class="research-card collapsible-card">
    <button class="research-card-toggle" type="button">
      <span>Future Tool Name</span>
    </button>
    <div class="research-card-content">
      <p class="research-question">
        One-sentence description of the tool and the problem it helps address.
      </p>

      <div class="research-image tool-image-placeholder">
        <img src="/assets/img/tools/tool-placeholder.png" alt="Screenshot or visual preview of the tool" />
        <p class="media-caption">Image placeholder: add a screenshot or system image here.</p>
      </div>

      <p>
        Add a four- to five-sentence description of the tool here. Briefly explain who the tool is for, what problem it addresses, what users can do with it, and how it connects to the research group’s broader work. This description should be accessible to readers who are not familiar with the technical details of the project. It can also mention the research context, deployment status, or type of data the tool supports.
      </p>

      <div class="research-section">
        <strong>Contributors</strong>: [Contributor 1], [Contributor 2], [Contributor 3]
      </div>

      <div class="research-section">
        <strong>Link</strong>: <a href="[TOOL_LINK]" target="_blank" rel="noopener">[TOOL_LINK]</a>
      </div>
    </div>
  </div>

</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
  const toggles = document.querySelectorAll(".research-card-toggle");

  toggles.forEach((toggle, index) => {
    toggle.addEventListener("click", function () {
      const content = this.nextElementSibling;
      this.classList.toggle("open");
      content.classList.toggle("open");
    });

    if (index === 0) {
      toggle.classList.add("open");
      toggle.nextElementSibling.classList.add("open");
    }
  });
});
</script>
