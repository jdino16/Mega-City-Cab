document.addEventListener("DOMContentLoaded", function() {
    const form = document.getElementById("paymentForm");

    form.addEventListener("submit", function(e) {
        const user_id = document.getElementById("user_id").value.trim();
        const booking_id = document.getElementById("booking_id").value.trim();
        const amount = document.getElementById("amount").value.trim();
        const payment_method = document.getElementById("payment_method").value.trim();
        const status = document.getElementById("status").value.trim();

        // Basic form validation
        if (!user_id || !booking_id || !amount || !payment_method || !status) {
            e.preventDefault(); // Prevent form submission
            alert("Please fill out all required fields!");
        }
    });
});
