document.addEventListener("DOMContentLoaded", function () {
    // Add hover effect for buttons
    const submitButtons = document.querySelectorAll("button[type='submit']");
    submitButtons.forEach(btn => {
        btn.addEventListener("mouseenter", () => {
            btn.style.transform = "scale(1.05)";  // Slight scale effect
            btn.style.transition = "transform 0.3s ease-in-out";  // Smooth transition
        });

        btn.addEventListener("mouseleave", () => {
            btn.style.transform = "scale(1)";  // Reset scale when mouse leaves
        });
    });

    // For better form submission experience, show success message
    const form = document.querySelector("form");
    if (form) {
        form.addEventListener("submit", function (e) {
            e.preventDefault();  // Prevent the default form submission

            // Collect form data
            const subject = document.getElementById("subject").value;
            const message = document.getElementById("message").value;

            // Validate if subject and message are filled
            if (!subject || !message) {
                alert("🚫 Please fill all the fields.");
                return;
            }

            // Show loading message or spinner (you can add a spinner element for a better visual effect)
            const loadingMessage = document.createElement("div");
            loadingMessage.textContent = "Submitting your inquiry...";
            loadingMessage.style.color = "#FFEA00";  // Yellow color
            loadingMessage.style.textAlign = "center";
            loadingMessage.style.fontSize = "1.5rem";
            document.body.appendChild(loadingMessage);

            // Simulate form submission (for now, we are simulating this step)
            setTimeout(() => {
                // Show success message after "submission"
                alert("✅ Your inquiry has been submitted successfully!");
                // Optionally, reset the form
                form.reset();
                document.body.removeChild(loadingMessage);
            }, 2000); // Simulate a delay of 2 seconds (this could be replaced with actual AJAX requests in real-world apps)
        });
    }

    // Add smooth scroll for support history table
    const supportHistoryTable = document.querySelector(".support-history table");
    if (supportHistoryTable) {
        supportHistoryTable.style.scrollBehavior = "smooth";
    }
});
