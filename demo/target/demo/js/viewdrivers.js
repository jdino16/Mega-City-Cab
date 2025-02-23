// Smooth Scroll for Action Links
document.addEventListener("DOMContentLoaded", function() {
    const links = document.querySelectorAll('.action-link');
    links.forEach(link => {
        link.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(link.getAttribute('href'));
            if (target) {
                window.scrollTo({
                    top: target.offsetTop,
                    behavior: 'smooth'
                });
            }
        });
    });
});
