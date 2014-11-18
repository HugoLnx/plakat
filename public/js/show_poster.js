(function() {
  $(function() {
    var $shadowDiv = $(".posters-shadow");

    var $shadowPoster = $(".poster-shadow");
    var $shadowTitle = $shadowPoster.find(".poster-title");
    var $shadowDescription = $shadowPoster.find(".poster-description");
    var $shadowImage = $shadowPoster.find(".poster-image");

    $("#posters").on("click", ".poster", function(event) {
      var $poster = $(this);
      var title = $poster.data("title");
      var description = $poster.data("description");
      var imageUrl = $poster.data("image");

      $shadowTitle.text(title);
      $shadowDescription.text(description);
      //$shadowImage.attr("src", imageUrl);
      $shadowDiv.fadeIn(200);
      $(document.body).css("overflow-y", "none");
    });

    $shadowPoster.on("click", function() {
      $shadowDiv.fadeOut(200);
    });
  });
}());
