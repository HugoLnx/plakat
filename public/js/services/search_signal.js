(function() {
  var app = angular.module("plakat.services");

  app.factory("SearchSignal", [
    "$rootScope", function($rootScope) {
      var obj = {};

      obj.emitSearch = function(term, category) {
        $rootScope.$emit("signal-on-search", term, category);
      };

      obj.onSearch = function(scope, callback) {
        var unbind = $rootScope.$on('signal-on-search', callback)
        scope.$on('$destroy', unbind);
      };

      return obj;
  }]);
}());
