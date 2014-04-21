var curPage = 1;
// 保存当前登录的用户
var curUser = -1;
// 登录用的对话框
var login = $("login");
// 发贴用的对话框
var post = $("post");
// 查看帖
var view = $("view");

// 定义全局的错误处理函数
function errHandler(msg , ex)
{
	alert(ex.message);
}
function init()
{
	// 初始化3个对话框元素
	login = $("login");
	post = $("post");
	view = $("view");
	// 定义全局错误处理器
	dwr.engine.setErrorHandler(errHandler);
	ms.isLogin(initCb); 
}
// 指定页面加载时指定init()函数
document.body.onload = init;
function initCb(data)
{
	// 如果已经登录系统
	if (data > 0)
	{
		// 将HttpSession中的userId赋给curUser变量。
		curUser = data;
		getAllMsgByPage();
	}
	// 没有登录
	else
	{
		showDialog(login);
	}
}

function showDialog(element)
{
	// 定义element元素的位置
	element.style.top = document.documentElement.scrollTop 
		+ document.documentElement.clientHeight / 4 +  "px";
	element.style.left = document.documentElement.scrollLeft
		+ document.documentElement.clientWidth / 4 + "px";
	// 让element元素显示出来
	element.style.display = "";
}

function showPost()
{
	if (curUser > 0)
	{
		// 只有当用户已经登录时才显示发帖对话框
		showDialog(post);
	}
	else
	{
		alert("请先登录系统！");
	}
	return false;
}

//------------用户登录------------
function userLogin()
{
	// 必须输入用户名和密码才可以登录
	if (dwr.util.getValue("user") != null 
		&& dwr.util.getValue("user") != "" 
		&& dwr.util.getValue("pass") != null
		&& dwr.util.getValue("pass") != "")
	{
		// 调用loginPro方法处理用户登录
		ms.loginPro(dwr.util.getValue("user") , 
			dwr.util.getValue("pass") , loginCb);
	}
	else
	{
		alert("请先输入用户名和密码");
	}
}
//------------登录用的回调函数--------------
function loginCb(data)
{
	if (data > 0)
	{
		curUser = data;
		alert("登录成功");
		login.style.display = "none";
		// 发送列出全部消息的
		getAllMsgByPage();

	}
	else
	{
		alert("您输入的用户名和密码不符合");
	}
}

//-----------获取系统全部消息列表-------------
function getAllMsgByPage()
{
	ms.getAllMessageByPage(curPage , getMsgCb);
	// 每2秒调用一次getAllMsgByPage()方法来获取消息列表
	setTimeout("getAllMsgByPage();" , 2000);
}
//-----------获取消息列表的回调函数-----------
function getMsgCb(data)
{
	if (data == null && curPage != 1)
	{
		alert("后面已经没有记录了！");
		curPage--;
	}
	if (data != null)
	{
		var show = document.getElementById("show");
		// 删除表格内全部内容。
		dwr.util.removeAllRows("show");
		// 遍历所有的消息列表
		for (var obj in data )
		{
			var row = document.createElement("tr");
			var title = data[obj]['title'];
			var owerName = data[obj]['owerName'];
			var msgId = data[obj]['id'];
			// 添加单元格来显示消息发布者
			var cell = document.createElement("td");
			cell.innerHTML = owerName;
			row.appendChild(cell);
			// 添加单元格来显示消息标题
			cell = document.createElement("td");
			cell.innerHTML = "<a href='#' onclick='getMsg("
				+ msgId + ")'>" + title + "</a>";
			row.appendChild(cell);
			show.appendChild(row);
		}
	}
}

//-------------用户发布新消息---------------
function addMsg()
{
	// 如果用户已经登录
	if(curUser > 0)
	{
		// 消息标题、消息内容不为空
		if (dwr.util.getValue("title") != null 
			&& dwr.util.getValue("title") != "" 
			&& dwr.util.getValue("content") != null
			&& dwr.util.getValue("content") != "")
		{
			//调用createMessage()方法来发布新消息
			ms.createMessage(dwr.util.getValue("title") , 
				dwr.util.getValue("content") , parseInt(curUser) , addMsgCb);
			dwr.util.setValue("title", "");
			dwr.util.setValue("content", "");
		}
		else
		{
			alert("请先输入消息标题和消息内容");
		}
	}
	else
	{
		alert("请先登录系统！");
	}
}

function addMsgCb(data)
{
	// 如果发布新消息成功
	if (data > 0)
	{
		alert("添加消息成功");
	}
	else
	{
		alert("添加消息失败");
	}
	// 隐藏发布新消息的对话框
	post.style.display='none';
}

//-------------上页函数-------------
function prePage()
{
	if (curPage <= 1)
	{
		alert("已经是第一页了，无法翻页");
	}
	else
	{
		// 调用getAllMessageByPage方法来发送分页请求
		ms.getAllMessageByPage(--curPage , getMsgCb);
	}
	return false;
}
//-------------下页函数-------------
function nextPage()
{
	// 调用getAllMessageByPage方法来发送分页请求
	ms.getAllMessageByPage(++curPage , getMsgCb);
	return false;
}

//----------根据主键获取消息----------
function getMsg(data)
{
	// 如果用户还未登录
	if (curUser > 0)
	{
		if (typeof data == 'number' && data > 0)
		{
			ms.getMessage(data , getMsgDetailCb);
		}
	}
	else
	{
		alert("请先登录系统！");
	}
	return false;
}
//---------根据主键获取消息的回调函数-------
function getMsgDetailCb(data)
{
	if (data != null)
	{
		dwr.util.setValue('viewTitle' , data.title);
		dwr.util.setValue('viewAuthor' , data.owerName);
		dwr.util.setValue('viewContent' , data.content);
		showDialog(view);
	}
}

//-----------用户注册-----------
function userRegist()
{
	// 如果用户名、密码不为空
	if (dwr.util.getValue("user") != null 
		&& dwr.util.getValue("user") != "" 
		&& dwr.util.getValue("pass") != null 
		&& dwr.util.getValue("pass") != "")
	{
		// 调用createUser()方法处理用户注册
		ms.createUser(dwr.util.getValue("user") ,
			dwr.util.getValue("pass") , registCb);
	}
	else
	{
		alert("请先输入用户名和密码");
	}
}
//-----------注册用的回调函数-----------
function registCb(data)
{
	// 如果注册成功
	if (data > 0)
	{
		//将用户ID赋给curUser变量
		curUser = data;
		alert("注册成功");
		login.style.display = "none";
		getAllMsgByPage();
	}
	else
	{
		alert("注册失败，请更换新的用户名和密码！");
	}
}