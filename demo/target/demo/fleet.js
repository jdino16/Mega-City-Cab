document.addEventListener("DOMContentLoaded", function () {
    // 🚀 Select Fleet Elements
    const fleetContainer = document.querySelector(".fleet-container");
    const prevBtn = document.querySelector(".prev-btn");
    const nextBtn = document.querySelector(".next-btn");
    const filterButtons = document.querySelectorAll(".filter-btn");
    const fleetCards = document.querySelectorAll(".fleet-card");

    let isScrolling = false;

    // 🔄 Auto-Scroll Function (Scrolls Every 7 Seconds)
    function autoScroll() {
        if (!isScrolling) {
            fleetContainer.scrollBy({ left: 350, behavior: "smooth" });
            setTimeout(() => fleetContainer.scrollBy({ left: -350, behavior: "smooth" }), 7000);
        }
    }
    setInterval(autoScroll, 7000);

    // 🎯 Manual Fleet Slider Controls
    prevBtn.addEventListener("click", () => {
        isScrolling = true;
        fleetContainer.scrollBy({ left: -350, behavior: "smooth" });
        setTimeout(() => (isScrolling = false), 5000);
    });

    nextBtn.addEventListener("click", () => {
        isScrolling = true;
        fleetContainer.scrollBy({ left: 350, behavior: "smooth" });
        setTimeout(() => (isScrolling = false), 5000);
    });

    // 🔍 Fleet Filtering Functionality
    filterButtons.forEach((btn) => {
        btn.addEventListener("click", function () {
            const category = this.getAttribute("data-category");

            // Remove active class from all buttons
            filterButtons.forEach((btn) => btn.classList.remove("active"));
            this.classList.add("active");

            // Show/Hide Fleet Cards Based on Category
            fleetCards.forEach((card) => {
                if (category === "all" || card.getAttribute("data-category") === category) {
                    card.style.display = "flex"; // Show
                } else {
                    card.style.display = "none"; // Hide
                }
            });
        });
    });

    // 🚀 Sidebar Toggle
    document.querySelector(".expand-btn").addEventListener("click", () => {
        document.querySelector(".sidebar").classList.toggle("collapsed");
    });

    // ✨ Fleet Card Hover Effects
    fleetCards.forEach((card) => {
        card.addEventListener("mouseenter", function () {
            this.style.transform = "scale(1.1)";
            this.style.boxShadow = "0px 5px 15px rgba(255, 234, 0, 0.8)";
        });

        card.addEventListener("mouseleave", function () {
            this.style.transform = "scale(1)";
            this.style.boxShadow = "0px 0px 10px rgba(255, 234, 0, 0.3)";
        });
    });
});
