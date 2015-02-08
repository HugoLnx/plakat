(function() {
  var plak = document.querySelector(".plak");
  var topMenu = document.querySelector(".top-menu");
  var image = plak.querySelector("img");
  image.addEventListener("load", setImageKlass);
  if (image.complete) setImageKlass();

  function setImageKlass() {
    var klass = "square";
    if (image.width > image.height) {
      klass = "landscape";
    } else if(image.height > image.width) {
      klass = "portrait";
    }
    plak.classList.add(klass);
    topMenu.classList.add(klass);
  }
}());
