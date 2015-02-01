//= require toolbar_categories_adjuster

(function() {
  window.addEventListener("resize", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });

  window.addEventListener("load", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });
})();
