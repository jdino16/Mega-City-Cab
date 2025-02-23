document.addEventListener("DOMContentLoaded", function () {
    // Adding hover effect for interactive buttons
    const actionBtns = document.querySelectorAll("button[type='submit']");
    
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
