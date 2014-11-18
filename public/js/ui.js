$(function()
{
$('a[href*="#"]').click(function(evt) {
    evt.preventDefault();
});

// header
var statusBarPaddingTop = $('#statusBar').css('padding-top').substring(-1, 2);
var statusBarFinalPaddingTop = 10;
var titleBarTop = $('#titleBar').position().top;
var logoHeight = 70;
var logoFinalHeight = 25;
var modalAnimating = false;
$(window).scrollTop(0);


setInterval(function() {
    var cacete = $('#titleBar').offset().top + $('#titleBar').outerHeight();
    
    if ($('.plak-modal-edit').css('visibility') == 'visible' && !modalAnimation && $('.plak-modal-edit').position().top > cacete )
    {
        $('.plak-modal-edit').stop().animate({top: cacete + "px"}, 20);
    }
    
    if ($('.plak-modal-view').css('visibility') == 'visible' && !modalAnimation && $('.plak-modal-view').position().top > cacete )
    {
        $('.plak-modal-view').stop().animate({top: cacete + "px"}, 20);
    }
}, 30);

$(window).scroll(function()
{
    var scrollTop = $(this).scrollTop();
    var statusBarHeight = $('#statusBar').outerHeight();
    var landingHeight = $('#landing').height();
    var percent = scrollTop / (landingHeight - statusBarHeight);
    percent = percent > 1 ? 1 : percent;
    
    var finalHeight = logoHeight - (logoHeight - logoFinalHeight) * percent;
    var finalPaddingTop = statusBarPaddingTop - statusBarFinalPaddingTop * percent;
    
    $('#statusBar').css({paddingTop: finalPaddingTop, backgroundColor: "rgba(00,00,00,"+ percent +")"});
    $('#statusBar img').css({height: finalHeight});
    
    if (percent >= 1)
    {
        $('#statusBar').addClass('fixed');
    }
    else
    {
        $('#statusBar').removeClass('fixed');
    }
    
    if (scrollTop + statusBarHeight >= titleBarTop && !$('#titleBar').hasClass('fixed'))
    {
        $('#titleBar').addClass('fixed');
        $('#posters').addClass('fixed');
    }
    else if (scrollTop + statusBarHeight < landingHeight)
    {
        $('#titleBar').removeClass('fixed');
        $('#posters').removeClass('fixed');
    }
});

$('#categories a').click(function() {
    $('#categoriesMenu').slideToggle();
});

$('#write a').click(function() {
    modalAnimation = true;
    $('.plak-modal-bg').fadeIn(300);
    $('.plak-modal-edit').css('visibility', 'visible').stop().animate({top:$('#titleBar').offset().top + $('#titleBar').outerHeight() + "px"}, 700, function() {
        modalAnimation = false;
    });
});

$('.poster a').click(function() {
    modalAnimation = true;
    $('.plak-modal-bg').fadeIn(300);
    $('.plak-modal-view').css('visibility', 'visible').stop().animate({top:$('#titleBar').offset().top + $('#titleBar').outerHeight() + "px"}, 700, function() {
        modalAnimation = false;
    });
});

$('.plak-modal-bg').click(function() {
    $(this).fadeOut(300);
    $('.plak-modal').stop().animate({top:"-960px"}, 700, function () {
        $('.plak-modal').css('visibility', 'hidden');
    });
});
});
