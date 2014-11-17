(function() {
  var app = angular.module("plakat.services");

  app.factory("ServerUrlGenerator", [
  "$http", "HttpUtils", function($http, httpUtils) {
    var host = "http://www.plakat.com.br/";
    return {
      posters: {
        index: function(term, category){
          var term = term || "";
          var category = category || "";
          var params = {
            term: term,
            category: category,
            page: 1,
            per_page: 1000
          };
          return host + "/posters.json" + httpUtils.toParams(params);
        }
      }
    };
  }]);
}());
