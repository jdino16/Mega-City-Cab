document.addEventListener("DOMContentLoaded", function () {
    const form = document.querySelector("form");

    form.addEventListener("submit", function (event) {
        const pickup = document.getElementById("pickup").value.trim();
        const destination = document.getElementById("destination").value.trim();
        const date = document.getElementById("date").value.trim();

        // Check if all required fields are filled
        if (!pickup || !destination || !date) {
            alert("⚠️ Please fill all fields.");
            event.preventDefault();  // Prevent form submission if fields are empty
        }
    });
});
