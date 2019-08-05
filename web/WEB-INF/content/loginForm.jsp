<%--
  Created by IntelliJ IDEA.
  User: Lunatic Princess
  Date: 2018/11/22
  Time: 15:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>login</title>
</head>
<body>
<h3>登陆页面</h3>
<form action="/user/login" method="post">
    <table>
        <tr>
            <td><label>登录名：</label></td>
            <td><input type="text" name="loginname" id="loginname"></td>
        </tr>
        <tr>
            <td><label>密码：</label></td>
            <td><input type="text" name="password" id="password"></td>
        </tr>
        <tr>
            <td><input id="submit" type="submit" value="注册"></td>
        </tr>
    </table>
</form>
</body>
</html>
