<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%@ page import="db.DB"%>
<%@ page import="model.CS" %>
<%@ page import="javax.lang.model.type.ArrayType" %>
<html>
    <head>
<%--        此处用了强制加载CSS属性，全部完工后可以删除--%>
        <link rel="stylesheet" type="text/css" href="CSS/main.css?v=<%= System.currentTimeMillis() %>">
        <script charset="utf-8" src="JS/showContent.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/CRUD_Cs.js?v=<%= System.currentTimeMillis() %>"></script>
        <title>客户资源管理</title>
    </head>
    <body>
        <div class="top-container">
            <h2 class="head-title">客户资源管理系统</h2>
        </div>
    <%--    左侧长条区域--%>
        <div class="left-container">
        <%--    左侧头像区域--%>
            <div class="head-photo">
                <div class="head-picture">

                </div>
            </div>
            <hr style="margin-top: 0; border-width: 2px">
        <%--    左侧分类区域--%>
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
        <%--右侧整个大容器--%>
        <div class="right-container" >
        <%--    系统主页对应的右侧页面--%>
            <div id="content1" style="display: block">

            </div>
        <!--      客户管理对应的右侧页面-->
            <div id="content2" style="display: none">
        <%--        顶部容器--%>
                <div class="em_menu">
                    <h3 style="display: inline-block">客户基本信息</h3>
                    <select id="cs_classify_select">
                        <option value="cs_id">ID</option>
                        <option value="cs_name">姓名</option>
                        <option value="cs_sex">性别</option>
                        <option value="cs_phone">电话</option>
                        <option value="cs_email">邮箱</option>
                        <option value="cs_address">地址</option>
                        <option value="cs_kind">类别</option>
                    </select>
                    <input id="cs_classify_outer" readonly>
                    <input id="cs_classify_inner" >
                    <input id="cs_classify_btn" type="submit" value="" onclick="classifyCs()">
                    <input id="add_cs" type="button" value="新增客户" onclick="add_cs()">
                    <input id="print_cs_table" type="button" value="打印表格" onclick="print_cs_table()">
                </div>
                <%--    新增客户按钮的相应div，默认隐藏--%>
                <div id="modal" class="modal">
                    <div class="modal-content">
                        <span class="close-button" onclick="closeModal()">&times;</span>
                        <form action="addCsServlet" method="post">
                            <label for="Cs_id">&nbsp;I&nbsp;D：&nbsp;</label>
                            <input type="text" id="Cs_id" name="Cs_id"><br><br>
                            <label for="Cs_name">姓名：</label>
                            <input type="text" id="Cs_name" name="Cs_name"><br><br>
                            <label for="Cs_sex">性别：</label>
                            <select id="Cs_sex" name="Cs_sex">
                                <option id="man" value="男">男</option>
                                <option id="woman" value="女">女</option>
                            </select><br><br>
                            <label for="phone">电话：</label>
                            <input type="text" id="phone" name="Cs_phone"><br><br>

                            <label for="email">邮箱：</label>
                            <input type="email" id="email" name="Cs_email"><br><br>

                            <label for="address">地址：</label>
                            <input type="text" id="address" name="Cs_address"><br><br>

                            <label for="kind">类别：</label>
                            <select id="kind" name="Cs_kind">
                                <option value="现有客户">现有客户</option>
                                <option value="潜在客户">潜在客户</option>
                            </select><br><br>

                            <label for="remark">描述：</label>
                            <input type="text" id="remark" name="Cs_remark"><br><br>
                            <button type="submit" id="cs_submit_btn" name="Cs_btn" value="提交">提交</button>
                            <button type="submit" id="cs_modify_btn" name="Cs_btn" value="修改" style="display: none">修改</button>
                        </form>
                    </div>
                </div>
                <%--    用户表格存放容器--%>
                <div id="cs_table_container">
                    <table id="cs_table">
                        <tr style="background-color: cornflowerblue">
                            <th>ID</th>
                            <th>姓名</th>
                            <th width="50">性别</th>
                            <th width="150">电话</th>
                            <th>邮箱</th>
                            <th>地址</th>
                            <th>类别</th>
                            <th>描述</th>
                            <th colspan="3" >操作</th>
                        </tr>
                        <%
                            ArrayList al1=new DB().findCsInfo();
                            Iterator iter=al1.iterator();
                            ArrayList al2;
                            if(session.getAttribute("al") != null){
                                al2 = (ArrayList) session.getAttribute("al");
                                iter = al2.iterator();
                            }
//                          用来确定是哪一行的按钮
                            int i = 0;
                            while(iter.hasNext()){
                                CS cs=(CS)iter.next();
                                i++;
                        %>
                        <tr>
                            <td><%= cs.getCs_id()%></td>
                            <td><%= cs.getCs_name() %></td>
                            <td><%= cs.getCs_sex() %></td>
                            <td><%= cs.getCs_phone() %></td>
                            <td><%= cs.getCs_email() %></td>
                            <td><%= cs.getCs_address() %></td>
                            <td><%= cs.getCs_kind() %></td>
                            <td><%= cs.getCs_remark() %></td>
                            <td width="25"><input type="button" value="修改" class="cs_modify" onclick="modify_cs(<%= i%>)"></td>
                            <td width="25"><input type="button" value="删除" class="cs_modify" onclick="delete_cs(<%= i%>)"></td>
                            <td width="25"><input type="button" value="打印" class="cs_modify" onclick="print_cs(<%= i%>)"></td>
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

