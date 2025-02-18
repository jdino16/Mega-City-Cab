document.addEventListener("DOMContentLoaded", function () {
    // 🚀 Sidebar Toggle
    document.querySelector(".expand-btn").addEventListener("click", () => {
        document.querySelector(".sidebar").classList.toggle("collapsed");
    });

    // 🎭 Edit Profile Button
    document.querySelector(".edit-btn").addEventListener("click", function () {
        alert("Profile editing feature coming soon!");
    });

    // 🚪 Logout Button
    document.querySelector(".logout-btn").addEventListener("click", function () {
        alert("Logging out...");
        window.location.href = "index.jsp"; // Redirect to homepage after logout
    });
});
