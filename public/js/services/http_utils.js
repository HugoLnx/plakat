(function() {
  var app = angular.module("plakat.services");

  app.factory("HttpUtils", function() {
    return {
      toParams: function(params) {
        var str = "";
        for(var key in params) {
          if (params[key]) {
            str += "&" + key + "=" + params[key];
          }
        }
        return str.replace("&", "?");
      }
    };
  });
}());
