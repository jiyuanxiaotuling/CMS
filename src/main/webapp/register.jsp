<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
    <title>用户注册</title>
    <link rel="stylesheet" href="CSS/register.css">
</head>
<body bgcolor="#E3E3E3">
<form action="registerServlet" method="post">
    <div class="box">
        <div class="inputbox">
            <input type="text" name="username" required="">
            <label>用户名</label>
        </div>
        <div class="inputbox">
            <input type="password" name="pwd" required="">
            <label>密码</label>
        </div>
        <div class="inputbox">
            <input type="password" name="re_pwd" required="">
            <label>确认密码</label>
        </div>
        <input  type="submit" name="" id="login_btn" value="注   册" onclick="" style="display: inline-block;left: 124px">
        <input type="reset" name="" id="reset_btn" value="重置" style="">
        <br><br>
        <div style="text-align: center">
            <span style="color: white">已有账号？点击</span><a href="login.jsp" style="color: #45CBFF">这里</a><span style="color: white">登录！</span>
        </div>
    </div>
</form>
</body>
</html>
