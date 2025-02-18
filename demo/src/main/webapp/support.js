document.addEventListener("DOMContentLoaded", function () {
    document.querySelector("form").addEventListener("submit", function (event) {
        const subject = document.getElementById("subject").value.trim();
        const message = document.getElementById("message").value.trim();

        if (!subject || !message) {
            alert("⚠️ Please fill in all fields.");
            event.preventDefault();
        }
    });
});
