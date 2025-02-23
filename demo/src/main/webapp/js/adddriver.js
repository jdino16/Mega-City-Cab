document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("driverForm");

    form.addEventListener("submit", function(e) {
        const driverName = document.getElementById("driverName").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const carModel = document.getElementById("carModel").value.trim();
        const status = document.getElementById("status").value.trim();

        // Basic form validation
        if (!driverName || !phone || !carModel || !status) {
            e.preventDefault(); // Prevent form submission
            alert("Please fill out all required fields!");
        }

        // Validate phone number (simple check)
        if (!/^\d{10}$/.test(phone)) {
            e.preventDefault();
            alert("Please enter a valid 10-digit phone number.");
        }
    });
});
