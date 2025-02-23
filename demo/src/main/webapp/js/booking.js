// This function validates the form before submission
function validateForm() {
    const pickup = document.getElementById("pickup").value;
    const destination = document.getElementById("destination").value;
    const distance = document.getElementById("distance").value;

    // Validate if pickup and destination are not the same
    if (pickup === destination) {
        alert("🚫 Pickup and destination cannot be the same.");
        return false;
    }

    // Validate if distance is greater than 0
    if (distance <= 0) {
        alert("🚫 Distance must be greater than 0.");
        return false;
    }

    // Form is valid if both conditions are passed
    return true;
}

// Adding interactivity to the booking buttons for hover effects
document.addEventListener("DOMContentLoaded", function () {
    const actionBtns = document.querySelectorAll(".action-btn");
    
    // Hover effect on action buttons
    actionBtns.forEach(btn => {
        btn.addEventListener("mouseenter", () => {
            btn.style.transform = "scale(1.05)";
            btn.style.transition = "transform 0.3s ease-in-out";
        });

        btn.addEventListener("mouseleave", () => {
            btn.style.transform = "scale(1)";
        });
    });
});
