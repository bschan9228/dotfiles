document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("tbody tr").forEach(row => {
    row.addEventListener("click", function () {
      document.querySelectorAll("tbody tr.selected")
        .forEach(r => r.classList.remove("selected"));
      this.classList.add("selected");
    });
  });
});
