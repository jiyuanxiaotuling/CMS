<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@page import="db.DB"%>
<%@ page import="model.CS" %>
<html>
<head>
    <link rel="stylesheet" href="CSS/main.css">
    <script src="JS/showContent.js"></script>
    <script src="JS/addCustomer.js"></script>
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
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
            <form>
                <label for="name">姓名：</label>
                <input type="text" id="name" name="name"><br><br>
                <label for="gender">性别：</label>
                <select id="gender" name="gender">
                    <option value="男">男</option>
                    <option value="女">女</option>
                </select><br><br>

                <label for="phone">电话：</label>
                <input type="text" id="phone" name="phone"><br><br>

                <label for="email">邮箱：</label>
                <input type="email" id="email" name="email"><br><br>

                <label for="address">地址：</label>
                <input type="text" id="address" name="address"><br><br>

                <label for="category">类别：</label>
                <select id="category" name="category">
                    <option value="客户">已有客户</option>
                    <option value="VIP客户">潜在客户</option>
                </select><br><br>

                <button type="submit">提交</button>
            </form>
        </div>
    </div>
    <div id="content1" style="display: block">

    </div>
    <!--      客户管理-->
    <div id="content2" style="display: none">
        <div class="em_menu">
            <h3 style="display: inline-block">客户基本信息</h3>
            <input id="add_cs" type="button" value="新增客户" onclick="add_cs()">
        </div>
        <div id="cs_table_container">
            <table id="cs_table">
                <tr style="background-color: cornflowerblue">
                    <td>姓名</td>
                    <td width="50">性别</td>
                    <td width="150">电话</td>
                    <td>邮箱</td>
                    <td>地址</td>
                    <td>类别</td>
                    <td>描述</td>
                    <td colspan="2" width="40">操作</td>
                </tr>
                <%
                    ArrayList al=(ArrayList)session.getAttribute("al");
                    Iterator iter=al.iterator();
                    while(iter.hasNext()){
                        CS cs=(CS)iter.next();
                %>
                <tr>
                    <td><%= cs.getCs_name() %></td>
                    <td><%= cs.getCs_sex() %></td>
                    <td><%= cs.getCs_phone() %></td>
                    <td><%= cs.getCs_email() %></td>
                    <td><%= cs.getCs_address() %></td>
                    <td><%= cs.getCs_kind() %></td>
                    <td><%= cs.getCs_remark() %></td>
                    <td><input type="button" value="修改"></td>
                    <td><input type="button" value="删除"></td>
                </tr>
                    <%
                        }
                    %>
            </table>
        </div>
    </div>
    <div id="content3" style="display: none">客服管理</div>
    <div id="content4" style="display: none">市场活动</div>
    <div id="content5" style="display: none">日程安排</div>
    <div id="content6" style="display: none">数据管理</div>
    <div id="content7" style="display: none">系统管理</div>
</div>
</body>
</html>

