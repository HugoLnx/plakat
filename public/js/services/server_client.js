(function() {
  var app = angular.module("plakat.services");

  app.factory("ServerClient", [
  "$http", "ServerUrlGenerator", function($http, url) {
    return {
      getPosters: function(term, category) {
        return $http({method: "GET", url: url.posters.index(term, category)});
      }
    };
  }]);
}());
