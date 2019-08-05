<%--
  Created by IntelliJ IDEA.
  User: 我不管我最帅
  Date: 2017/12/11
  Time: 13:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>后台管理系统</title>
    <script src="../../houtai/js/jquery-3.3.1.js"></script>
    <link href="../css/backstage_css/bslogin.css" rel="stylesheet" type="text/css">
</head>
<body >
<div id="content" class="content">
    <div class="main">
        <h3>酒店管理系统</h3>
        <form method="post" action="/SuperController/goIndex">
            <div class="user-div"><h4>账号</h4>&nbsp;<input class="login-input" type="text" name="loginId" id="loginId"> </div>
            <div class="pwd-div"><h4>密码</h4>&nbsp;<input class="login-input" type="password" name="passwd" id="passwd"> </div>
            <div class="submit"><input type="submit" id="sub"  value="提交"><input type="reset" name="reset" value="重置" style="position: relative;left: 7vw;"></div>
        </form>
    </div>
</div>
<%--<script src="../../houtai/js/superlogin/superlogin.js"></script>--%>
</body>
</html>
