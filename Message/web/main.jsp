<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head lang="en">
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="ExtJS/resources/css/ext-all.css"/>
    <script type="text/javascript" src="ExtJS/ext-all.js"></script>
    <script type="text/javascript" src="ExtJS/ext-lang-zh_CN.js"></script>
    <link href="css/main.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src='leedwr/engine.js'></script>
    <script type='text/javascript' src='leedwr/util.js'></script>
    <script type='text/javascript' src='leedwr/interface/ms.js'></script>
    <script type="text/javascript" src="javascript/main.js"></script>
    <title>设备状态</title>
</head>
<body>
    <%--now it is the better way to deal with the pages link--%>
    <%--it is to declare the taglib before using the core c:  --%>
    <c:if test="${sessionScope.userId eq null}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <div>
        <div id="header" align="center">
            <img src="image/login/header.gif" />
        </div>
        <hr class="line"/>
        <div id="userinfo" align="center">
            <!--use the extJS css in helloWin-->
            <%--<div id="helloWin"></div>--%>
            <div id="user" class="user_area">
                欢迎您，${sessionScope.userId}
            </div>
            <div id="time">
                <input type="text" id="now_time" class="user_area">
            </div>
            <div id="logout">
                <a href="logout.do" class="user_area">退出</a>
            </div>
        </div>
        <hr class="line"/>
        <div id="pages">
            <table>
                <tr>
                    <td align="center" class="td_caption">
                        <a href="hardware.jsp"  class="caption">硬件状态</a>
                    </td>
                    <td align="center" class="td_caption">
                        <a href="parameter.jsp"  class="caption">软件参数</a>
                    </td>
                    <td align="center" class="td_caption">
                        <a href="progress.jsp"  class="caption">运行历史</a>
                    </td>
                    <td align="center" class="td_caption">
                        <a href="history.jsp"  class="caption">操作记录</a>
                    </td>
                    <td align="center" class="td_caption">
                        <a href="user.jsp"  class="caption">用户管理</a>
                    </td>
                </tr>
            </table>
        </div>
        <hr class="line"/>
        <div id="sub_caption" align="center">
            <div id="sub_caption_name" class="user_area">设备当前运行状态:</div>
        </div>
        <hr class="line"/>
        <div id="content">
            <input type="text" id="batch_no" class="content_data" value="批次：999999"/>
            <input type="text" id="step_no" class="content_data" value="批次：999999"/>
            <input type="text" id="total_bns" class="content_data" value="总数：999999"/>
            <input type="text" id="rm_bns" class="content_data" value="拒钞：50000"/>
            <input type="text" id="dmo_lab" class="content_data" value="好钞1"/>
            <input type="text" id="dmo_bns" class="content_data" value="100"/>
            <input type="text" id="dmt_lab" class="content_data" value="好钞2"/>
            <input type="text" id="dmt_bns" class="content_data" value="100"/>
            <input type="text" id="smo_lab" class="content_data" value="抽样"/>
            <input type="text" id="smo_bns" class="content_data" value="10000"/>
            <input type="text" id="smt_lab" class="content_data" value="废钞"/>
            <input type="text" id="smt_bns" class="content_data" value="10000"/>
        </div>
        <div id="info">

        </div>
    </div>
</body>
</html>