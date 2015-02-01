(function() {
  var HIDDEN_CLASS = "hidden-list";

  var categoryExtra = document.querySelector(".extra-categories");
  var categoriesVerticalList = document.querySelector(".categories-vertical-list");

  function openDropdown(event) {
    event.stopPropagation();
    categoriesVerticalList.classList.remove(HIDDEN_CLASS);
    this.removeEventListener("click", openDropdown);

    window.addEventListener("click", closeDropdown);
  }

  function closeDropdown(event) {
    categoriesVerticalList.classList.add(HIDDEN_CLASS);
    this.removeEventListener("click", closeDropdown);
    setOpenOnClickEvent();
  }

  function setOpenOnClickEvent() {
    categoryExtra.addEventListener("click", openDropdown);
  }

  setOpenOnClickEvent();
})();
