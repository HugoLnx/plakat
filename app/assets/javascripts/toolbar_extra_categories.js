(function() {
  var HIDDEN_CLASS = "hidden-list";

  function OpenableList(listWrapper) {
    var verticalList = listWrapper.querySelector(".vertical-list");
    var openLink = listWrapper.querySelector(".open-list");

    function openDropdown(event) {
      event.stopPropagation();
      verticalList.classList.remove(HIDDEN_CLASS);
      this.removeEventListener("click", openDropdown);

      window.addEventListener("click", closeDropdown);
    }

    function closeDropdown(event) {
      verticalList.classList.add(HIDDEN_CLASS);
      this.removeEventListener("click", closeDropdown);
      setOpenOnClickEvent();
    }

    function setOpenOnClickEvent() {
      openLink && openLink.addEventListener("click", openDropdown);
    }

    setOpenOnClickEvent();
  }

  var listWrappers = document.querySelectorAll(".list-wrapper");

  for(var i = 0; i<listWrappers.length; i++) {
    var listWrapper = listWrappers[i];
    OpenableList(listWrapper);
  }
})();
