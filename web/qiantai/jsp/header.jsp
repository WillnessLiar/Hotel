<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 我不管我最帅
  Date: 2018/5/22
  Time: 14:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>header</title>
    <script src="/qiantai/js/jquery-3.3.1.min.js"></script>
    <%--bootstrap框架js--%>
    <script type="text/javascript" src="/qiantai/js/bootstrap/bootstrap.js"></script>
    <script src="/qiantai/js/gVerify.js" type="text/javascript"></script>
    <%--头部样式--%>
    <link rel="stylesheet" href="/qiantai/css/header/header.css">
</head>
<body>
<nav class="navbar navbar-fixed-top" role="navigation" id="navbar" >
<div class="navbar-inner">
    <div class="container">
        <!--  -->
        <%--logo及下拉按钮--%>
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only" style="background: #E46E2E">Toggle navigation</span>
                <span class="icon-bar" style="background: #E46E2E"></span>
                <span class="icon-bar" style="background: #E46E2E"></span>
                <span class="icon-bar" style="background: #E46E2E"></span>
            </button>
            <a class="navbar-brand" href="index.jsp">
                <img id="jupyter-nav-logo" class="navbar-logo" src="/qiantai/img/header/VTlogo.png" alt="Jupyter logo">
            </a>
        </div>
        <div class="blur"></div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="/qiantai/jsp/index.jsp" class="tab">首页</a>
                </li>
                <li>
                    <a  href="book.jsp" class="tab">酒店预订</a>
                </li>
                <li>
                    <a href="#" class="tab">优惠活动</a>
                </li>
                <li>
                    <a href="/qiantai/jsp/comment.jsp" class="tab" id="bb" >酒店评价</a>
                </li>
<c:if test="${empty sessionScope.cub.cusId}">
                <li>
                    <a href="#" class="tab" data-toggle="modal" data-target="#myModal">登录</a>
                </li>
                <li>
                    <a href="#"  class="tab" data-toggle="modal" data-target="#zhuceModal">注册</a>
                </li>
</c:if>
<c:if test="${!empty sessionScope.cub.cusId}">
                <li>
                    <a  class="tab" data-toggle="modal" data-target="#perSetModal">欢迎您:${sessionScope.cub.trueName}</a>
                </li>
                <li id="img_info">
                    <a id="show_btn" href="#" class="tab" style="padding: 0;margin: 0"><img src="${sessionScope.cub.cusImg}" style="width:45px;height:45px;border:1px solid rgba(187,187,187,0.92);" class="img-responsive img-circle"></a>
                </li>
</c:if>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</div>

</nav>
<%--用户信息start--%>
<div class="container" style="display: none;margin-right: 600px" id="show">
    <div class="row">
        <div class="col-md-offset-7 col-lg-offset-8 col-xs-offset-4  col-lg-3 col-md-4 col-xs-8" style="background: rgb(255,255,255);position: fixed;z-index:1000;box-shadow:#808080 2px 2px 10px ;">
            <div class="media">
                <a class="pull-left" href="#">
                    <img class="media-object img-circle " src="${sessionScope.cub.cusImg}" style="width:80px;height: 80px;border:1.5px solid rgba(255,106,0,0.92);margin-top: 15px;" alt="...">
                </a>
                <div class="media-body">
                    <h4 class="media-heading" style="margin-top: 45px;">${sessionScope.cub.trueName}</h4>
                </div>
            </div>
            <table class="table table-bordered " border="0"  style="border-collapse:separate;border-spacing: 3px;margin-top: 10px;border:0px solid #8ac261;font-family: 幼圆;" >

                <%--用户再前台指向自己的头像时js弹出窗口审核。--%>
                <tr >
                    <a href="#"> <td class="td forward"  <%--data-toggle="modal" data-target="#bookModal"--%>><img src="/qiantai/img/header/icon7.png" class="space_1" > <span class="space_2">待完成</span><c:if test="${sessionScope.bookSum!=0}"><span class="badge active pull-right" style="background: #d85d29;"><c:out value="${sessionScope.bookSum}"/> </span></c:if></td></a>
                    <a> <td class="td forward"><img src="/qiantai/img/header/icon9.png" class="space_1"> <span class="space_2">待评价</span><c:if test="${sessionScope.reviewSum!=0}"><span class="badge active pull-right" style="background: #d85d29;"><c:out value="${sessionScope.reviewSum}"/> </span></c:if></td></a>
                </tr>
                <tr>
                    <a ><td class="td" data-toggle="modal" data-target="#perSetModal"><img src="/qiantai/img/header/icon8.png" class="space_1"> <span class="space_2">个人设置</span></td></a>
                    <a> <td class="td forward" <%--data-toggle="modal" data-target="#perSetModal"--%>><img src="/qiantai/img/header/icon10.png" class="space_1" > <span class="space_2">更多订单</span></td></a>
                </tr>
            </table>
            <div style="background-color:rgba(154,154,154,0.63);height:1px;border:none;"></div>  <%--水平线--%>

            <div class="col-md-offset-8 col-md-3" style="height:45px;margin-top: 10px;" ><a class="btn btn-success" href="loginOut.action">安全退出</a></div>
        </div>
    </div>
</div><%--用户信息end--%>


<%--登录模态弹窗start--%>
<div class="modal fade " id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  <%--最外层（整个屏幕层）--%>
    <div class="modal-dialog" >
        <div class="modal-content" style="background-image: url('../img/login/login.jpg')">  <%--内容显示层--%>
            <div class="modal-header">
                <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" style="font-family: 幼圆;color: white" id="myModalLabel">
                    用户登录
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <%--账号--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="inputEmail3" class=" control-label" style="color: white;">用户名</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon1.png" class="img_icon">
                            <input  type="email" class="form-control input_indent" id="inputname" placeholder="请输入您的用户名">
                        </div>
                    </div>
                        <%--密码--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="inputPassword3" class=" control-label " style="color: white">密码</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon2.png" class="img_icon">
                            <input  type="password" class="form-control input_indent passwd1" id="inputPasswd" placeholder="请输入您的密码">
                           <%-- <img src="../img/register/icon7.png" class="img_iconR showpasswd" >--%>
                        </div>
                    </div>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="code_input" class="col-md-3 control-label" style="color: white">验证码</label>--%>
                        <div class="col-md-offset-3 col-md-3">
                            <img src="/qiantai/img/register/icon6.png" class="img_icon">
                            <input type="text" class="form-control input_indent" id="code_input" placeholder="验证码">
                        </div>
                        <div class=" col-md-3">
                            <div class="col-md-3"  id="v_container" style=" margin-top: 2px;">
                            </div>
                        </div>
                    </div>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-8">
                            <%--*********************************************************************************************--%>

                            <button id="loginn" type="button" class="btn btn-default" style="width:270px;" >登录</button>
                        <%--*********************************************************************************************--%>
                        </div>
                    </div>
                    <center><span class="span1" id="showInfo"></span></center>
                </form>
            </div>
            <div class="modal-footer">
               <p style="font-family: 幼圆;color: #707070;"> 还没注册？点击<a class="tab" href="##" id="to_zhuce">注册</a></p>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div><%--登录模态弹窗end--%>

<%--注册模态弹窗start--%>
<div class="modal fade" id="zhuceModal" tabindex="-1" role="dialog" aria-labelledby="zhuceModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content" style="background-image: url('../img/register/zhuce.jpg')"><%--内容显示层--%>
            <div class="modal-header" style="font-family: 幼圆;">
                <button class="close" type="button" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title text-center" id="zhuceModalLabel" style="color:white" >用户注册</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <%--用户名--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="userName" class="col-md-3 control-label" style="color:white" >用户名</label>--%>
                        <div class=" col-md-offset-3 col-lg-offset-3 col-lg-6 col-md-6">
                            <img src="/qiantai/img/register/icon1.png" class="img_icon">
                            <input onblur="user()" class="form-control input_indent" type="text" id="cusId"  placeholder="请输入用户名">
                        <span id="one" class="span1"></span>
                        </div>
                    </div>
                    <%--密码--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="password" class="col-md-3 control-label" style="color:white"  >密码</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon4.png" class="img_icon">
                            <input onblur="pwd()" class="form-control input_indent passwd1"  type="password" id="passwd" name="s"  placeholder="请输入密码">
                            <span id="two" class="span1"></span>
                        </div>
                    </div>
                    <%--确认密码--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="confPasswd" class="col-md-3 control-label" style="color:white"  >确认密码</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon2.png" class="img_icon">
                            <input onblur="checkPasswd()" class="form-control input_indent passwd1" type="password" id="confPasswd"  placeholder="请再次输入密码">
                            <span id="three" class="span1"></span>
                            <%-- <img src="../img/register/icon7.png" class="img_iconR showpasswd" >--%>
                        </div>
                    </div>
                    <%--真实姓名--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="email" class="col-md-3 control-label" style="color:white" >邮箱</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon3.png" class="img_icon">
                            <input onblur="isName()" class="form-control input_indent" type="text" id="trueName"  placeholder="请输入真实姓名">
                            <span id="four" class="span1"></span>
                        </div>
                    </div>
                    <%--手机号--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="phone" class="col-md-3 control-label" style="color:white" >手机号</label>--%>
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon5.png" class="img_icon">
                            <input onblur="isphone()" class="form-control input_indent" type="tel" id="cusPhone" name="cusPhone"   placeholder="请输入手机号">
                            <span id="five" class="span1"></span>
                        </div>
                    </div>
                    <%--手机验证码--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <%--<label for="phone" class="col-md-3 col-xs-3 control-label" style="color:white" >验证码</label>--%>
                        <div class="col-md-offset-3 col-md-3">
                            <img src="/qiantai/img/register/icon6.png" class="img_icon">
                            <input class="form-control input_indent" type="text" id="code"  placeholder="验证码">
                            <span id="a" class="span1"></span>
                        </div>
                        <div class="col-md-3">
                            <input class="form-control" type="button" id="getCode"   value="获取验证码">
                        </div>
                    </div>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <button id="zhuce" type="button" class="btn btn-default" style="width:270px;" >注册</button>
                        </div>
                    </div>
                <%--图片路径--%>
                    <input type="text" id="cusImg" value="../img/upload/long2.jpg" hidden>
                    <input type="text" name="cusSex" id="cusSex" value="男" hidden>
                </form>
                <center id="flags" class="span1"></center>
            </div>
            <div class="modal-footer">
                <p style="font-family: 幼圆;"> 已有账号？点击<a class="tab" href="##" id="to_login">登录</a></p>
            </div>

        </div>
    </div>
</div>

<%--我的订单start--%>
<div class="modal fade" id="bookModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">  <%--最外层（整个屏幕层）--%>
   <div class="container " id="container_id" style="background: rgb(253,255,255);height: 90%;width: 80%;font-family: 幼圆;color: black">
       <h2 class="text-center" style="color:#e28e15">我的订单</h2>
       <hr style="border:1px dashed #987cb9;width:100%;color:#987cb9;">
       <div class="row">
       <div class="col-lg-4 col-md-4 col-sm-8 col-xs-12" style="background: #f6f6f6;border-radius:0.5em;">
           <div class="row" style="margin-top: 4vh">
               <div class="col-md-12">
                   <p><span class="o_fc">订单状态:</span><span>未完成</span></p>
                   <p><span class="o_fc">订单编号:</span><span>2018052500965</span></p>
               </div>
           </div>

           <hr style="border:1px dashed #987cb9;width:100%;color:#987cb9;">   <%--水平线--%>
           <div class="row">
               <div class="col-md-3 col-sm-3 col-xs-3">
           <div  class="gallery" style="height:70px;width:70px; "><a href="#pic_one"><img src="/qiantai/img/room01.jpg" class="" style="width:70px;height:70px;cursor: pointer"></a></div>
       </div>
           <div class="col-md-4 col-sm-4  col-xs-5 ">
               <p><span class="o_fc">房间类型:</span><span>小房</span></p>
               <p><span class="o_fc">房间号:</span><span>203</span></p>
           </div>
           <div class=" col-md-4 col-sm-4  col-xs-4">
               <br/>
               <button class=" btn btn-info" >退订</button>
           </div>
       </div>
       <div class="row">
           <div class="col-md-4 col-sm-4  col-xs-4 o_fc">
               <p>入住时间:</p>
               <p>离店日期:</p>
               <p>预订人姓名:</p>
               <p>预订人号码:</p>
           </div>
           <div class="col-md-offset-3 col-xs-offset-3  col-sm-offset-3 col-md-4 col-sm-3  col-xs-4"><p>2018-05-26</p>
               <p>2018-05-26</p>
               <p>未来~</p>
               <p>13609014704</p>
           </div>

       </div>
       <hr style="border:1px dashed #987cb9;width:100%;color:#987cb9;"> <%--水平线--%>
       <div class="row">
           <div class="col-md-4 col-sm-4 col-xs-4"><p class="o_fc">创建时间:</p></div>
           <div class="col-md-offset-3 col-xs-offset-3 col-sm-offset-3 col-md-4 col-sm-4  col-xs-4">2018-05-26</div>
       </div>
         </div>
       </div>
   </div>
</div>
<%--我的订单end--%>

<%--个人设置start--%>
<div class="modal fade" id="perSetModal" tabindex="-1" role="dialog" aria-labelledby="perSetModalLabel" aria-hidden="true">  <%--最外层（整个屏幕层）--%>
    <div class="modal-dialog" >
        <div class="modal-content" style="border-radius: 0rem;font-family: 幼圆;">  <%--内容显示层--%>
            <div class="modal-header">
                <button type="button" class="close"  data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
                <h4 class="modal-title text-center" style="font-family: 幼圆;color:#e28e15">
                    个人设置
                </h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form" enctype="multipart/form-data">
                    <div class="form-group">
                        <div class="col-md-offset-3 col-md-6">
                            <div class="media">
                                <a class="pull-left" href="#">
                                    <img class="media-object img-responsive showImg" src="${sessionScope.cub.cusImg}" alt="..." style="width:100px;height: 100px;">
                                </a>
                                <div class="media-body">
                                    <h4 class="media-heading">换一张</h4>
                                    <%--<div><button type="button" class="btn btn-default" style="margin-top: 40px;">上传头像</button></div>--%>
                                    <div class="file_box"><input type="file" onchange="changeg_pic(this)"   class="file_btn myfile">浏览图片</div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <%--图片路径(隐藏)--%>
                            <input hidden class=" input_indent passwd1" type="text" id="upImg" value="${sessionScope.cub.cusImg}">

                    <%--用户名--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon1.png" class="img_icon">
                            <input class="form-control input_indent passwd1" type="text" id="upId" value="${sessionScope.cub.cusId}" disabled><%--<img src="../img/register/icon7.png" class="img_iconR showpasswd">--%>
                        </div>
                    </div>
                    <%--密码--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon2.png" class="img_icon">
                            <input class="form-control input_indent passwd1" type="password" id="upPasswd" value="${sessionScope.cub.cusPasswd}"><%--<img src="../img/register/icon7.png" class="img_iconR showpasswd">--%>
                        </div>
                    </div>
                    <%--姓名--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon3.png" class="img_icon">
                            <input class="form-control input_indent" type="email" id="upTrueName" value="${sessionScope.cub.trueName}" >
                        </div>
                    </div>
                    <%--手机号--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <img src="/qiantai/img/register/icon5.png" class="img_icon">
                            <input class="form-control input_indent" type="tel" id="upphone" value="${sessionScope.cub.cusPhone}"  >
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                        <label class="radio-inline">
                            <input type="radio" value="男" name="sex" class="radio1" <c:if test="${sessionScope.cub.cusSex=='男'}">checked</c:if>  >男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" value="女" name="sex" class="radio1" <c:if test="${sessionScope.cub.cusSex=='女'}">checked</c:if> >女
                        </label>
                        </div>
                    </div>
                    <div class="form-group" style="font-family: 幼圆;">
                        <div class="col-md-offset-3 col-md-6">
                            <button type="button" id="updperson" onclick="hh()" class="btn btn-success">保存</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>
<%--个人设置end--%>
<%--操作成功提示框--%>
<div id="tip" style="width:80px;height: 30px;background: #52ce2f;display: none;font-family: 微软雅黑;color: #f7f7f7;line-height: 30px;font-size:1.4rem;box-shadow:1px 1px 2px #585858 ;text-align: center;position: fixed;left:48%;z-index: 10000">操作成功</div>
<%--<%@include file="index.jsp"%>--%>
<script type="text/javascript" src="/qiantai/js/header/header.js"></script>

<script>
    /*登录*/
    $("#loginn").click(function () {
        var s=check();
        $.ajax({
            contentType:"application/x-www-form-urlencoded;charset=utf-8",
            url:"/loginController/execute",
            data:{"cus.cusId":$("#inputname").val(),
                "cus.cusPasswd":$("#inputPasswd").val(),
                "cus.cusCode":$("#code_input").val(),
                "code":s
            },
            type:"post",
            async:true,
            dataType:"text",
            success:function (data) {
                if(data=="ok"){
                    /*  alert("登录成功");*/
                    window.location.href="/qiantai/jsp/index.jsp";
                }
                $("#showInfo").text(data);
            },
            error :function(XMLHttpRequest, textStatus, errorThrown) {
                alert(XMLHttpRequest.status);
                alert(XMLHttpRequest.readyState);
                alert(textStatus);

            }
        })
    });

    $(".forward").click(function () {
        window.location.href="/qiantai/jsp/personal.jsp";
    });
</script>
</body>

</html>
