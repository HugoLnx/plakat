if (typeof PLAKAT === "undefined") PLAKAT = {};

PLAKAT.ToolbarCategoriesAdjuster = (function() {
  var _M = {};

  var HIDDEN_CLASS = "hidden-item"; 
  var MAX_ITEMS_DESKTOP = 3;
  var MAX_ITEMS_MOBILE = 1;

  var categoryItems = document.querySelectorAll(".categories-horizontal-list .category-item");
  var categoryExtra = document.querySelector(".categories-horizontal-list .extra-categories");
  var categoryExtraNumber = categoryExtra.querySelector(".extra-categories-number");
  var categoriesLabel = categoryExtra.querySelector(".extra-categories-mobile-label");

  _M.adjustCategoriesToolbar = function() {
    var isDesktop = window.innerWidth >= 640;
    if (isDesktop && categoryItems.length > MAX_ITEMS_DESKTOP) {
      reduceCategoriesVisibleTo(MAX_ITEMS_DESKTOP)
    } else if (categoryItems.length > 0) {
      categoryExtra.classList.remove(HIDDEN_CLASS);
      categoryExtraNumber.classList.add(HIDDEN_CLASS);
      categoriesLabel.classList.remove(HIDDEN_CLASS);
    }
  };

  function reduceCategoriesVisibleTo(qntCategories) {
    categoriesLabel.classList.add(HIDDEN_CLASS);
    for(var i = 0; i < qntCategories; i++) {
      var categoryItem = categoryItems[i];
      categoryItem.classList.remove(HIDDEN_CLASS);
    }
    for(var i = qntCategories; i<categoryItems.length; i++) {
      var categoryItem = categoryItems[i];
      categoryItem.classList.add(HIDDEN_CLASS);
    }
    if (qntCategories === categoryItems.length) {
      categoryExtra.classList.add(HIDDEN_CLASS);
      categoryExtraNumber.classList.add(HIDDEN_CLASS);
    } else {
      categoryExtra.classList.remove(HIDDEN_CLASS);
      categoryExtraNumber.classList.remove(HIDDEN_CLASS);
    }
    categoryExtraNumber.textContent = categoryItems.length - qntCategories;
  }

  return _M;
})();

