document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById("loginForm");

    // Adding smooth scroll on page load
    window.scrollTo(0, 0);

    // Quick actions for smooth transition
    const actionBtns = document.querySelectorAll(".action-btn");
    actionBtns.forEach(btn => {
        btn.addEventListener("mouseenter", () => {
            btn.style.transform = "scale(1.05)";
            btn.style.transition = "transform 0.3s ease-in-out";
        });

        btn.addEventListener("mouseleave", () => {
            btn.style.transform = "scale(1)";
        });
    });

    // Smooth transition to profile on click
    document.querySelector(".profile-link").addEventListener("click", function () {
        window.location.href = "profile1.jsp"; // Directs to profile page
    });

    // Dynamic content interaction for dashboard (optional)
    const username = sessionStorage.getItem("username");
    if (username) {
        document.getElementById("welcomeUser").textContent = `Welcome back, ${username}!`;
    }
});
