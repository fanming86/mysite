// {#        实现手机端用手拖动轮播图#}
$(function () {
    $('.carousel').carousel({
        interval: 3000
    });


    var $carousel = $('.carousel');
    var offset = 100;
    var startX, endX;
    $carousel.on("touchstart", function (e) {
        startX = e.originalEvent.touches[0].clientX;
        console.log(startX);
    });
    $carousel.on("touchmove", function (e) {
        endX = e.originalEvent.touches[0].clientX;
    });
    $carousel.on("touchend", function (e) {
        var abs = Math.abs(startX - endX);
        if (abs > offset) {
            $(this).carousel(startX > endX ? "next" : "prev");
        }
    })
})
