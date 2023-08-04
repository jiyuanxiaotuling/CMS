<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/8/3
  Time: 16:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%@ page import="model.CS" %>
<%@ page import="javax.lang.model.type.ArrayType" %>
<%@ page import="model.EM" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="CSS/PersonInfo.css?v=<%= System.currentTimeMillis() %>">
    <script charset="utf-8" src="JS/showContent.js?v=<%= System.currentTimeMillis() %>"></script>
    <title>个人信息</title>
</head>
<body>
<%
    String id = (String) session.getAttribute("emId");
    System.out.println(id);
    ArrayList em_al=new DB().findEmInfoById(id);
    Iterator em_iter=em_al.iterator();
    EM em = (EM)em_iter.next();
%>
<div class="top-container">
    <h2 class="head-title">客户资源管理系统</h2>
</div>
<div class="left-container">
    <div class="head_photo">

    </div>
    <p style="position: relative;margin-left: 50%;margin-top: 27px"><%=em.getEm_name()%></p>
    <div id="content1" class="content" onclick="showcontent(1)">
        <div id="personInfoIcon">
        </div>
        <h4>个人信息</h4>
    </div>
    <div id="content2" class="content" onclick="showcontent(2)">
        <div id="pwdIcon">
        </div>
        <h4>修改密码</h4>
    </div>
</div>
<div class="right-container">
    <div id="forContent1">
        <h3>个人信息</h3><br>
        <form>
            <p style="position:relative;left: 10px">头像</p>
            <div id="head_photo">

            </div>
            <input type="button" id="change_photo" value="更换头像">
            <div class="form-group">
                <label for="name">姓名：</label>
                <input type="text" id="name" value="<%=em.getEm_name()%>" readonly>
            </div>
            <div class="form-group">
                <label for="sex">性别：</label>
                <select id="sex" id="sex_select">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select>
                <script>
                   var sex = '<%=em.getEm_gender()%>';
                   var select_sex = document.getElementById("sex_select");
                   for(var j = 0; j < select_sex.options.length; j++){
                       if(select_sex.options[j].value === sex){
                           select_sex.options[j].selected = true;
                       }
                   }
                </script>
            </div>
            <div class="form-group">
                <label for="age">年龄：</label>
                <input type="text" id="age" value="<%=em.getEm_age()%>">
            </div>
            <div class="form-group">
                <label for="position">职位：</label>
                <input type="text" id="position" value="<%=em.getEm_position()%>" readonly>
            </div>
            <div class="form-group">
                <label for="department">部门：</label>
                <input type="text" id="department" value="<%=em.getEm_department()%>" readonly>
            </div>
            <div class="form-group">
                <label for="phone">电话：</label>
                <input type="text" id="phone" value="<%=em.getEm_phone()%>" readonly>
            </div>
            <div class="form-group">
                <label for="email">邮箱：</label>
                <input type="text" id="email" value="<%=em.getEm_email()%>" >
            </div>
            <input type="submit" value="保存" class="remain">
        </form>
    </div>
    <div id="forContent2" style="display: none">
        <form action="modifyEmPwdServlet" method="post">
            <div class="form_pwd">
                <label for="old_pwd">原密码：</label>
                <input type="password" id="old_pwd" name="old_pwd" value="">
            </div>
            <div class="form_pwd">
                <label for="new_pwd">新密码：</label>
                <input type="password" id="new_pwd" name="new_pwd" value="">
            </div>
            <div class="form_pwd">
                <label for="new_pwd2">确认新密码：</label>
                <input type="password" id="new_pwd2" name="new_pwd2" value="">
            </div>
            <input type="hidden" name="hidden_emid" value="<%=id%>">
            <input type="submit" value="保存" id="re_pwd">
        </form>
    </div>
</div>
</body>
</html>
