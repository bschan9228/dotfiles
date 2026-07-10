document.addEventListener("DOMContentLoaded", function () {
  document.querySelectorAll("tbody tr").forEach(row => {
    row.addEventListener("click", function () {
      const isSelected = this.classList.contains("selected");
      document.querySelectorAll("tbody tr.selected")
        .forEach(r => r.classList.remove("selected"));
      if (!isSelected) {
        this.classList.add("selected");
      }
    });
  });
});
