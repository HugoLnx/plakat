(function() {
  var app = angular.module("plakat.controllers");

  app.controller("PostersListController", [
    "ServerClient", "SearchSignal", function(client, searchSignal) {

      function updatePosters(term, category) {
        client.getPosters(term, category).success(function(posters) {
          ctrl.posters = posters;
        });
      }

      (function() {
        var timeoutId = null
        $("#search-field").on("keydown", function(event) {
          var $field = $(this);
          clearTimeout(timeoutId);
          timeoutId = setTimeout(function() {
            updatePosters($field.val());
          }, 500);
        });
      }());

      var ctrl = this;

      ctrl.posters = [];
      updatePosters();

      //searchSignal.onSearch(function(term, category) {
      //  updatePosters(term, category);
      //});
  }]);
}());
