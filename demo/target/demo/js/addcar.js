document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("carForm");

    form.addEventListener("submit", function(e) {
        const carName = document.getElementById("carName").value.trim();
        const carModel = document.getElementById("carModel").value.trim();
        const carType = document.getElementById("carType").value.trim();
        const year = document.getElementById("year").value.trim();
        const registrationNumber = document.getElementById("registrationNumber").value.trim();
        const status = document.getElementById("status").value.trim();

        // Basic form validation
        if (!carName || !carModel || !carType || !year || !registrationNumber || !status) {
            e.preventDefault(); // Prevent form submission
            alert("Please fill out all required fields!");
        }
    });
});
