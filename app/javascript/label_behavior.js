document.addEventListener("DOMContentLoaded", function() {
    const inputLabels = document.querySelectorAll(".input-label");
  
    inputLabels.forEach(function(label) {
      const input = label.nextElementSibling;
  
      input.addEventListener("focus", function() {
        label.classList.add("focused");
      });
  
      input.addEventListener("blur", function() {
        if (!input.value) {
          label.classList.remove("focused");
        }
      });
  
      if (input.value) {
        label.classList.add("focused");
      }
    });
  });
  