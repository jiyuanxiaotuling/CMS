<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="model.Liuyan"%>
<%@page import="db.DB"%>
<html>
<head>
    <link rel="stylesheet" href="CSS/main.css">
    <script src="JS/showContent.js"></script>
    <title>客户资源管理</title>
</head>
<body>
<div class="top-container">
    <h2 class="head-title">客户资源管理系统</h2>
</div>
<div class="left-container">
    <div class="head-photo">
        <div class="head-picture">

        </div>
    </div>
    <hr style="margin-top: 0; border-width: 2px">
    <div class="left-title" onclick="showContent(1)">
        <p class="left-title-word">系统主页</p>
    </div>
    <div class="left-title" onclick="showContent(2)">
        <p class="left-title-word">客户管理</p>
    </div>
    <div class="left-title" onclick="showContent(3)">
        <p class="left-title-word">客服管理</p>
    </div>
    <div class="left-title" onclick="showContent(4)">
        <p class="left-title-word">市场活动</p>
    </div>
    <div class="left-title" onclick="showContent(5)">
        <p class="left-title-word">日程安排</p>
    </div>
    <div class="left-title" onclick="showContent(6)">
        <p class="left-title-word">数据管理</p>
    </div>
    <div class="left-title" onclick="showContent(7)">
        <p class="left-title-word">系统管理</p>
    </div>
</div>
<div class="right-container">
    <div id="content1" style="display: block">系统主页</div>
    <div id="content2" style="display: none">客户管理</div>
    <div id="content3" style="display: none">客服管理</div>
    <div id="content4" style="display: none">市场活动</div>
    <div id="content5" style="display: none">日程安排</div>
    <div id="content6" style="display: none">数据管理</div>
    <div id="content7" style="display: none">系统管理</div>
</div>
</body>
</html>

