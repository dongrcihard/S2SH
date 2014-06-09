<%--
  Created by IntelliJ IDEA.
  User: dongxl
  Date: 14-4-9
  Time: 上午11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" type="text/css" href="ExtJS/resources/css/ext-all.css"/>
    <script type="text/javascript" src="ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="ExtJS/ext-lang-zh_CN.js"></script>
    <link href="css/html.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="javascript/login_window.js"></script>
    <title>欢迎光临高速清分专用设备实时远程专家诊断系统</title>
    <%
        //获取
        if (session.getAttribute("userId") != null) {
            //using send redirect method is better than the forward
            response.sendRedirect("main.jsp");
        }
    %>

</head>
<body style="margin: 0; background-color: #013cc4">
<%--整体页面--%>
<div>
        <div id="header">
            <div id="top_left">
                <img src="image/login/logo.jpg"/>
            </div>
        </div>
        <div id="middle">
            <div id="mid_left">
                <img src="image/login/middle_content_bg.jpg"/>
                <div id="loginWin"></div>
            </div>
            <div id="line">
                <img src="image/login/line.jpg"/>
            </div>
        </div>
        <div id="bottom">
            <div id="bot_left">
                <img src="image/login/bottom_bg.jpg"/>
                <span id="copyright">版权归属:中国印钞造币总公司技术中心 Copyright©2013 CBPMC All Rights Reserved</span>
            </div>
            <div id="bot_right"></div>
        </div>
    </div>
</body>
</html>
