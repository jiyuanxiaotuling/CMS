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
    <title>�û���¼</title>
    <link rel="stylesheet" href="CSS/register.css">
</head>
<body bgcolor="#E3E3E3">
<form action="adminServlet" method="post">
    <div class="box">
        <h3 style="color: #03a9f4;text-align: center">��½����</h3>
        <div class="inputbox">
            <input type="text" name="username" required="">
            <label>�û���</label>
        </div>
        <div class="inputbox">
            <input type="password" name="password" required="">
            <label>����</label>
        </div>
        <input  type="submit" name="" id="login_btn" value="��   ¼" onclick="" style="display: inline-block;left: 124px">
        <input type="reset" name="" id="reset_btn" value="����" style="">
        <br>
        <br>
        <div style="text-align: center">
            <span style="color: white">��û���˻������</span><a href="register.jsp" style="color: #45CBFF">����</a><span style="color: white">ע�ᣡ</span>
        </div>
    </div>
</form>
</body>
</html>

