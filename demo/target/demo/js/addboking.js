document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("bookingForm");

    form.addEventListener("submit", function(e) {
        const pickup = document.getElementById("pickup").value.trim();
        const destination = document.getElementById("destination").value.trim();
        const customerName = document.getElementById("customerName").value.trim();
        const phone = document.getElementById("phone").value.trim();

        // Basic form validation
        if (!pickup || !destination || !customerName || !phone) {
            e.preventDefault(); // Prevent form submission
            alert("Please fill out all required fields!");
        } else if (!/^\d{10}$/.test(phone)) {
            e.preventDefault();
            alert("Please enter a valid 10-digit phone number.");
        }
    });
});
