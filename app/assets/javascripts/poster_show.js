//= require toolbar_categories_adjuster
//= require toolbar_extra_categories
//= require lnx_utils/browser_utils
//= require image_orientation

(function() {
  window.addEventListener("resize", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });

  window.addEventListener("load", function() {
    PLAKAT.ToolbarCategoriesAdjuster.adjustCategoriesToolbar();
  });

  window.onpopstate = function(event) {
    LNX_UTILS.BrowserUtils.reloadPage();
  };
})();
