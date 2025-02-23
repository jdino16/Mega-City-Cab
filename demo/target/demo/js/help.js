document.addEventListener("DOMContentLoaded", function () {

    /* 📌 FAQ Accordion */
    const faqItems = document.querySelectorAll(".faq-question");
    faqItems.forEach((question) => {
        question.addEventListener("click", function () {
            const answer = this.nextElementSibling;
            const icon = this.querySelector("i");

            // Toggle answer visibility
            if (answer.style.display === "block") {
                answer.style.display = "none";
                icon.classList.remove("fa-minus");
                icon.classList.add("fa-plus");
            } else {
                answer.style.display = "block";
                icon.classList.remove("fa-plus");
                icon.classList.add("fa-minus");
            }
        });
    });

    /* 🔍 Live Search for Help Topics */
    const searchInput = document.getElementById("searchInput");
    searchInput.addEventListener("keyup", function () {
        let filter = searchInput.value.toLowerCase();
        let topics = document.querySelectorAll(".help-content h3, .help-content p");

        topics.forEach(topic => {
            if (topic.innerText.toLowerCase().includes(filter)) {
                topic.style.display = "";
            } else {
                topic.style.display = "none";
            }
        });
    });

    /* 🚀 Sidebar Toggle */
    const sidebar = document.querySelector(".sidebar");
    const expandBtn = document.querySelector(".expand-btn");
    expandBtn.addEventListener("click", function () {
        sidebar.classList.toggle("collapsed");
    });

});
