(function() {
  var app = angular.module("plakat.services");

  app.factory("ServerUrlGenerator", [
  "$http", "HttpUtils", function($http, httpUtils) {
    var host = "http://ec2-54-94-182-59.sa-east-1.compute.amazonaws.com/";
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
