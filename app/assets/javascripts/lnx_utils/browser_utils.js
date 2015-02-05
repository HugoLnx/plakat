if (typeof LNX_UTILS === "undefined") LNX_UTILS = {};
if (typeof LNX_UTILS.BrowserUtils === "undefined") LNX_UTILS.BrowserUtils = {};

(function(namespace) {
  var BrowserUtils = namespace.BrowserUtils;

  BrowserUtils.reloadPage = function() {
    document.location.href = document.location.href;
    document.location.reload();
  };  
}(LNX_UTILS));
