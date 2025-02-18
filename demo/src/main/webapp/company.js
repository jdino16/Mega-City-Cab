document.addEventListener("DOMContentLoaded", function () {
    // 🚀 Sidebar Toggle
    const expandBtn = document.querySelector(".expand-btn");
    const sidebar = document.querySelector(".sidebar");

    expandBtn.addEventListener("click", () => {
        sidebar.classList.toggle("collapsed");
    });

    // 🌟 Smooth Scrolling for Sections
    document.querySelectorAll(".sidebar-links a").forEach(link => {
        link.addEventListener("click", function (event) {
            if (this.getAttribute("href").startsWith("#")) {
                event.preventDefault();
                const targetId = this.getAttribute("href").substring(1);
                document.getElementById(targetId).scrollIntoView({
                    behavior: "smooth",
                    block: "start"
                });
            }
        });
    });

    // 🎯 Expandable Mission & Vision
    document.querySelectorAll(".mission-vision h2").forEach(header => {
        header.addEventListener("click", function () {
            let content = this.nextElementSibling;
            if (content.style.display === "none" || content.style.display === "") {
                content.style.display = "block";
                content.style.opacity = 1;
                this.classList.add("expanded");
            } else {
                content.style.display = "none";
                content.style.opacity = 0;
                this.classList.remove("expanded");
            }
        });
    });

    // 🔍 Live Search in Sidebar
    const searchInput = document.getElementById("searchInput");
    searchInput.addEventListener("keyup", function () {
        let filter = searchInput.value.toLowerCase();
        let links = document.querySelectorAll(".sidebar-links a");

        links.forEach(link => {
            let text = link.textContent.toLowerCase();
            if (text.includes(filter)) {
                link.style.display = "flex";
            } else {
                link.style.display = "none";
            }
        });
    });

    // ✨ Hover Effects on Service Cards
    const serviceCards = document.querySelectorAll(".service-card");
    serviceCards.forEach(card => {
        card.addEventListener("mouseenter", () => {
            card.style.transform = "scale(1.1)";
            card.style.boxShadow = "0px 10px 25px rgba(255, 234, 0, 0.6)";
        });

        card.addEventListener("mouseleave", () => {
            card.style.transform = "scale(1)";
            card.style.boxShadow = "0px 5px 15px rgba(255, 234, 0, 0.3)";
        });
    });

    // 🚀 Scroll Animation for Sections
    const sections = document.querySelectorAll("section");
    const observer = new IntersectionObserver(entries => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add("visible");
            }
        });
    }, {
        threshold: 0.3
    });

    sections.forEach(section => {
        observer.observe(section);
    });
});
