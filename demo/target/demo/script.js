document.addEventListener("DOMContentLoaded", function () {
    // 🚀 Show Popup After 3 Seconds
    setTimeout(() => {
        document.getElementById("popup").classList.add("active");
    }, 3000);

    // 🛑 Close Popup
    window.closePopup = function () {
        document.getElementById("popup").classList.remove("active");
    };

    // 🚀 Hide Loading Screen After Delay
    setTimeout(() => {
        const loadingScreen = document.querySelector(".loading-screen");
        if (loadingScreen) {
            loadingScreen.style.opacity = "0";
            setTimeout(() => loadingScreen.style.display = "none", 500);
        }
    }, 3000);

    // ⏳ Real-time Date & Time
    function updateTime() {
        document.getElementById("realTime").textContent = new Date().toLocaleString();
    }
    setInterval(updateTime, 1000);
    updateTime();

    // 🎭 Sidebar Toggle
    document.querySelector(".expand-btn").addEventListener("click", () => {
        document.querySelector(".sidebar").classList.toggle("collapsed");
    });

    // 📍 Location Section Toggle
    const toggleBtn = document.getElementById("toggleLocationBtn");
    const locationSection = document.getElementById("locationSection");

    toggleBtn.addEventListener("click", function () {
        if (locationSection.classList.contains("hidden")) {
            locationSection.classList.remove("hidden");
            toggleBtn.innerHTML = `<i class="fas fa-map-marker-alt"></i> Hide Location & Contact`;
        } else {
            locationSection.classList.add("hidden");
            toggleBtn.innerHTML = `<i class="fas fa-map-marker-alt"></i> Show Location & Contact`;
        }
    });

    // 🚀 Floating Contact Icons Animation
    function animateFloatingContacts() {
        let contactIcons = document.querySelectorAll(".contact-icon");
        contactIcons.forEach(icon => {
            let randomX = (Math.random() - 0.5) * 4;
            let randomY = (Math.random() - 0.5) * 4;
            icon.style.transform = `translate(${randomX}px, ${randomY}px)`;
        });
    }
    setInterval(animateFloatingContacts, 2500);

    // ✅ Function to Go to Home Page with Button Animation
    window.goToHome = function () {
        let button = document.querySelector(".order-btn");
        button.classList.add("clicked");

        // Change text to "Redirecting..."
        button.querySelector(".default-text").style.opacity = "0";
        button.querySelector(".success-text").style.opacity = "1";

        // Redirect after animation
        setTimeout(() => {
            window.location.href = "index.jsp"; // Redirect to home page
        }, 1500);
    };
});
