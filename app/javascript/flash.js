document.addEventListener("DOMContentLoaded", function() {
    const flashContainer = document.querySelector(".flash-container");

    if (flashContainer) {
        const flashMessages = flashContainer.querySelectorAll(".flash");

        flashMessages.forEach(function(message) {
            message.classList.add("active");
            setTimeout(function() {
                message.style.opacity = 0;
                setTimeout(function() {
                    message.remove();
                }, 300);
            }, 3000);
        });
    }
});
