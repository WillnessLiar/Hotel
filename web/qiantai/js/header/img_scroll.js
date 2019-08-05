
var mySwiper1 = new Swiper('#swiper1',{
    loop: true,
    autoplay : 2500,
    speed : 600,
    autoplayDisableOnInteraction : false
});

//前进后退按钮
$(".left").click(function(){
    mySwiper1.slidePrev();
    mySwiper2.slidePrev();
})
$(".right").click(function(){
    mySwiper1.slideNext();
    mySwiper2.slideNext();
})