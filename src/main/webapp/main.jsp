<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ page import="db.DB"%>
<%@ page import="model.CS" %>
<%@ page import="javax.lang.model.type.ArrayType" %>
<%@ page import="model.EM" %>
<%@ page import="model.SE" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="model.countSe" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta charset="UTF-8">
<%--        此处用了强制加载CSS属性，全部完工后可以删除--%>
        <link rel="stylesheet" type="text/css" href="CSS/main.css?v=<%= System.currentTimeMillis() %>">
        <link rel="stylesheet" type="text/css" href="CSS/service.css?v=<%= System.currentTimeMillis() %>">
        <script charset="utf-8"  src="JS/CRUD_Cs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/importCs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/underPhoto.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/backup.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/notificationIcon.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/checkActivity.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/selectCs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/exportSelectAll.js?v=<%= System.currentTimeMillis() %>"></script>
        <script charset="utf-8"  src="JS/exportCs.js?v=<%= System.currentTimeMillis() %>"></script>
        <script src="https://cdn.sheetjs.com/xlsx-0.20.0/package/dist/xlsx.full.min.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js?v=<%= System.currentTimeMillis() %>"></script>
        <title>客户资源管理</title>
    </head>
    <body>
    <%
        int month =  LocalDate.now().getMonthValue();
    %>
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
                <div id="tongzhi" class="tongzhi" onclick="checkActivity()">

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
            <script charset="utf-8" src="JS/showContent.js"></script>
        </div>
        <%--右侧整个大容器--%>
        <div class="right-container">
            <div id="content1" style="display: block" class="main_content">
                <div class="increaseInfo">
                    <span class="increaseIcon"></span>
                    <p class="increaseP">新增信息</p>
                    <div class="increaseRate">
                        <p class="increaseTitle" style="margin-left: 20px">新增客户</p>
                        <p style="position: absolute;margin-top: 70px;margin-left: 20px"><%= new DB().findIncreaseCs(month)%>人</p>
                        <p style="position: absolute;margin-top: 130px;margin-left: 20px">较上月增加<%= new DB().findIncreaseCs(month)-new DB().findIncreaseCs((month - 1 + 12) % 12)%>人</p>
                    </div>
                    <div class="increaseRate">
                        <p class="increaseTitle" style="margin-left: 20px">新增客服请求</p>
                        <p style="position: absolute;margin-top: 70px;margin-left: 20px"><%= new DB().findIncreaseSe(month)%>个</p>
                        <p style="position: absolute;margin-top: 130px;margin-left: 20px">较上月增加<%= new DB().findIncreaseSe(month)-new DB().findIncreaseSe((month - 1 + 12) % 12)%>个</p>
                    </div>
                    <div class="increaseRate">
                        <p class="increaseTitle" style="margin-left: 20px">新增市场活动</p>
                        <p style="position: absolute;margin-top: 70px;margin-left: 20px"><%= new DB().findIncreaseAc(month)%>个</p>
                        <p style="position: absolute;margin-top: 130px;margin-left: 20px">较上月增加<%= new DB().findIncreaseAc(month)-new DB().findIncreaseAc((month - 1 + 12) % 12)%>个</p>
                    </div>
                    <div class="increaseRate">
                        <p class="increaseTitle" style="margin-left: 20px">新增员工</p>
                        <p style="position: absolute;margin-top: 70px;margin-left: 20px"><%= new DB().findIncreaseEm(month)%>人</p>
                        <p style="position: absolute;margin-top: 130px;margin-left: 20px">较上月增加<%= new DB().findIncreaseEm(month)-new DB().findIncreaseEm((month - 1 + 12) % 12)%>人</p>
                    </div>
                </div>
                <div class="dealChart">
                    <p style="position: absolute;font-size: 18px">客户请求完成情况</p>
                    <div id="chartContainer" style="height: 350px; width: 100%; margin-top: 70px">
                        <script type="text/javascript">
                            // 获取当前日期
                            var currentDate = new Date();
                            // 获取当前月份
                            var currentMonth = currentDate.getMonth();
                            // 创建一个数组，存储前6个月到本月的月份名称
                            var monthNames = ["1", "2", "3", "4", "5", "6",
                                "7", "8", "9", "10", "11", "12"];
                            var months = [];
                            for (var i = 0; i < 7; i++) {
// 计算前6个月到本月的月份索引（从0开始）
                                var monthIndex = (currentMonth - 6 + i + 12) % 12;
// 将对应的月份名称添加到数组中
                                months.push(monthNames[monthIndex]);
                            }

                            // 创建一个数组，存储前6个月到本月的数量数据（由您给出）
                            var dataPoints = [<%= new DB().findIncreaseSeStatus((month - 6 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus((month - 5 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus((month - 4 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus((month - 3 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus((month - 2 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus((month - 1 + 12) % 12)%>, <%= new DB().findIncreaseSeStatus(month)%>];
                            // 使用CanvasJS.Chart构造函数来创建一个图表对象
                            var chart = new CanvasJS.Chart("chartContainer", {
// 指定图表的主题
                                theme: "light2",
// 指定图表的标题
                                title:{
                                    text: "近6个月请求处理数量"
                                },
// 指定图表的横轴
                                axisX:{
                                    title: "月份",
// 将横轴的标签设置为月份名称
                                    labelFormatter: function(e) {
                                        return months[e.value];
                                    }
                                },
// 指定图表的纵轴
                                axisY:{
                                    title: "数量",
                                    includeZero: false
                                },
// 指定图表的数据
                                data: [{
                                    type: "line",
                                    markerSize: 5,
// 将数据点设置为数量数据
                                    dataPoints: dataPoints.map(function(value, index) {
                                        return {x: index, y: value};
                                    })
                                }]
                            });
                            // 调用图表对象的render方法来渲染图表
                            chart.render();
                        </script>
                    </div>
                </div>
                <div class="rankChart">
                    <p style="position: absolute;font-size: 18px">客服排行榜</p>
                    <div id="rankchartContainer" style="height: 330px; width: 100%; margin-top: 70px">
                        <table id="seRankTable">
                            <tr style="background-color: cornflowerblue">
                                <th width="200">排名</th>
                                <th width="200">客服ID</th>
                                <th width="200">完成数目</th>
                            </tr>
                            <%
                                ArrayList cnt_al=new DB().findSeRank();
                                Iterator cnt_iter = cnt_al.iterator();
//                          用来确定是哪一行的按钮
                                int rank_i = 0;
                                while(cnt_iter.hasNext()){
                                    countSe cntse=(countSe) cnt_iter.next();
                                    rank_i++;
                            %>
                            <tr>
                                <td><%= rank_i%></td>
                                <td><%= cntse.getEm_id() %></td>
                                <td><%= cntse.getCount() %></td>
                            </tr>
                            <%
                                }
                            %>
                        </table>
                    </div>
                </div>
            </div>
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
                    <input type="checkbox" id="cb_cs_date" class="ck_out_cs" checked>
                    <label for="cb_cs_date" id="cs_remark-date">添加时间</label>
                    <br><br>
                    <p style="font-weight: bold">选择导出文件类型</p>
                    <input type="radio" name="out_file_kind" id="xls" class="out_file_kind" checked>
                    <label for="xls" >xls</label>
                    <input type="radio" name="out_file_kind" id="csv" class="out_file_kind">
                    <label for="xls" >csv</label>
                    <input type="button" id="out_cs_btn" value="导出" onclick="out_cs()">
                    <input type="button" id="out_cs_btn_back" value="取消" onclick="close_out_cs()">
                </div>

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

                </div>
            </div>
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
                            <th width="25px"></th>
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
                            <td><%
                                if(se.getSe_status().equals("已处理")){
                                    out.print("<div class=\"seStatus\" id=\"seStatus\" style=\"background-color: green;\">");
                                } else {
                                    out.print("<div class=\"seStatus\" id=\"seStatus\" style=\"background-color: red;\">");
                                }
                            %></td>
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
            <div id="content4" style="display: none" class="main_content">市场活动</div>
            <div id="content5" style="display: none" class="main_content">
                <h3 style="display: inline-block">备份与恢复</h3>
                <!-- 备份按钮 -->
                <button id="backupBtn">备份</button>
                <input type="file" id="backupFileInput" style="display: none">

                <!-- 恢复按钮 -->
                <button id="importBtn">恢复</button>
                <input type="file" id="importFileInput" style="display: none">

                <!-- 自动备份时间间隔设置 -->
                <h3>设置自动备份时间间隔</h3>
                <form id="intervalForm">
                    <input type="text" id="backupInterval" placeholder="时间间隔(天)">
                    <button id="intervalSubmit">设置自动备份</button>
                </form>

            </div>
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