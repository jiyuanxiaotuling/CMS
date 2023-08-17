<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%@ page import="javax.lang.model.type.ArrayType" %>
<%@ page import="model.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
<%--        此处用了强制加载CSS属性，全部完工后可以删除--%>
        <link rel="stylesheet" type="text/css" href="CSS/main.css?v=<%= System.currentTimeMillis() %>">
        <link rel="stylesheet" type="text/css" href="CSS/service.css?v=<%= System.currentTimeMillis() %>">
        <link rel="stylesheet" type="text/css" href="CSS/activity.css?v=<%= System.currentTimeMillis() %>">
        <script charset="utf-8" src="JS/showContent.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/CRUD_Cs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/importCs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/underPhoto.js?v=<%= System.currentTimeMillis() %>"></script>
        <script src="https://cdn.sheetjs.com/xlsx-0.20.0/package/dist/xlsx.full.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <title>客户资源管理</title>
    </head>
    <body>
        <div class="top-container">
            <h2 class="head-title">客户资源管理系统</h2>
        </div>
    <%--    左侧长条区域--%>
        <div class="left-container" id="left-container">
        <%--    左侧头像区域--%>
            <div class="head-photo">
                <div class="head-picture">

                </div>
                <div class="person_info" onclick="showPersonInfo()">

                </div>
                <div class="richeng" onclick="showricheng()">

                </div>
                <div class="tongzhi">

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
                <p class="left-title-word">备份恢复</p>
            </div>
            <%
                String userRole = (String) session.getAttribute("userRole");
                if ("admin".equals(userRole)) {
            %>
            <div class="left-title" onclick="showContent(6)">
                <p class="left-title-word">员工管理</p>
            </div>
            <%
                }
            %>
        </div>
        <%--右侧整个大容器--%>
        <div class="right-container" class="main_content">
        <%--    系统主页对应的右侧页面--%>
            <div id="content1" style="display: block">

                <%--            顶部容器--%>
                <div class="em_menu">
                    <h1 style="display: inline-block">系统主页</h1>
                </div>

        </div>
        <!--      客户管理对应的右侧页面-->
            <div id="content2" style="display: none" class="main_content">
<%--                导入导出div--%>
                    <div id="IO_div" class="IO_div" style="display: none">
                        <button  class="file_button" onclick="show_importCs()">导入</button>
                        <div class="O_div" onclick="show_out_cs(event)">
                            导出
                        </div>
                    </div>

<%--            顶部容器--%>
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
                    <input type="button" value="删除选中" class="deleteChecked" id="deleteCheckedCs" onclick="DeleteAllCs()">
                    <input id="cs_classify_outer" readonly>
                    <input id="cs_classify_inner" >
                    <input id="cs_classify_btn" type="submit" value="" onclick="classifyCs()">
                    <input class="refresh-button" type="button" onclick="cs_refresh_page()">
                    <input id="add_cs" type="button" value="新增客户" onclick="add_cs()">
                    <input id="print_cs_table" type="button" value="打印表格" onclick="print_cs_table()">
                    <input id="io_cs_table" type="button" value="···" onclick="io_cs_table(event)">
                </div>
<%--            新增客户按钮的相应div，默认隐藏--%>
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
                            <button type="submit" class="cs_btn" id="cs_submit_btn" name="Cs_btn" value="提交" >提交</button>
                            <button type="submit" class="cs_btn" id="cs_modify_btn" name="Cs_btn" value="修改" style="display: none;">修改</button>
                        </form>
                    </div>
                </div>
<%--            导入div，默认隐藏--%>
                <form action="ImportCustomerServlet" method="post" enctype="multipart/form-data">
                    <div class="importCsDiv" id="importCsDiv">
                        <h3 style="margin-top: 0px">导入客户</h3>
                        <input type="file"  name="importCsFile" class="file_input" style="cursor:pointer;"  />
                        <input type="submit" id="importCsSubmit" value="确认提交">
                        <input type="button" id="notImportCsSubmit" value="取消" onclick="close_importCs()">
                        <p style="font-size: 13px;position:absolute;bottom: 5px">注意：1.导入文件应为xlsx或csv文件<br>&emsp;&emsp;&emsp;2.ID一列应该设置为文本格式</p>
                    </div>
                </form>

<%--            导出div，默认隐藏--%>
                <div id="out_cs" class="out_cs">
                    <p style="font-size: 20px;font-weight: bolder;margin-top: 5px">导出客户</p>
                    <p style="font-weight: bold">选择导出字段</p>
                    <input type="checkbox" id="select-all">
                    <label for="select-all" id="select-all-label">全选</label>
                    <br><br>
                    <input type="checkbox" id="cb_cs_id" class="ck_out_cs" checked>
                    <label for="cb_cs_id" id="cs_id-label" >ID</label>
                    <input type="checkbox" id="cb_cs_name" class="ck_out_cs" checked>
                    <label for="cb_cs_name" id="cs_name-label">姓名</label>
                    <input type="checkbox" id="cb_cs_sex" class="ck_out_cs" checked>
                    <label for="cb_cs_sex" id="cs_sex-label">性别</label>
                    <input type="checkbox" id="cb_cs_email" class="ck_out_cs" checked>
                    <label for="cb_cs_email" id="cs_email-label">邮箱</label>
                    <input type="checkbox" id="cb_cs_phone" class="ck_out_cs" checked>
                    <label for="cb_cs_phone" id="cs_phone-label">电话</label>
                    <input type="checkbox" id="cb_cs_address" class="ck_out_cs" checked>
                    <label for="cb_cs_address" id="cs_address-label">地址</label>
                    <input type="checkbox" id="cb_cs_kind" class="ck_out_cs" checked>
                    <label for="cb_cs_kind" id="cs_kind-label">类别</label>
                    <input type="checkbox" id="cb_cs_remark" class="ck_out_cs" checked>
                    <label for="cb_cs_remark" id="cs_remark-label">描述</label>
                    <br><br>
                    <p style="font-weight: bold">选择导出文件类型</p>
                    <input type="radio" name="out_file_kind" id="xls" class="out_file_kind" checked>
                    <label for="xls" >xls</label>
                    <input type="radio" name="out_file_kind" id="csv" class="out_file_kind">
                    <label for="xls" >csv</label>
                    <input type="button" id="out_cs_btn" value="导出" onclick="out_cs()">
                    <input type="button" id="out_cs_btn_back" value="取消" onclick="close_out_cs()">
                </div>

                <script charset="utf-8"  src="JS/exportSelectAll.js?v=<%= System.currentTimeMillis() %>"></script>
                <script charset="utf-8"  src="JS/exportCs.js?v=<%= System.currentTimeMillis() %>"></script>

                <%--    用户表格存放容器--%>
                <div id="cs_table_container">
                    <table id="cs_table">
                        <tr style="background-color: cornflowerblue">
                            <th><input type="checkbox" id="select_all_cs" onclick="selectAllCs()"></th>
                            <th>ID</th>
                            <th>姓名</th>
                            <th width="50">性别</th>
                            <th width="150">电话</th>
                            <th>邮箱</th>
                            <th>地址</th>
                            <th>类别</th>
                            <th>描述</th>
                            <th>添加时间</th>
                            <th colspan="3" >操作</th>
                        </tr>
                        <%
                            ArrayList cs_al1=new DB().findCsInfo();
                            Iterator cs_iter=cs_al1.iterator();
                            ArrayList cs_al2;
                            if(session.getAttribute("cs_al") != null){
                                cs_al2 = (ArrayList) session.getAttribute("cs_al");
                                cs_iter = cs_al2.iterator();
                            }
//                          用来确定是哪一行的按钮
                            int cs_i = 0;
                            while(cs_iter.hasNext()){
                                CS cs=(CS)cs_iter.next();
                                cs_i++;
                        %>
                        <tr>
                            <td><input type="checkbox" name="row-checkbox-cs" class="row-checkbox-cs" onchange="showCsBtn()"></td>
                            <td><%= cs.getCs_id()%></td>
                            <td><%= cs.getCs_name() %></td>
                            <td><%= cs.getCs_sex() %></td>
                            <td><%= cs.getCs_phone() %></td>
                            <td><%= cs.getCs_email() %></td>
                            <td><%= cs.getCs_address() %></td>
                            <td><%= cs.getCs_kind() %></td>
                            <td><%= cs.getCs_remark() %></td>
                            <td><%= cs.getCs_addtime() %></td>
                            <td width="25"><input type="button" value="修改" class="cs_modify" onclick="modify_cs(<%= cs_i%>)"></td>
                            <td width="25"><input type="button" value="删除" class="cs_modify" onclick="delete_cs(<%= cs_i%>)"></td>
                            <td width="25"><input type="button" value="打印" class="cs_modify" onclick="print_cs(<%= cs_i%>)"></td>
                        </tr>
                            <%
                            }
                            %>
                    </table>
                    <script charset="utf-8"  src="JS/selectCs.js?v=<%= System.currentTimeMillis() %>"></script>
                </div>
            </div>
            <!--      客服管理对应的右侧页面-->
            <div id="content3" style="display: none" class="main_content">
                <div class="em_menu">
                    <h3 style="display: inline-block">客户请求信息</h3>
                    <select id="se_classify_select">
                        <option value="se_id">ID</option>
                        <option value="se_kind">类别</option>
                        <option value="se_kind">优先级</option>
                        <option value="se_status">处理状态</option>
                        <option value="se_content">描述</option>
                        <option value="se_feedback">回馈</option>
                        <option value="se_satisfaction">满意度</option>
                        <option value="cs_id">客户</option>
                        <option value="em_id">负责人</option>
                    </select>
                    <input id="se_classify_outer" readonly>
                    <input id="se_classify_inner" >
                    <input id="se_classify_btn" type="submit" value="" onclick="classifySe()">
                    <input class="refresh-button" type="button" onclick="se_refresh_page()">
                    <input id="add_se" type="button" value="新增请求" onclick="add_se()">
                    <input id="print_se_table" type="button" value="打印表格" onclick="print_se_table()">
                </div>
                <%--    添加客服管理按钮的相应div，默认隐藏--%>
                <div id="se_modal" class="se_modal">
                    <div class="modal-content">
                        <span class="close-button" onclick="closeSeModal()">&times;</span>
                        <form action="addSeServlet" method="post">
                            <label for="se_id">&nbsp;I&nbsp;D：&nbsp;</label>
                            <input type="text" id="se_id" name="se_id"><br><br>
                            <label for="se_time">时间：</label>
                            <input type="text" id="se_time" name="se_time"><br><br>
                            <script>
                                $(function() {
                                    $( "#se_time" ).datepicker({
                                        dateFormat: "yy-mm-dd"
                                    });
                                });
                            </script>
                            <label for="se_kind">类别：</label>
                            <input type="text" id="se_kind" name="se_kind"><br><br>

                            <label for="se_priority">优先级：</label>
                            <input type="text" id="se_priority" name="se_priority"><br><br>

                            <label for="se_status">状态：</label>
                            <input type="text" id="se_status" name="se_status"><br><br>

                            <label for="se_content">描述：</label>
                            <textarea type="text" id="se_content" name="se_content"></textarea><br><br>

                            <label for="se_feedback">客户反馈：</label>
                            <input type="text" id="se_feedback" name="se_feedback"><br><br>

                            <label for="se_satisfaction">满意度：</label>
                            <input type="text" id="se_satisfaction" name="se_satisfaction"><br><br>
                            <label for="cs_id1">客户：</label>
                            <input type="text" id="cs_id1" name="cs_id1"><br><br>
                            <label for="em_id1">客服：</label>
                            <input type="text" id="em_id1" name="em_id1"><br><br>
                            <button type="submit" class="se_btn" id="se_submit_btn" name="se_btn" value="提交" >提交</button>
                            <button type="submit" class="se_btn" id="se_modify_btn" name="se_btn" value="修改" style="display: none;">修改</button>
                        </form>
                    </div>
                </div>
                <%--    用户表格存放容器--%>
                <div id="se_table_container">
                    <table id="se_table">
                        <tr style="background-color: cornflowerblue">
                            <th><input type="checkbox" id="select_all_se" onclick="selectAllSe()"></th>
                            <th>ID</th>
                            <th>时间</th>
                            <th width="50">类别</th>
                            <th width="50">优先级</th>
                            <th>状态</th>
                            <th>描述</th>
                            <th>反馈</th>
                            <th>满意度</th>
                            <th>客户</th>
                            <th>客服</th>
                            <th colspan="3" >操作</th>
                        </tr>
                        <%
                            ArrayList se_al1=new DB().findSeInfo();
                            Iterator se_iter=se_al1.iterator();
                            ArrayList se_al2;
                            if(session.getAttribute("se_al") != null){
                                se_al2 = (ArrayList) session.getAttribute("se_al");
                                se_iter = se_al2.iterator();
                            }
                            //                          用来确定是哪一行的按钮
                            int se_i = 0;
                            while(se_iter.hasNext()){
                                SE se=(SE)se_iter.next();
                                se_i++;
                        %>
                        <tr>
                            <td><input type="checkbox" name="row-checkbox-em" class="row-checkbox-em"></td>
                            <td><%= se.getSe_id()%></td>
                            <td><%= se.getSe_time() %></td>
                            <td><%= se.getSe_kind() %></td>
                            <td><%= se.getSe_priority() %></td>
                            <td><%= se.getSe_status() %></td>
                            <td><%= se.getSe_content() %></td>
                            <td><%= se.getSe_feedback() %></td>
                            <td><%= se.getSe_satisfaction() %></td>
                            <td><%= se.getCs_id() %></td>
                            <td><%= se.getEm_id() %></td>
                            <td width="25"><input type="button" value="修改" class="cs_modify" onclick="modify_se(<%= se_i%>)"></td>
                            <td width="25"><input type="button" value="删除" class="cs_modify" onclick="delete_se(<%= se_i%>)"></td>
                            <td width="25"><input type="button" value="打印" class="cs_modify" onclick="print_se(<%= se_i%>)"></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                </div>
            </div>
           <%--市场活动的右部分展示--%>
            <div id="content4" style="display: none" class="main_content">
                <%--            顶部容器--%>
                <div class="em_menu">
                    <h3 style="display: inline-block">市场活动</h3>
                    <select id="ac_classify_select">
                        <option value="ac_id">活动ID</option>
                        <option value="ac_name">活动名称</option>
                        <option value="ac_kind">活动类型</option>
                        <option value="ac_address">活动地址</option>
                        <option value="ac_btime">活动开始时间</option>
                        <option value="ac_etime">活动结束时间</option>
                    </select>
                    <input type="button" value="删除选中" class="deleteChecked" id="deleteCheckedAc" onclick="DeleteAllAc()">
                    <input id="ac_classify_outer" readonly>
                    <input id="ac_classify_inner" >
                    <input id="ac_classify_btn" type="submit" value="" onclick="classifyAc()">
                    <input class="refresh-button" type="button" onclick="ac_refresh_page()">
                    <input id="add_ac" type="button" value="新增请求" onclick="add_ac()">
                    <input id="print_ac_table" type="button" value="打印表格" onclick="print_ac_table()">
                </div>
                    <%--            新增市场活动按钮的相应div，默认隐藏--%>
                    <div id="ac_modal" class="ac_modal">
                        <div class="modal-content">
                            <span class="close-button" onclick="closeAcModal()">&times;</span>
                            <form action="addAcServlet" method="post">
                                <label for="Ac_id">&nbsp;I&nbsp;D：&nbsp;</label>
                                <input type="text" id="Ac_id" name="Ac_id"><br><br>

                                <label for="Ac_name">活动名称</label>
                                <input type="text" id="Ac_name" name="Ac_name"><br><br>

                                <label for="Ac_kind">活动类型</label>
                                <input type="text" id="Ac_kind" name="Ac_kind"><br><br>

                                <label for="Ac_content">活动内容</label>
                                <textarea type="text" id="Ac_content" name="Ac_content"></textarea><br><br>

                                <label for="Ac_address">活动地址</label>
                                <input type="text" id="Ac_address" name="Ac_address"><br><br>

                                <label for="Ac_btime">活动开始时间</label>
                                <input type="datetime-local" id="Ac_btime" name="Ac_btime"><br><br>

                                <label for="Ac_etime">活动结束时间</label>
                                <input type="datetime-local" id="Ac_etime" name="Ac_etime"><br><br>
                                <label for="em-ac_id">活动负责人id</label>
                                <select id="em-ac_id" name="em-ac_id">
                                        <option value="null"></option>
                                    <%
                                        ArrayList Em_al1=new DB().findEmInfo();
                                        Iterator Em_iter=Em_al1.iterator();
                                        ArrayList Em_al2;
                                        if(session.getAttribute("em_al") != null){
                                            Em_al2 = (ArrayList) session.getAttribute("em_al");
                                            Em_iter = Em_al2.iterator();
                                        }
                                        //                          用来确定是哪一行的按钮
                                        while(Em_iter.hasNext()){
                                            EM em=(EM)Em_iter.next();
                                    %>
                                        <option value="<%= em.getEm_id() %>"><%= em.getEm_id() %></option>
                                    <%
                                        }
                                    %>
                                </select>

                                <button type="submit" class="ac_btn" id="ac_submit_btn" name="Ac_btn" value="提交" >提交</button>
                                <button type="submit" class="ac_btn" id="ac_modify_btn" name="Ac_btn" value="修改" style="display: none;">修改</button>
                            </form>
                        </div>
                    </div>
                    <%--            删除市场活动参与的顾客相应div，默认隐藏--%>
                    <div id="ac_modal1" class="ac_modal">
                        <div class="modal-content">
                            <span class="close-button" onclick="closePtModal()">&times;</span>
                            <form action="ptServlet" method="post">
                                <label for="ac-cs">活动id</label>
                                <input id="ac-cs" name="ac-cs" readonly></input><br><br>
                                <label for="ac-cs_id">顾客id</label>
                                <select id="ac-cs_id" name="ac-cs_id">
                                    <%
                                        ArrayList pt1_al1=new DB().findCsInfo();
                                        Iterator pt1_iter=pt1_al1.iterator();
                                        ArrayList pt1_al2;
                                        if(session.getAttribute("cs_al") != null){
                                            pt1_al2 = (ArrayList) session.getAttribute("cs_al");
                                            pt1_iter = pt1_al2.iterator();
                                        }
                                        while(pt1_iter.hasNext()){
                                            CS cs=(CS)pt1_iter.next();
                                    %>
                                    <option value="<%= cs.getCs_id() %>"><%= cs.getCs_id() %></option>
                                    <%= cs.getCs_id()%><br>
                                    <%
                                        }
                                    %>
                                </select>
                                <button type="submit" class="ac_btn" id="ac_cs+_btn" name="Pt_btn" value="参与" >参与</button>
                                <button type="submit" class="ac_btn" id="ac_cs-_btn" name="Pt_btn" value="退出" style="display: none;">退出</button>
                            </form>
                        </div>
                    </div>

                <%--    活动存放容器--%>
                <div id="ac_table_container">
                    <table id="ac_table" style="border-collapse: collapse">
                        <tr style="background-color: cornflowerblue">
                            <th><input type="checkbox" id="select_all_ac" onclick="selectAllAc()"></th>
                            <th>活动ID</th>
                            <th>名称</th>
                            <th>类型</th>
                            <th>内容</th>
                            <th>地址</th>
                            <th>开始时间</th>
                            <th>结束时间</th>
                            <th>负责人员</th>
                            <th>参加顾客</th>
                            <th colspan="5" >操作</th>
                        </tr>
                        <%
                            ArrayList ac_al1=new DB().findAcInfo();
                            Iterator ac_iter=ac_al1.iterator();
                            ArrayList ac_al2;
                            if(session.getAttribute("ac_al") != null){
                                ac_al2 = (ArrayList) session.getAttribute("ac_al");
                                ac_iter = ac_al2.iterator();
                            }
//                          用来确定是哪一行的按钮
                            int ac_i = 0;
                            while(ac_iter.hasNext()){
                                AC ac=(AC)ac_iter.next();
                                ac_i++;
                        %>
                        <tr class="row-container">
                            <td><input type="checkbox" name="row-checkbox-ac" class="row-checkbox-ac" onchange="showAcBtn()"></td>
                            <td><%= ac.getAc_id()%></td>
                            <td><%= ac.getAc_name() %></td>
                            <td><%= ac.getAc_kind() %></td>
                            <td><%= ac.getAc_content() %></td>
                            <td><%= ac.getAc_address() %></td>
                            <td><%= ac.getAc_btime() %></td>
                            <td><%= ac.getAc_etime() %></td>
                            <td><%=ac.getEMId()%></td>
                            <td>
                                <%
                                    ArrayList pt_al1=new DB().findCsInfoByAc_id(String.valueOf(ac.getAc_id()));
                                    Iterator pt_iter=pt_al1.iterator();
                                    ArrayList pt_al2;
                                    if(session.getAttribute("pt_al") != null){
                                        pt_al2 = (ArrayList) session.getAttribute("pt_al");
                                        pt_iter = pt_al2.iterator();
                                    }
                                    int biaoji=0;
                                    while(pt_iter.hasNext()){
                                        PT pt=(PT)pt_iter.next();
                                        biaoji=1;
                                %>
                                    <%= pt.getCs_id()%><br>
                                <%
                                    }
                                    if (biaoji == 0) {
                                %>
                                null
                                <%
                                    }
                                %>
                            </td>
                        <td width="25"><input type="button" value="修改" class="ac_modify" onclick="modify_ac(<%= ac_i%>)"></td>
                        <td width="25"><input type="button" value="参与" class="ac_modify" onclick="modify1_pt(<%= ac_i%>)"></td>
                        <td width="25"><input type="button" value="退出" class="ac_modify" onclick="modify2_pt(<%= ac_i%>)"></td>
                        <td width="25"><input type="button" value="删除" class="ac_modify" onclick="delete_ac(<%= ac_i%>)"></td>
                        <td width="25"><input type="button" value="打印" class="ac_modify" onclick="print_ac(<%= ac_i%>)"></td>
                        </tr>
                        <%
                            }
                        %>
                    </table>
                    <script charset="utf-8"  src="JS/selectCs.js?v=<%= System.currentTimeMillis() %>"></script>
                </div>
            </div>
            <div id="content5" style="display: none" class="main_content">数据管理</div>
            <div id="content6" style="display: none" class="main_content">
                    <div class="em_menu">
                        <h3 style="display: inline-block">员工基本信息</h3>
                        <select id="em_classify_select">
                            <option value="em_id">ID</option>
                            <option value="em_name">姓名</option>
                            <option value="em_gender">性别</option>
                            <option value="em_age">年龄</option>
                            <option value="em_position">职位</option>
                            <option value="em_department">部门</option>
                            <option value="em_phone">电话</option>
                            <option value="em_email">邮箱</option>
                        </select>
                        <input id="em_classify_outer" readonly>
                        <input id="em_classify_inner" >
                        <input id="em_classify_btn" type="submit" value="" onclick="classifyEm()">
                        <input class="refresh-button" type="button" onclick="em_refresh_page()">
                        <input id="add_em" type="button" value="添加员工" onclick="add_em()">
                        <input id="print_em_table" type="button" value="打印表格" onclick="print_em_table()">
                    </div>
                    <%--    添加员工按钮的相应div，默认隐藏--%>
                    <div id="em_modal" class="em_modal">
                        <div class="modal-content">
                            <span class="close-button" onclick="closeEmModal()">&times;</span>
                            <form action="addEmServlet" method="post">
                                <label for="em_id">&nbsp;I&nbsp;D：&nbsp;</label>
                                <input type="text" id="em_id" name="em_id"><br><br>
                                <label for="em_name">姓名：</label>
                                <input type="text" id="em_name" name="em_name"><br><br>
                                <label for="em_gender">性别：</label>
                                <select id="em_gender" name="em_gender">
                                    <option  value="男">男</option>
                                    <option  value="女">女</option>
                                </select><br><br>
                                <label for="em_age">年龄：</label>
                                <input type="text" id="em_age" name="em_age"><br><br>

                                <label for="em_position">职位：</label>
                                <input type="text" id="em_position" name="em_position"><br><br>

                                <label for="em_department">部门：</label>
                                <input type="text" id="em_department" name="em_department"><br><br>

                                <label for="em_phone">电话：</label>
                                <input type="text" id="em_phone" name="em_phone"><br><br>

                                <label for="em_email">邮箱：</label>
                                <input type="email" id="em_email" name="em_email"><br><br>
                                <button type="submit" class="em_btn" id="em_submit_btn" name="em_btn" value="提交" >提交</button>
                                <button type="submit" class="em_btn" id="em_modify_btn" name="em_btn" value="修改" style="display: none;">修改</button>
                            </form>
                        </div>
                    </div>
                    <%--    用户表格存放容器--%>
                    <div id="em_table_container">
                        <table id="em_table">
                            <tr style="background-color: cornflowerblue">
                                <th><input type="checkbox" id="select_all_em" onclick="selectAllEm()"></th>
                                <th>ID</th>
                                <th>姓名</th>
                                <th width="50">性别</th>
                                <th width="50">年龄</th>
                                <th>职位</th>
                                <th>部门</th>
                                <th>电话</th>
                                <th>邮箱</th>
                                <th>入职时间</th>
                                <th colspan="3" >操作</th>
                            </tr>
                            <%
                                ArrayList em_al1=new DB().findEmInfo();
                                Iterator em_iter=em_al1.iterator();
                                ArrayList em_al2;
                                if(session.getAttribute("em_al") != null){
                                    em_al2 = (ArrayList) session.getAttribute("em_al");
                                    em_iter = em_al2.iterator();
                                }
    //                          用来确定是哪一行的按钮
                                int em_i = 0;
                                while(em_iter.hasNext()){
                                    EM em=(EM)em_iter.next();
                                    em_i++;
                            %>
                            <tr>
                                <td><input type="checkbox" name="row-checkbox-em" class="row-checkbox-em"></td>
                                <td><%= em.getEm_id()%></td>
                                <td><%= em.getEm_name() %></td>
                                <td><%= em.getEm_gender() %></td>
                                <td><%= em.getEm_age() %></td>
                                <td><%= em.getEm_position() %></td>
                                <td><%= em.getEm_department() %></td>
                                <td><%= em.getEm_phone() %></td>
                                <td><%= em.getEm_email() %></td>
                                <td><%= em.getEm_addtime() %></td>
                                <td width="25"><input type="button" value="修改" class="cs_modify" onclick="modify_em(<%= em_i%>)"></td>
                                <td width="25"><input type="button" value="删除" class="cs_modify" onclick="delete_em(<%= em_i%>)"></td>
                                <td width="25"><input type="button" value="打印" class="cs_modify" onclick="print_em(<%= em_i%>)"></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
    </body>
</html>