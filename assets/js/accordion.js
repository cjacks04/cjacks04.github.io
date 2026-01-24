document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll('.accordion-header').forEach(header => {
    header.addEventListener('click', function () {
      this.parentElement.classList.toggle('active');
    });
  });
});
