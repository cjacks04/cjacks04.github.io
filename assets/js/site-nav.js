document.addEventListener("DOMContentLoaded", function () {
  const toggle = document.querySelector(".nav-toggle");
  const links = document.getElementById("primary-nav-links");

  if (!toggle || !links) return;

  toggle.addEventListener("click", function () {
    const isOpen = toggle.getAttribute("aria-expanded") === "true";
    toggle.setAttribute("aria-expanded", String(!isOpen));
    links.classList.toggle("open", !isOpen);
  });

  links.querySelectorAll("a").forEach((link) => {
    link.addEventListener("click", function () {
      toggle.setAttribute("aria-expanded", "false");
      links.classList.remove("open");
    });
  });

  window.addEventListener("resize", function () {
    if (window.innerWidth > 820) {
      toggle.setAttribute("aria-expanded", "false");
      links.classList.remove("open");
    }
  });
});
