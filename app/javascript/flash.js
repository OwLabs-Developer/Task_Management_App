document.addEventListener("DOMContentLoaded", function() {
    const flashMessages = document.querySelectorAll(".alert");

    flashMessages.forEach(function(message) {
        setTimeout(function() {
            message.style.opacity = 0;
            setTimeout(function() {
                message.remove();
            }, 500);
        }, 3000);
    });
});