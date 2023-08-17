<%@ page import="java.util.ArrayList" %>
<%@ page import="db.DB" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="model.EM" %>
<%@ page import="model.AC" %><%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/schedule.css?v=<%= System.currentTimeMillis() %>">
    <script charset="utf-8" src="JS/jump.js?v=<%= System.currentTimeMillis() %>"></script>
    <title>�ճ�</title>
</head>
<body bgcolor="#E3E3E3">
<%
    String id = (String) session.getAttribute("emId");
    ArrayList ac_al = new DB().findDate(id);
    Iterator ac_iter = ac_al.iterator();
    AC ac = (AC)ac_iter.next();
    ArrayList em_al=new DB().findEmInfoById(id);
    Iterator em_iter=em_al.iterator();
    EM em = (EM)em_iter.next();
%>
    <div class="left-container">
        <div class="head_photo">
        </div>
        <p style="position: relative;margin-left: 50%;margin-top: 27px"><%=em.getEm_name()%></p>
        <div id="content3" class="content" onclick="returnMain()">
            <div id="returnIcon">
            </div>
            <h3 style="cursor:pointer;">������ҳ</h3>
        </div>
    </div>
    <div class="top-container">
        <h2 class="head-title">�ͻ���Դ����ϵͳ</h2>
    </div>
<%-- �ճ̾�����Ϣ--%>
    <div id="modal" class="modal">
        <div class="modal-content">
            <span class="close-button" onclick="closeModal()">&times;</span>
                <br>
                <label for="ac_id">&nbsp;I&nbsp;D��&nbsp;</label>
                <input type="text" id="ac_id" name="ac_id" value="<%= ac.getAc_id()%>"><br><br>

                <label for="ac_name">����ƣ�</label>
                <input type="text" id="ac_name" name="ac_name" value="<%= ac.getAc_name()%>"><br><br>

                <label for="ac_kind">����</label>
                <input type="text" id="ac_kind" name="ac_kind" value="<%= ac.getAc_kind()%>"><br><br>

                <label for="ac_content">����������</label>
                <textarea id="ac_content" name="ac_content"><%= ac.getAc_content()%></textarea><br><br>

                <label for="ac_address">��ַ��</label>
                <input type="text" id="ac_address" name="ac_address" value="<%= ac.getAc_address()%>"><br><br>

                <label for="ac_btime">��ʼʱ�䣺</label>
                <input type="text" id="ac_btime" name="ac_btime" value="<%= ac.getAc_btime_specific()%>"><br><br>

                <label for="ac_etime">����ʱ�䣺</label>
                <input type="text" id="ac_etime" name="ac_etime" value="<%= ac.getAc_etime_specific()%>"><br><br>
        </div>
    </div>
    <div id="calendar">
        <div class="header">
            <div class="btn-group">
                <button class="left"><</button>
                <button class="right">></button>
            </div>
            <h3 id="title"></h3>
            <button class="skipToToday">��������</button>
        </div>
        <div class="week">
            <li>��</li>
            <li>һ</li>
            <li>��</li>
            <li>��</li>
            <li>��</li>
            <li>��</li>
            <li>��</li>
        </div>
        <input id="year" value="<%= session.getAttribute("year")%>" style="display: none">
        <input id="month" value="<%= session.getAttribute("month")%>" style="display: none">
        <input id="day" value="<%= session.getAttribute("day")%>" style="display: none">
        <input id="emid" value="<%= session.getAttribute("emId")%>" style="display: none">
        <div id="content">
        </div>
    </div>
    <script charset="utf-8" src="JS/schedule.js?v=<%= System.currentTimeMillis() %>"></script>
    <script>
        let em_id = document.getElementById("emid").value;
        console.log(typeof em_id);
        console.log(em_id);
        let xhr = new XMLHttpRequest();
        xhr.open("POST", "getDateServlet", true); // �滻Ϊ��˽ӿڵ�URL
        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        xhr.send("em_id=" + encodeURIComponent(em_id)); // ��ID��Ϊ�������͵����
        xhr.onreadystatechange = function() {
            if (this.readyState === XMLHttpRequest.DONE && this.status === 200) {
                 <%--var ac_ar = <%= new Gson().toJson(session.getAttribute("ac_ar"))%>; // ��ȡac_ar���Ե�ֵ--%>
                // ���������ʹ��ac_ar���к�������
                // console.log(typeof ac_ar)
                // console.log(ac_ar);
                // var Year = document.getElementById("year").value;
                // var Month = document.getElementById("month").value;
                // var Day = document.getElementById("day").value;
                // var divElement = document.querySelectorAll('[name="dateDiv"]');
                // divElement.forEach(dateDiv => {
                //     const date = dateDiv.getAttribute('date');
                //     var dateParts = date.split('/');
                //     const year = dateParts[0]; // ���
                //     const month = dateParts[1]; // �·�
                //     const day = dateParts[2]; // ����
                //     if (Year === year  && Month === month && Day === day) {
                //         dateDiv.style.backgroundColor = "#5DCEC3";
                //     }
                // });
            }
        };

    </script>
</body>
</html>
