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
    <title>�û�ע��</title>
    <link rel="stylesheet" href="CSS/register.css">
</head>
<body bgcolor="#E3E3E3">
<form action="registerServlet" method="post">
    <div class="box">
        <div class="inputbox">
            <input type="text" name="username" required="">
            <label>�û���</label>
        </div>
        <div class="inputbox">
            <input type="password" name="pwd" required="">
            <label>����</label>
        </div>
        <div class="inputbox">
            <input type="password" name="re_pwd" required="">
            <label>ȷ������</label>
        </div>
        <input  type="submit" name="" id="login_btn" value="ע   ��" onclick="" style="display: inline-block;left: 124px">
        <input type="reset" name="" id="reset_btn" value="����" style="">
        <br><br>
        <div style="text-align: center">
            <span style="color: white">�����˺ţ����</span><a href="login.jsp" style="color: #45CBFF">����</a><span style="color: white">��¼��</span>
        </div>
    </div>
</form>
</body>
</html>
