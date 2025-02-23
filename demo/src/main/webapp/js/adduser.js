document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("userForm");

    form.addEventListener("submit", function(e) {
        const name = document.getElementById("name").value.trim();
        const email = document.getElementById("email").value.trim();
        const password = document.getElementById("password").value.trim();
        const nic = document.getElementById("nic").value.trim();
        const phone = document.getElementById("phone").value.trim();
        const role = document.getElementById("role").value.trim();

        // Basic form validation
        if (!name || !email || !password || !nic || !phone || !role) {
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
