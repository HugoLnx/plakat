(function() {
  var app = angular.module("plakat.controllers");

  app.controller("SearchController", [
    "ServerClient", "SearchSignal", function() {

      var ctrl = this;

      ctrl.term = "";

      //searchSignal.onSearch(function(term, category) {
      //  updatePosters(term, category);
      //});
  }]);
}());
