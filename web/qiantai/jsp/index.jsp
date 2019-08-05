<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
      <meta charset="utf-8">
      <meta http-equiv="X-UA-Compatible" content="IE=edge">
      <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>index</title>
    <script src="../js/jquery-3.3.1.js"></script>
      <%--bootstrap框架js--%>
     <%-- <script type="text/javascript" src="../js/bootstrap/bootstrap.js"></script>--%>
      <%-- 图片轮播插件js--%>
      <script src="../js/swiper.min.js" type="text/javascript" charset="utf-8"></script>
      <%--图片滚动js--%>
      <script src="../js/header/img_scroll.js" type="text/javascript"></script>
      <%--bootstrap框架css--%>
      <link type="text/css" rel="stylesheet" href="../css/bootstrap/bootstrap.css">
      <%-- 图片轮播插件css--%>
      <link href="../css/swiper.min.css" type="text/css" rel="stylesheet">
        <%--图片轮播自定义样式--%>
      <link href="../css/header/img_scroll.css" rel="stylesheet" type="text/css">
      <style type="text/css">
  /*下部轮播*/
#nav_img img{
    position:absolute;
    left:0;

}
.nav_btn1{
    /*width:110px;*/
    /*height:20px;*/
position: absolute;
    left:47%;
 top:30vw;


          }
.current{
    width: 20px;
    height:20px;
    display: block;
    border-radius: 100%;
    background-color: #ff7c1b;

}
.nav_btn1 a{width:20px;
        height:20px;
        margin-right:10px;
        float:left;
        cursor:pointer;
}
      </style>
  </head>

  <body>
  <%@include file="header.jsp"%>
  <%--<jsp:include page="header.jsp" flush="true"/>--%>
  <div class="container-fluid" style="background: #2d2d2d;">
      <div class="row" style="border-bottom: 2px solid #ff8331">
          <div class="col-md-12 col-lg-12 col-xs-12" >
              <%--图片轮播 start--%>
              <div class="bannerBox">
                  <div class="swiper-container" id="swiper1">
                      <div class="swiper-wrapper swiper-no-swiping" >
                          <div class="swiper-slide color-red">
                              <img class="img-responsive center-block" src="../img/img01.jpg">
                          </div>
                          <div class="swiper-slide color-yellow">
                              <img class="img-responsive center-block" src="../img/img03.jpg">
                          </div>
                          <div class="swiper-slide color-yellow">
                              <img class="img-responsive center-block" src="../img/bg1.jpg">
                          </div>
                          <div class="swiper-slide color-yellow">
                              <img class="img-responsive center-block" src="../img/bj2.jpg">
                          </div>
                          <div class="swiper-slide color-yellow">
                              <img class="img-responsive center-block" src="../img/bg3.jpg">
                          </div>
                      </div>
                  </div>
                  <div class="left"><img src="../img/bannerL.png"></div>
                  <div class="right"><img src="../img/bannerR.png"></div>
              </div><%--图片轮播 end--%>

          </div>
      </div>

     <%-- <div class="row">
          <div class="col-md-6 col-md-offset-3"  style="color: white;font-family: 'Adobe Caslon Pro Bold'">
              <h1 class="text-center">Welcome To Exclusive Hotel</h1>
          </div>
      </div>--%>
      <div class="row">
              <div class="col-lg-12" style="padding-left: 0;padding-right: 0">
                  <img src="../img/wnsgj_02.jpg" class="img-responsive">
              </div>

      </div>

    <%--覆盖层--%>
      <div class="row">
          <div class="col-lg-12 col-md-12" style="background: blue">
              <div id="nav_img">
              <img src="../img/wnsgj_04.jpg" class="img-responsive">
              <img src="../img/wnsgj_05.jpg" class="img-responsive">
              <img src="../img/wnsgj_06.jpg" class="img-responsive">
              <dt class="nav_btn1">
                  <a class="current" style="width:20px;height: 20px;border-radius: 100%;border: 2px solid #ff9722;"></a>
                  <a style="width:20px;height: 20px;border-radius: 100%;border: 2px solid #ff9722;"></a>
                  <a style="width:20px;height: 20px;border-radius: 100%;border: 2px solid #ff9722;"></a>
              </dt>
            </div>
          </div>
      </div>
      <div class="row" style="margin-top: 447px;" >
          <div class="col-lg-12" style="padding-left: 0;padding-right: 0">
              <img src="../img/wnsgj_07.jpg" class="img-responsive">
          </div>
      </div>
  </div>
<%--<div class="container-fluid">

</div>--%>

  </body>
<script type="text/javascript">

    //下部轮播
    var n = 0;
    $("#nav_img img").hide();
    //这个类下面的img，隐藏  $()= document.getElementById(),隐藏两张
    $("#nav_img img").eq(0).show();
    $(".nav_btn1 a").click(function(){
      //类的a标签，点击的时候触发function函数，
        $(".nav_btn1 a").removeClass("current");//触发function里面函数类的a，删除class；
        $(this).addClass("current");//当前元素给予class；
        n=$(".nav_btn1 a").index(this);//n等于类a标签的位置
        $("#nav_img img").fadeOut();//类的img 效果是渐隐  全部淡出
        $("#nav_img img").eq(n).fadeIn();//类的img的n值渐显   当前的淡入
    });
    function showImg(){
        if(n<$("#nav_img img").length-1){
            n = n+1;
        }else{
            n = 0;
        }
        /*点击小圆圈触发*/
        $("#nav_img img").fadeOut(2000);
        $("#nav_img img").eq(n).fadeIn(2000);
        $(".nav_btn1 a").removeClass("current");
        $(".nav_btn1 a").eq(n).addClass("current");
    }

    var set=setInterval(showImg,3000);


</script>

  <%--图片轮播自定义js   放在前面无效--%>
  <script src="../js/header/img_scroll.js" type="text/javascript"></script>

</html>