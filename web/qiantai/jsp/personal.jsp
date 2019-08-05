<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 我不管我最帅
  Date: 2018/6/5
  Time: 14:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>personal</title>

    <script src="/qiantai/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/qiantai/js/bootstrap/bootstrap.js"></script>
    <link type="text/css" rel="stylesheet" href="/qiantai/css/bootstrap/bootstrap.css">
    <%--样式--%>
    <link rel="stylesheet" href="/qiantai/css/personal/personal.css">
    <%-- 评价样式--%>
    <link href="/qiantai/css/public/public.css" rel="stylesheet">
    <%--好评插件--%>
    <link type="text/css" rel="stylesheet" href="/qiantai/css/public/jquery-labelauty.css">
    <%--星星插件--%>
    <link rel="stylesheet" type="text/css" href="/qiantai/css/public/demo.css" />
</head>
<body>
<%@include file="header.jsp"%>
<div class="container-fluid">
    <div class="row">
    <div class="col-lg-2 col-md-2 " style="margin-left: -15px;">
        <ul class="list-group">
            <li class="list-group-item hov" id="option_1" onclick="waiFinish()">
                <img src="/qiantai/img/header/icon7.png" class="img_size">
<s:if test="${sessionScope.bookSum!=0}"> <span class="badge badge_color"><s:out value="#session.bookSum"/><s:out value="${sessionScope.bookSum}"/> </span></s:if>
                待完成
            </li>
            <li onclick="waitReviews()" class="list-group-item hov" id="option_2">
                <img src="/qiantai/img/header/icon9.png" class="img_size">
                <s:if test="${sessionScope.reviewSum!=0}"> <span class="badge badge_color"><s:out value="${sessionScope.reviewSum}"/></span></s:if>
                待评价
            </li>
           <%-- <li class="list-group-item hov" id="option_3">
                <img src="../img/header/icon8.png" class="img_size">

                个人设置
            </li>--%>
            <li onclick="showAll()" class="list-group-item hov" id="option_4">
                <img src="/qiantai/img/header/icon10.png" class="img_size">

                更多订单
            </li>

        </ul>
    </div>
        <div class="col-lg-10 " style="background:#f2f5f7" id="show_info">  <%--showinfo--%>

            <div class="container-fluid " id="container_id" style="background: rgb(253,255,255);font-family: 幼圆;color: black"> <%--container--%>
                <div class="row" id="showBookInfo">
                    <%--<div class=" col-lg-4 col-md-4 col-sm-8 col-xs-12" style="background: #fafdff;box-shadow: 2px 2px 10px #a5a5a5"> &lt;%&ndash;1/4&ndash;%&gt;
                        <div class="row" style="margin-top: 4vh">
                            <div class="col-lg-8 col-md-8 col-xs-8">
                                <p><span class="o_fc">订单状态:</span><span>未完成</span></p>
                                <p><span class="o_fc">订单编号:</span><span>2018052500965</span></p>
                            </div>
                            <div class="col-lg-3 col-md-3 col-xs-3">
                                <br/>
                                <a class="btn btn-success">完成</a>
                            </div>
                        </div>

                        <hr style="border:1px dashed #987cb9;width:100%;color:#987cb9;">   &lt;%&ndash;水平线&ndash;%&gt;
                        <div class="row">
                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
                                <div  class="gallery" style="height:70px;width:70px; "><a href="#pic_one"><img src="../img/room01.jpg" class="" style="width:70px;height:70px;cursor: pointer"></a></div>
                            </div>
                            <div class="col-lg-5 col-md-5 col-sm-4  col-xs-5 ">
                                <p><span class="o_fc">房间类型:</span><span>标准小客房</span></p>
                                <p><span class="o_fc">房间号:</span><span>203</span></p>
                            </div>
                            <div class="col-lg-3 col-md-3 col-sm-4  col-xs-4">
                                <br/><br/>
                                <button class=" btn btn-warning" >退订</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4  col-xs-4 o_fc">
                                <p>入住时间:</p>
                                <p>离店日期:</p>
                                <p>预订人姓名:</p>
                                <p>预订人号码:</p>
                            </div>
                            <div class="col-md-offset-3 col-xs-offset-3  col-sm-offset-3 col-lg-4 col-md-4 col-sm-3  col-xs-4"><p>2018-05-26</p>
                                <p>2018-05-26</p>
                                <p>未来~</p>
                                <p>13609014704</p>

                            </div>

                        </div>
                        <hr style="border:1px dashed #987cb9;width:100%;color:#987cb9;"> &lt;%&ndash;水平线&ndash;%&gt;
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"><p class="o_fc">创建时间:</p></div>
                            <div class="col-md-offset-3 col-xs-offset-3 col-sm-offset-3 col-lg-4 col-md-4 col-sm-4  col-xs-4">2018-05-26</div>
                        </div>
                    </div> --%> <%--1/4--%>

                </div>
            </div>  <%--container--%>


        </div> <%--showinfo--%>
    </div>
</div>

<%--评论弹窗--%>
<div class="modal fade" id="publicModal" tabindex="-1" role="dialog" aria-labelledby="publicModal " aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4>发表评价</h4>
            </div>
            <div class="modal-body">
            <%--    <form class="form" role="form" name="public_form">--%>
                    <input id="curbookId" hidden> <%-- 传过来的bookId--%>
                    <input id="cuId" value="<s:out value="${sessionScope.cub.cusId}"/>" hidden>
                    <%--评级--%>
                    <div class="form-group">
                        <ul class="dowebok" style="margin-left: -37px;">
                            <li><input type="radio" name="radio" value="好评" data-labelauty="好评"></li>
                            <li><input type="radio" name="radio" value="中评" data-labelauty="中评"></li>
                            <li><input type="radio" name="radio" value="差评" data-labelauty="差评"></li>

                        </ul>
                    </div>
                    <%--评价内容--%>
                    <div class="form-group">
                        <textarea  name="pbtxt" id="pbtxt" class="form-control " rows="5"  placeholder="酒店舒适度和性价比您还满意嘛？说说您的感受和它需改进的地方"></textarea>
                    </div>
                    <%--满意度--%>
                    <div class="form-group">
                        <div id="demo6" class="demo">
                            <span class="level" style="color:#414141">满意度</span>&nbsp;
                            <span class="ratyli"></span>&nbsp;
                            <span id="level" class="level"></span>
                            <input type="text" value="" id="start" name="start" hidden>  <%--放星星数--%>
                        </div>
                    </div>
            <%--    </form>--%>
                    <%-- 发布--%>
                    <div class="form-group text-center">
                        <a  id="public" href="##" class="btn btn-success">发布</a>
                    </div>

            </div>
        </div>
    </div>
</div>
<%--评价模态弹窗end--%>


</body>
<script>
/*选项切换*/
    /* $("#option_1").click(function () {
     $("#show_info").load("demo1.jsp");
     });*/
/*$("#option_2").click(function () {
    $("#show_info").load("demo2.jsp");
});*/
   /*  $("#option_3").click(function () {
         $("#show_info").load("demo3.jsp");
     });*/
    /* $("#option_4").click(function () {
         $("#show_info").load("demo4.jsp");
     });
*/
</script>
<script src="../../qiantai/js/personal/personal.js"></script>
<%--好评插件--%>
<script src="../js/public/jquery-labelauty.js"></script>
<%--星星插件--%>
<script src="../js/public/jquery.ratyli.js"></script>
<%--评价js--%>
<script src="../js/public/public.js"></script>
<script>
    /*待评价按钮*/
    function waitReviews() {
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url: "/waitReviewController/waitReview",
            async: true,
            type: "post",
            dataType: "json",
            success:function (data) {
                $("#showBookInfo").html(""); //先清空
                if(data.list.length==0){
                    $("#showBookInfo").html("<h4 style='color: #a43bb5;'>没有待评价的订单</h4>");}
                for(var i=0;i<data.list.length;i++){
                    $("#showBookInfo").append("<div class=\"col-lg-4 col-md-4 col-sm-8 col-xs-12\" style=\"background: #fafdff;box-shadow: 2px 2px 10px #a5a5a5\"> " +
                        "<div class=\"row\" style=\"margin-top: 4vh\"> " +
                        "<div class=\"col-lg-8 col-md-8 col-xs-8\"> <p><span class=\"o_fc\">订单状态:</span><span>"+ data.list[i].bookState+"</span></p>" +
                        " <p><span class=\"o_fc\">订单编号:</span><span class=\"bookId\">"+ data.list[i].bookId+"</span></p> </div> <div class=\"col-lg-3 col-md-3 col-xs-3\"> <br/>" +
                        " <a href=\"\" data-toggle=\"modal\" data-target=\"#publicModal\"  class=\"btn btn-success reviewbtn\">评价</a> </div> </div> " +
                        "<hr style=\"border:1px dashed #987cb9;width:100%;color:#987cb9;\">  <div class=\"row\">" +
                        " <div class=\"col-lg-3 col-md-3 col-sm-3 col-xs-3\"> <div  class=\"gallery\" style=\"height:70px;width:70px; \"><a href=\"#pic_one\"><img src=\"../img/room01.jpg\" class=\"\" style=\"width:70px;height:70px;cursor: pointer\"></a></div> " +
                        "</div> <div class=\"col-lg-5 col-md-5 col-sm-4  col-xs-5 \"> <p><span class=\"o_fc\">房间类型:</span><span>"+ data.list[i].roomTypeId+"</span></p>" +
                        " <p><span class=\"o_fc\">房间号:</span><span>"+ data.list[i].roomId+"</span></p> </div> <div class=\"col-lg-3 col-md-3 col-sm-4  col-xs-4\"> <br/><br/>" +
                        " </div> </div> <div class=\"row\"> <div class=\"col-lg-4 col-md-4 col-sm-4  col-xs-4 o_fc\"> <p>入住时间:</p>" +
                        " <p>离店日期:</p> <p>预订人姓名:</p> <p>预订人号码:</p> </div> <div class=\"col-md-offset-3 col-xs-offset-3  col-sm-offset-3 col-lg-4 col-md-4 col-sm-3  col-xs-4\">" +
                        "<p>"+ data.list[i].outDate+"</p> <p>"+ data.list[i].inDate+"</p> <p>"+ data.list[i].bookName+"</p> <p>"+ data.list[i].bookPhone+"</p> </div> </div> <hr style=\"border:1px dashed #987cb9;width:100%;color:#987cb9;\">" +
                        " <div class=\"row\"> <div class=\"col-lg-4 col-md-4 col-sm-4 col-xs-4\"><p class=\"o_fc\">创建时间:</p></div>" +
                        " <div class=\"col-md-offset-3 col-xs-offset-3 col-sm-offset-3 col-lg-4 col-md-4 col-sm-4  col-xs-4\">"+ data.list[i].bookDate+"</div> " +
                        "</div>" +
                        " </div>");
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    }

    //发布评论
    $("#public").click(function () {
        alert("asddddd");
        var curDate=new Date();
        var year=curDate.getFullYear();
        var mon=curDate.getMonth()+1;
        mon=checks(mon);
        var date=curDate.getDate();
        date=checks(date);
        var hour=curDate.getHours();
        hour=checks(hour);
        var minute=curDate.getMinutes();
        minute=checks(minute);
        var second=curDate.getSeconds();
        second=checks(second);
        var cuId=$("#cuId").val();
        var reivewsId=year+mon+date+hour+minute+second+cuId;//评价编号
        var bookId=$("#curbookId").val();  //订单号
        var reviewType=$("input[name='radio']:checked").val();//评论类型
        var reviewScore=$("#start").val();  //满意度分数
        var content=$("#pbtxt").val();  //评论内容
        var reviewDate=year+"-"+mon+"-"+date;
        alert(reviewDate);
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/publicReviewController/execute",
            data:{"publicbean.reviewId":reivewsId,
                "publicbean.cusId":cuId,
                "publicbean.bookId":bookId,
                "publicbean.reviewType":reviewType,
                "publicbean.reviewScore":reviewScore,
                "publicbean.content":content,
                "publicbean.reviewDate":reviewDate},
            async: true,
            type:"post",
            dataType:"text",
            success:function (data){
                alert(data);
                if(data=="ok"){
                    window.location.href="personal.jsp";
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        });
    });

    /*补0*/
    function checks(str) {
        if(str<10){
            str="0"+str;
        }
        return str;
    }
</script>
</html>
