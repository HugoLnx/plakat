//= require toolbar_categories_adjuster
//= require toolbar_extra_categories

(function() {
  window.addEventListener("resize", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });

  window.addEventListener("load", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });
})();
