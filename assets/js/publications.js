document.addEventListener("DOMContentLoaded", async function () {
  const out = document.getElementById("pubs");
  const status = document.getElementById("pubs-status");

  if (!out || !status) return;

  // Adjust if you use a different path/name
  const bibUrl = (window.location.pathname.includes("/")) 
    ? (window.location.origin + (document.querySelector('base')?.href || "") ) 
    : "";

  const bibPath = (typeof window.__bibPath !== "undefined")
    ? window.__bibPath
    : (document.documentElement.getAttribute("data-bib-path") || "/assets/bib/publications.bib");

  try {
    const res = await fetch(bibPath, { cache: "no-cache" });
    if (!res.ok) throw new Error(`Failed to fetch .bib (${res.status})`);
    const bib = await res.text();

    // Citation.js expects Cite global
    const cite = new Cite(bib);

    // Output HTML bibliography.
    // You can change template to "apa", "mla", "vancouver", etc.
    // "apa" looks nice for academic sites.
    const html = cite.format("bibliography", {
      format: "html",
      template: "apa",
      lang: "en-US"
    });

    status.remove();
    out.innerHTML = html;

    // Optional: small tidy-up for spacing
    out.querySelectorAll("div.csl-entry").forEach(el => {
      el.style.marginBottom = "0.65rem";
    });

  } catch (err) {
    status.textContent = "Could not load publications.";
    const msg = document.createElement("div");
    msg.style.fontSize = "0.9rem";
    msg.style.opacity = "0.85";
    msg.textContent = `Error: ${err.message}`;
    out.appendChild(msg);
  }
});
