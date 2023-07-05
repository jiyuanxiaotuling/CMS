<%--
  Created by IntelliJ IDEA.
  User: 57555
  Date: 2023/6/28
  Time: 11:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" pageEncoding="gb2312"%>
<html>
<head>
    <title>留言板</title>
    <style>
        body{
            background-image: url("CSS/icon/liuyan_back.png");
            background-size: 100% 100%;
            background-attachment: fixed;
        }
    </style>
</head>
<body>
    <form action="addServlet" method="post">
        <div style="position: relative;
	            margin: 20% auto;">
            <table border="1" style="margin: 0 auto;">
                <caption>填写留言信息</caption>
                <tr><td>留言标题</td>
                    <td><input type="text" name="title"/></td></tr>
                <tr><td>留言内容</td>
                    <td><textarea name="content" rows="5" cols="35"></textarea></td></tr>
            </table>
            <div style="text-align: center">
                <input type="submit" value="提交" style="margin: 0 auto;"/>
                <input type="reset" value="重置" style="margin: 0 auto;"/>
            </div>
        </div>
    </form>
</body>
</html>
