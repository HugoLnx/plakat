onload = function() {

var topBar = document.getElementById('topBar');
var mainBar = document.getElementById('mainBar');
var logo = document.querySelector('#logo img');

var currentTop = topBar.offsetTop;
var currentHeight = logo.offsetHeight;
var targetTop = -10;
var targetHeight = -28;
var mainBarTop = 45;

window.onscroll = function(evt)
{
    var landingHeight = document.getElementById('landing').offsetHeight - topBar.offsetHeight - topBar.offsetTop;
    var percent = pageYOffset/landingHeight;
    percent = percent > 1 ? 1 : percent;
    
    topBar.style.top = (currentTop + targetTop * percent) + "px";
    topBar.style.backgroundColor = "rgba(00,00,00," + percent +")"
    logo.style.height = (currentHeight + targetHeight * percent) + "px";
    
    if (mainBar.getAttribute('class') != "fixed" && pageYOffset + mainBarTop >= mainBar.offsetTop)
    {
        mainBar.setAttribute('class', 'fixed');
        mainBar.style.top = mainBarTop + "px";
    }
    else if (pageYOffset + mainBarTop < landingHeight)
    {
        mainBar.setAttribute('class', '');
    }
};

window.onscroll();
};