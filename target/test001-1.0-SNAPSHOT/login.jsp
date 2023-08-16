<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
    <title>用户登录</title>
    <link rel="stylesheet" href="CSS/register.css">
</head>
<body bgcolor="#E3E3E3">
<form action="adminServlet" method="post">
    <div class="box">
        <h3 style="color: #03a9f4;text-align: center">登陆界面</h3>
        <div class="inputbox">
            <input type="text" name="username" required="">
            <label>用户名</label>
        </div>
        <div class="inputbox">
            <input type="password" name="password" required="">
            <label>密码</label>
        </div>
        <input  type="submit" name="" id="login_btn" value="登   录" onclick="" style="display: inline-block;left: 124px">
        <input type="reset" name="" id="reset_btn" value="重置" style="">
    </div>
</form>
</body>
</html>

