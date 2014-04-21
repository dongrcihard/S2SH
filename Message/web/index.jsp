<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
	<meta name="author" content="Yeeku.H.Lee(CrazyIt.org)" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>即时消息系统</title>
	<link href="css/msg.css" rel="stylesheet" type="text/css" />
</head>
<body onload="init();">
<script type='text/javascript' src='leedwr/engine.js'></script>
<script type='text/javascript' src='leedwr/util.js'></script>
<script type='text/javascript' src='leedwr/interface/ms.js'></script>
<script type='text/javascript' src='javascript/mm.js'></script>

<!-- 登录用的对话框 -->
<div id="login" class="dialog" style="display:none">
<table>
	<caption>登录/注册</caption>
	<tr>
		<td>用户名：</td>
		<td><input id="user" type="text" /></td>
	</tr>
	<tr>
		<td>密&nbsp;&nbsp;码：</td>
		<td><input id="pass" type="text" /></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" id="hider0" 
			value="登录" onclick="userLogin();" />
		<input type="button" id="hider1" 
			value="注册" onclick="userRegist();" />
		</td>
	</tr>
</table>
</div>
<!-- 发消息用的对话框 -->
<div id="post" class="dialog" style="display:none">
<table>
	<caption>发布新消息</caption>
	<tr>
		<td>标题：</td>
		<td><input id="title" type="text" /></td>
	</tr>
	<tr>
		<td>内容：</td>
		<td><textarea id="content" cols="50" rows="8"></textarea>
		</td>
	</tr>
	<tr>
	<td colspan="2" align="center">
		<input type="button" id="hider2" value="发布"
			onclick="addMsg();"/>
		<input type="button" id="hider3" value="取消" 
			onclick="$('post').style.display='none';"/>
	</td>
	</tr>
</table>
</div>
<!-- 查看消息用的对话框 -->
<div id="view" class="dialog" style="display:none">
<table>
	<caption>查看消息</caption>
	<tr>
		<td>标题：</td>
		<td><input id="viewTitle" type="text" 
			disabled="disabled"/></td>
	</tr>
	<tr>
		<td>发布者</td>
		<td><input id="viewAuthor" type="text"
			disabled="disabled"/></td>
	</tr>
	<tr>
		<td>内容：</td>
		<td><textarea id="viewContent" cols="50" rows="8"
			disabled="disabled"></textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center">
		<input type="button" id="hider4" value="关闭" 
			onclick="$('view').style.display='none';"/>
		</td>
	</tr>
</table>
</div>
<table width="600" border="1" align="center">
	<caption>
		即时消息系统
	</caption>
	<tbody><tr>
	<td colspan="2" align="right">
	<a href="#" onclick="showPost();return false;">发布消息</a></td>
	</tr>
	<tr>
		<th width="120">作者</th>
		<th >消息标题</th>
	</tr></tbody>
<tbody id="show">  
	<tr>
		<td width="120">&nbsp;</td>
		<td >&nbsp;</td>
	</tr>
</tbody>
</table>
<table width="600" border="1" align="center">
	<tr>
		<td align="right">
		<a href="#" onclick="prePage();return false;">上一页</a>
		<a href="#" onclick="nextPage();return false;">下一页</a>
	</td>
	</tr>
</table>
<hr />
<div align="center">
All Rights Reserved.<br />
版权所有 Copyright&copy;2013 Yeeku.H.Lee <br />
如有任何问题和建议，请登录<a href="http://www.crazyit.org">疯狂Java联盟</a>发表<br />
</div>
</body>
</html>