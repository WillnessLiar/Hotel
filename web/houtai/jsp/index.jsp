<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="s" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: 我不管我最帅
  Date: 2018/6/12
  Time: 22:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>index</title>
    <%--<c:if test="${empty sessionScope.user}">--%>
        <%--<meta http-equiv="Refresh" content="0;URL=superlogin.jsp"/>--%>
    <%--</c:if>--%>
  <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/bootstrap/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/bootstrap/bootstrap.css">
    <link rel="stylesheet" href="../css/index/index.css">

</head>
<body>
<div class="container-fluid">
        <div class=" text-center ld" id="ld">
            <div class="main_left" id="main_left"><!--main_left开始-->
                <h3 class="p1">MENU</h3>

                <ul class="list-unstyled ">
                    <a class="a_daohang" id="a_home" target="rightFrame" href="/WorkerController/goWorker.html?pagesNo=1"><li class=" li_a">员工信息管理</li></a>

                    <a class="a_daohang" id="a_customer" href="/CustomerController/showAllCus?pagesNo=1" target="rightFrame"><li class=" li_a">用户信息管理</li></a>

                <%--    <a class="a_daohang" id="a_room" href="roommanage.jsp" target="rightFrame"><li class=" li_a">客房信息管理</li></a>--%>

                    <a class="a_daohang" id="a_comment" href="/CommentController/goComment.html?pagesNo=1" target="rightFrame"><li class=" li_a">酒店评价管理</li></a>

                  <%--  <a class="a_daohang" id="a_checkIn"  href=""><li class=" li_a">入住信息管理</li></a>--%>

                    <a class="a_daohang" id="a_book"  href="showAllBook.action?pagesNo=1" target="rightFrame"><li class=" li_a">酒店预订管理</li></a>
                </ul>
            </div>
        </div>
      <div class="row">
        <div class="col-lg-12 rd" id="rd">
            <div class=" main_right_top">
                <img src="../img/index/menu.png" class="img_color n" id="n" onclick="dianji()">
                <a style="float: right;margin-top: 3vh;margin-right: 1vw;color:#00ff00" href="Out.action" >退出</a>
                <p style="color:white;float:right;margin-top: 3vh;padding-right: 2vw">管理员:${sessionScope.user}</p>

            </div>
        </div>
      </div>
    <div class="row">
        <div class="col-lg-12" id="main_right_bottom">
           <iframe name="rightFrame" id="rightFrame" marginwidth="0"
                   marginheight="0" border="0" width="100%" height="600px;"
                   frameborder="0" style="background-color: #ffffff" src="">
           </iframe>
        </div>
    </div>
</div>

</body>
<script>

</script>
<script src="../js/index/index.js"></script>
</html>
