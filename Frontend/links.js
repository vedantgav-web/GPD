async function loadLinks() {
  try {
    const res = await fetch("http://localhost:5000/api/common/links");
    const links = await res.json();

    const container = document.getElementById("linksContainer");
    container.innerHTML = "";

    links.forEach(l => {
      const card = document.createElement("div");
      card.className = "link-card";
      card.innerHTML = `<a href="${l.link}" target="_blank">${l.title}</a>`;
      container.appendChild(card);
    });
  } catch (err) {
    console.error("Links load failed");
  }
}

loadLinks();
