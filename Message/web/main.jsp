<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="ExtJS/resources/css/ext-all.css"/>
    <script type="text/javascript" src="ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="ExtJS/ext-lang-zh_CN.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="javascript/main.js"></script>
    <title></title>
</head>
<body>
    <div>
        <div id="header" align="center">
            <img src="image/login/header.gif" />
        </div>
        <div id="userinfo" align="center">
            <!--use the extJS css in helloWin-->
            <%--<div id="helloWin"></div>--%>
            <div id="user" align="left">
                <h4>欢迎您，
                <%=session.getAttribute("XCJ_USER")%>
                </h4>
            </div>
        </div>
        <div id="pages">

        </div>
        <div id="content">

        </div>
        <div id="info">

        </div>
    </div>
</body>
</html>