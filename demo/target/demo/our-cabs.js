document.addEventListener("DOMContentLoaded", function () {
    // 🚀 Sidebar Toggle
    document.querySelector(".expand-btn").addEventListener("click", () => {
        document.querySelector(".sidebar").classList.toggle("collapsed");
    });
});
