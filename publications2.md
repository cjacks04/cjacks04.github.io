---
layout: page
title: Publications
permalink: /publications/
---

<div class="publications">

<div class="pub-filter-panel">
  <p><strong>Showing selected publications</strong></p>
  <div class="pub-chip-row">
    <span class="pub-chip active">All Papers</span>
    <span class="pub-chip">Social Computing</span>
    <span class="pub-chip">Responsible AI</span>
    <span class="pub-chip">Citizen Science</span>
    <span class="pub-chip">Civic Technology</span>
  </div>
</div>

<h2>Conference &amp; Journal Papers</h2>

<div class="pub-year-group">
  <button class="pub-year-toggle" type="button">2025</button>
  <div class="pub-year-content">

    <div class="publication-entry">
      <h3>Leveling Up or Dropping Out: Searching for Learning Routines in Crowdsourced Environments</h3>
      <p class="pub-authors">Corey Jackson, Carsten Österlund, Anand Vamsi, Alexander Owen Smith, and Kevin Crowston</p>
      <p class="pub-meta">Proceedings of the ACM on Human-Computer Interaction, 2025</p>
      <p class="pub-tags">
        <span class="pub-tag">crowdsourcing</span>
        <span class="pub-tag">learning</span>
        <span class="pub-tag">social computing</span>
      </p>
      <p class="pub-note">This paper examines how people develop and sustain learning routines in crowdsourced environments.</p>
    </div>

    <div class="publication-entry">
      <h3>Please Say “Shibboleth”: Socialization Through Language Adoption in Virtual Citizen Science</h3>
      <p class="pub-authors">Corey Jackson</p>
      <p class="pub-meta">Proceedings of the International AAAI Conference on Web and Social Media, 2025</p>
      <p class="pub-tags">
        <span class="pub-tag">language</span>
        <span class="pub-tag">citizen science</span>
      </p>
      <p class="pub-note">This paper explores how shared language supports socialization and participation in virtual citizen science.</p>
    </div>

  </div>
</div>

<div class="pub-year-group">
  <button class="pub-year-toggle" type="button">2024</button>
  <div class="pub-year-content">

    <div class="publication-entry">
      <h3>How Personal Value Orientations Influence Behaviors in Digital Citizen Science</h3>
      <p class="pub-authors">Eunmi Jeong, Corey Jackson, Liz Dowthwaite, Cliff Johnson, and Laura Trouille</p>
      <p class="pub-meta">Proceedings of the ACM on Human-Computer Interaction, 2024</p>
      <p class="pub-tags">
        <span class="pub-tag">citizen science</span>
        <span class="pub-tag">values</span>
      </p>
      <p class="pub-note">This paper examines how value orientations shape participation and behavior in digital citizen science.</p>
    </div>

    <div class="publication-entry">
      <h3>Gravity Spy: Lessons Learned and a Path Forward</h3>
      <p class="pub-authors">Michael Zevin, Corey B. Jackson, Zoheyr Doctor, Yunan Wu, Carsten Österlund, and colleagues</p>
      <p class="pub-meta">The European Physical Journal Plus, 2024</p>
      <p class="pub-tags">
        <span class="pub-tag">citizen science</span>
        <span class="pub-tag">human-AI collaboration</span>
      </p>
      <p class="pub-note">This paper reflects on the development of Gravity Spy and outlines lessons for future human–AI collaboration systems.</p>
    </div>

  </div>
</div>

<div class="pub-year-group">
  <button class="pub-year-toggle" type="button">2020</button>
  <div class="pub-year-content">

    <div class="publication-entry">
      <h3>Shifting Forms of Engagement: Volunteer Learning in Online Citizen Science</h3>
      <p class="pub-authors">Corey B. Jackson, Carsten Österlund, Kevin Crowston, Mahboobeh Harandi, and Laura Trouille</p>
      <p class="pub-meta">Proceedings of the ACM on Human-Computer Interaction, 2020</p>
      <p class="pub-tags">
        <span class="pub-tag">citizen science</span>
        <span class="pub-tag">learning</span>
      </p>
      <p class="pub-note">This paper examines how volunteer engagement changes over time in online citizen science systems.</p>
    </div>

    <div class="publication-entry">
      <h3>Teaching Citizen Scientists to Categorize Glitches Using Machine Learning Guided Training</h3>
      <p class="pub-authors">Corey Jackson, Carsten Österlund, Kevin Crowston, Mahboobeh Harandi, and colleagues</p>
      <p class="pub-meta">Computers in Human Behavior, 2020</p>
      <p class="pub-tags">
        <span class="pub-tag">machine learning</span>
        <span class="pub-tag">training</span>
        <span class="pub-tag">citizen science</span>
      </p>
      <p class="pub-note">This paper studies how machine-learning-guided training can support classification work in citizen science.</p>
    </div>

  </div>
</div>

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