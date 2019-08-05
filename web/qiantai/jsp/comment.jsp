<%--
  Created by IntelliJ IDEA.
  User: 我不管我最帅
  Date: 2018/6/2
  Time: 13:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%
        String path = request.getContextPath();
        String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    %>

    <base href="<%=basePath%>">
    <title>酒店评价</title>
    <%--<script src="<%=request.getContextPath()%>/js/jquery-3.3.1.js"></script>--%>
    <%--<script type="text/javascript" src="<%=request.getContextPath()%>/js/bootstrap/bootstrap.js"></script>--%>
    <%--<link type="text/css" rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap/bootstrap.css">--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/comment/comment.css">--%>
    <%--<script src="<%=request.getContextPath()%>/js/comment/comment.js"></script>--%>

    <script src="/qiantai/js/jquery-3.3.1.js"></script>
    <script type="text/javascript" src="/qiantai/js/bootstrap/bootstrap.js"></script>
    <link type="text/css" rel="stylesheet" href="/qiantai/css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="/qiantai/css/comment/comment.css">
    <script src="/qiantai/js/comment/comment.js"></script>
</head>
<body onload="showComment()">
<%@include file="header.jsp"%>
<div class="container-fluid" style="background: #2d2d2d;">
    <%--评分start--%>
<div class="container" style="background: rgba(69,69,69,0.76)">
<div class="row" style="margin-top: 5%;margin-bottom: 5%">
    <div class=" col-lg-3 col-md-3 col-xs-12">
        <canvas width="200" height="200" id="canvas"></canvas>
    </div>
    <div class="col-lg-4 col-md-4 col-xs-12 ">
        <div class="list_pingfen ">
        <span class="pingfen_font1">睡眠舒适度</span>
        <span class="pingfen_font2">5.0分</span>
        <span>
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
            </span>
    </div>
    <div class="list_pingfen">
        <span class="pingfen_font1">沐浴舒适度</span>
        <span class="pingfen_font2">5.0分</span>
        <span>
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
            </span>
        </div>
    </div>

    <div class="col-lg-4 col-md-4 col-xs-12 ">
        <div class="list_pingfen">
            <span class="pingfen_font1">热情服务</span>
            <span class="pingfen_font2">5.0分</span>
            <span>
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
            </span>
        </div>
        <div class="list_pingfen">
            <span class="pingfen_font1">客房卫生</span>
            <span class="pingfen_font2">5.0分</span>
            <span>
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
                <img src="/qiantai/img/comment/star-on.png">
            </span>
        </div>
    </div>
</div>
</div><%--评分end（container）--%>

<div class="container" id="allComment" style="background: rgba(69,69,69,0.76)"><%--评论条end（container）--%>
    <%-- 评论条--%>
    <%--<div class="row" style="background: #474747;border-bottom: 2px solid #ffa704">
        <div class=" col-lg-3 col-md-3 col-xs-3">
            <div class="ho_user_icon">
                <div class="img_cicle">
                    <img src="../img/comment/group_13.png" class="img-responsive center-block" alt="">
                </div>
                <span class="gray_color">889***3355</span>
            </div>
        </div>
        <div class="col-lg-8 col-md-8 col-xs-9">
            <div style="margin-top: 3%">
                <p class="gray_color">评价类型:<span></span></p>
            <p class="gray_color">好评</p>
            <p class="gray_color">
                <span>点评日期:</span>
                <span class="jiange">2018.05.16</span>
                <span class="jiange">满意度:
                    <img src="../img/comment/star-on.png">
            </span></p>
            </div>
        </div>
    </div>--%>
</div> <%-- 评论条 end（container）--%>
    <div class="row" style="margin-top: 5%;margin-bottom: 2%">
        <div class=" col-lg-offset-9 col-md-offset-9 col-xs-offset-3 col-lg-3 col-md-3 col-xs-9">
            <span class="curent_yeshu">当前页<span id="pageNo"></span>/<span id="pageNum"></span></span>
            <a  class="btn btn-success"  id="pre">上一页</a>
            <a class="btn btn-success" id="next">下一页</a>
        </div>
    </div>
</div><%--最外盒子（container-flud）--%>
<script>
    $("#pre").click(function () {
        var preNo = parseInt($("#pageNo").text()) - parseInt(1);
        if (preNo > 0) {
            $.ajax({
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                url: "/qiantaiCommentController/qiantaiComment",
                data: {"pageNo": preNo},
                async: true,
                type: "post",
                dataType: "json",
                success: function (data) {
                    $("#allComment").html("");  //使用append时 先清除原先的内容
                    $("#pageNo").text(data.pNo);
                    for (var i = 0; i < data.list.length; i++) {
                        $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
                            "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
                            "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
                            " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
                            "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
                            " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
                            " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
                            "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
                            " <span class=\"jiange  starts\"></span></p> " +
                            "</div> </div> </div>");
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }


            })
        }
    })


    $("#next").click(function () {
        var nextNo = parseInt($("#pageNo").text()) + parseInt(1);
        var pageNum = parseInt($("#pageNum").text());
        if (nextNo <= pageNum) {
            $.ajax({
                contentType: "application/x-www-form-urlencoded;charset=utf-8",
                url: "/qiantaiCommentController/qiantaiComment",
                data: {"pageNo": nextNo},
                async: true,
                type: "post",
                dataType: "json",
                success: function (data) {
                    $("#allComment").html("");  //使用append时 先清除原先的内容
                    $("#pageNo").text(data.pNo);
                    for (var i = 0; i < data.list.length; i++) {
                        $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
                            "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
                            "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
                            " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
                            "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
                            " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
                            " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
                            "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
                            " <span class=\"jiange  starts\"></span></p> " +
                            "</div> </div> </div>");
                    }
                },
                error: function (XMLHttpRequest, textStatus) {
                    alert(XMLHttpRequest.status);
                    alert(XMLHttpRequest.readyState);
                    alert(textStatus);
                }
            })
        }
    })

    /*加载页面就执行 显示所有评价信息  以及综合评分*/
    function showComment() {
        $.ajax({
            url: "/qiantaiCommentController/qiantaiComment",
            contentType: "application/x-www-form-urlencoded; charset=utf-8",
            data: {
                pageNo: "1"
            },
            async: true,
            type: "post",
            dataType: "json",
            success: function (data) {
                var percentages = (data.percents).toFixed(2);//保留1位小数
                var score = percentages * 5;  //综合分
                createCanvas(percentages, score); //创建画布显示综合分
                $("#pageNo").html(data.pNo);
                $("#pageNum").html(data.pageNum);
                $("#allComment").html("");//先清空
                // var json = str.parseJSON(data.list);
                for (var i = 0; i < data.list.length; i++) {
                    $("#allComment").append("<div class=\"row\" style=\"background: #474747;border-bottom: 2px solid #ffa704\"> " +
                        "<div class=\" col-lg-3 col-md-3 col-xs-3\"> " +
                        "<div class=\"ho_user_icon\"> <div class=\"img_cicle\">" +
                        " <img src=\"" + data.list[i].cusImg + "\" class=\" \" style='width:80px;height: 80px;border-radius: 50%' alt=\"\"> " +
                        "</div> <span class=\"gray_color\">" + data.list[i].cusId + "</span>" +
                        " </div> </div> <div class=\"col-lg-8 col-md-8 col-xs-9\">" +
                        " <div style=\"margin-top: 3%\"> <p class=\"gray_color\">评价类型:<span>" + data.list[i].reviewType + "</span></p> <p class=\"gray_color\">" + data.list[i].content + "</p> " +
                        "<p class=\"gray_color\"> <span>点评日期</span> <span class=\"jiange\">" + data.list[i].reviewDate + "</span>" +
                        " <span class=\"jiange  starts\"></span></p> " +
                        "</div> </div> </div>");
                }
            },
            error: function (XMLHttpRequest, textStatus) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);
            }
        })
    }
</script>
<%@include file="footer.jsp"%>
</body>

</html>
