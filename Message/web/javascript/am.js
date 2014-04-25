var curShow;
var curItem = 0;
// 指定自定义创建选项
var option =
{
    // 指定rowCreator选项
    rowCreator:function(options)
    {
        var row = document.createElement("tr");
        // 如果当前行索引为偶数，设置其背景色为白色
        if(options.rowNum % 2 == 0)
        {
            row.style.backgroundColor = "#fff";
        }
        // 如果当前行索引为奇数，设置其背景色为淡绿色
        else
        {
            row.style.backgroundColor = "#efe";
        }
        return row;
    }
};

function init()
{
    // 初始化全局变量curShow
    curShow = $("index");
    // 设置全局错误处理函数
    dwr.engine.setErrorHandler(errHandler);
    // 设置页面的loadMesssage
    dwr.util.useLoadingMessage();
}
// 全局错误处理函数
function errHandler(msg)
{
    alert(msg);
}

// 使用正则表达式去掉字符串前后的空格
function trim(s)
{
    return s.replace( /^\s*/, "" ).replace( /\s*$/, "" );
}

// 显示首页
function showIndex()
{
    // curShow是个全局变量，该变量代表用户当前浏览的页面内容
    if (curShow != null)
    {
        // 将当前内容隐藏
        curShow.style.display = "none";
    }
    // 显示首页内容
    $("index").style.display = "";
    // 将首页内容设为当前浏览内容
    curShow = $("index");
}

// 显示登录表单
function showLogin()
{
    // 隐藏当前显示的内容
    if (curShow != null)
    {
        curShow.style.display = "none";
    }
    // 显示登录表格
    $("login").style.display = "";
    curShow = $("login");
}

// 提交登录
function submitLogin()
{
    // 获取loginUser文本框中的输入值
    var loginUser = trim($("loginUser").value);
    // 获取loginPass文本框中的输入值
    var loginPass = trim($("loginPass").value);
    // 获取验证码输入框中的输入值
    var loginVer = trim($("vercode").value);
    var errStr = "";
    // 进行基本校验，判断用户名、密码和图形验证码必须输入，
    // 且输入必须符合指定格式
    if (loginUser == null || loginUser == "")
    {
        errStr += "您没有输入用户名！\n";
    }
    else if (loginPass == null || loginPass == "")
    {
        errStr += "您没有输入密码！\n";
    }
    else if (loginVer == null || loginVer == "")
    {
        errStr += "您没有输入验证码！\n";
    }
    else if (loginUser.length >= 10 || loginUser.length <= 3)
    {
        errStr += "用户名的长度必须在3到10之间！\n";
    }
    else if (loginPass.length >= 10 || loginPass.length <= 3)
    {
        errStr += "用户名的长度必须在3到10之间！\n";
    }
    else if (loginVer.length != 6)
    {
        errStr += "验证码长度必须为6！\n";
    }
    // 如果不能通过客户端校验，弹出出错提示
    if (errStr != "")
    {
        alert(errStr);
        return false;
    }
    // 如果通过了客户端校验，调用远程Java方法
    else
    {
        am.validLogin(loginUser , loginPass , loginVer , submitLoginCb);
    }
}

// 处理登录的回调函数
function submitLoginCb(data)
{
    // 如果服务器响应数据为true，表明登录成功
    if (data)
    {
        // 清空用户输入的登录数据
        dwr.util.setValue("loginUser" , "");
        dwr.util.setValue("loginPass" , "");
        dwr.util.setValue("vercode" , "");
        alert("登录成功，你可以继续使用本系统");
        showIndex();
    }
    // 登录失败
    else
    {
        alert("用户名和密码不符合，登录失败！");
    }
}

// 浏览流拍物品
function viewFail()
{
    // 定义了一个客户端旗标，表明是获取流拍物品
    var flag = "fail";
    // 使用闭包将服务器数据和浏览器数据同时传入回调函数
    var callbackAdapter = function(data)
    {
        viewFailCb(data, flag);
    };
    // 调用am对象的getFailItems方法
    am.getFailItems(callbackAdapter);
}

// 浏览自己的物品
function viewOwnerItem()
{
    // 使用闭包将服务器数据和浏览器数据同时传入回调函数
    var callbackAdapter = function(data)
    {
        viewFailCb(data, "owner");
    };
    am.getItemsByOwner(callbackAdapter);
}

function viewFailCb(data , flag)
{
    // 隐藏当前显示的内容
    if (curShow != null)
    {
        curShow.style.display = "none";
    }
    $("viewFail").style.display = "";
    $("addItem").style.display = "none";
    curShow = $("viewFail");
    // 删除表格viewFailBody的全部行
    dwr.util.removeAllRows("viewFailBody");
    // 如果是浏览所有流拍物品
    if (flag == "fail")
    {
        // 设置表格标题
        dwr.util.setValue("failAndOwnerTitle" , "所有流拍的物品");
        // 浏览流拍物品，没有添加物品的超链接
        $("addItemHref").style.display = "none";
    }
    // 查看自己的拍卖物品
    if (flag == "owner")
    {
        dwr.util.setValue("failAndOwnerTitle" , "您当前的拍卖物品：");
        // 查看自己的拍卖物品时，需要添加物品的超链接
        $("addItemHref").style.display = "";
    }
    // 如果服务器返回的数据不为空，且至少包含了一个物品
    if (data != null && data.length > 0)
    {
        // 指定单元格函数，每个函数对应一列
        var cellfuncs = [
            // 输出物品名
            function(data){
                return data['name'];
            },
            // 输出物品种类
            function(data){
                return data['kind'];
            },
            // 输出物品最大价格
            function(data){
                return data['maxPrice'];
            },
            // 输出物品的描述
            function(data){
                return data['remark'];
            }
        ];
        // 使用data数组中的数据为viewFailBody增加表格行
        dwr.util.addRows("viewFailBody" , data , cellfuncs , option);
    }
    // 如果没有物品显示
    else if (flag == "owner")
    {
        alert("您暂时还没有拍卖物品！");
    }
    else if (flag == "fail")
    {
        alert("暂时没有流拍物品！");
    }
}

// 浏览赢取的物品
function viewSuccess()
{
    // 调用getItemByWiner前端处理方法获取当前用户赢取的物品
    am.getItemByWiner(viewSuccessCb);
}

// 浏览当前用户赢取物品的回调函数
function viewSuccessCb(data)
{
    // 隐藏当前显示内容
    if (curShow != null)
    {
        curShow.style.display = "none";
    }
    // 显示查看赢取物品的表格
    $("viewSucc").style.display = "";
    curShow = $("viewSucc");
    // 删除viewSuccBody的所有表格行
    dwr.util.removeAllRows("viewSuccBody");
    // 如果调用getItemByWiner方法返回值不为空，且获取了至少一个物品
    if (data != null && data.length > 0)
    {
        // 表格函数数组，每个函数对应一列
        var cellfuncs = [
            // 输出物品名
            function(data){
                return data['name'];
            },
            // 输出物品种类
            function(data){
                return data['kind'];
            },
            // 输出物品的赢取价格
            function(data){
                return data['maxPrice'];
            },
            // 输出物品的备注
            function(data){
                return data['remark'];
            }
        ];
        // 将data数据添加为viewSuccBody的表格行
        dwr.util.addRows("viewSuccBody" , data , cellfuncs , option);
    }
    else
    {
        alert("暂时没有赢取任何物品！");
    }
}


// 浏览自己的竞价
function viewBid()
{
    // 调用getBidByUser()前端处理方法来获取当前用户的竞价记录。
    am.getBidByUser(viewBidCb);
}
// 浏览当前用户全部竞价的回调函数
function viewBidCb(data)
{
    // 如果返回值不为空，且至少获取了一次竞价记录
    if (data != null && data.length > 0)
    {
        // 表格函数数组，每个函数对应一列
        var cellfuncs = [
            // 输出竞价的物品
            function(data){
                return data['item'];
            },
            // 输出竞价的价格
            function(data){
                return data['price'];
            },
            // 输出竞价时间
            function(data){
                return data['bidDate'].toLocaleString();
            },
            // 输出竞价用户
            function(data){
                return data['user'];
            }
        ];
        // 删除viewBidBody表格中的所有表格行
        dwr.util.removeAllRows("viewBidBody");
        // 将data中的数据添加为viewBidBody的表格行
        dwr.util.addRows("viewBidBody" , data , cellfuncs , option);
        // 隐藏当前显示的内容
        if (curShow != null)
        {
            curShow.style.display = "none";
        }
        // 显示查看竞价的表格
        $("viewBid").style.display = "";
        curShow = $("viewBid");
    }
    // 如果没有获取对应的竞价记录。
    else
    {
        alert("您暂时还没有任何竞价记录！");
    }
}

// 查看全部物品种类
function viewCatalog()
{
    // 调用getAllKind前端处理方法，获取当前所有种类
    am.getAllKind(viewCatalogCb);
}
// 查看种类的回调函数
function viewCatalogCb(data)
{
    // 如果可以正常获取种类信息
    if (data != null && data.length > 0)
    {
        // 指定表格函数数组，每个函数对应一列
        var cellfuncs = [
            // 输出种类名
            function(data){
                return data['kindName'];
            },
            // 输出种类描述
            function(data){
                return data['kindDesc'];
            }
        ];
        // 删除viewCatalogBody表格中的所有表格行
        dwr.util.removeAllRows("viewCatalogBody");
        // 将data中的数据添加到viewCatalogBody表格中。
        dwr.util.addRows("viewCatalogBody" , data , cellfuncs , option);
        // 隐藏当前显示的内容
        if (curShow != null)
        {
            curShow.style.display = "none";
        }
        // 将种类表格显示出来
        $("viewCatalog").style.display = "";
        $("addKind").style.display = "none";
        curShow = $("viewCatalog");
    }
    else
    {
        alert("暂时还没有种类信息！");
    }
}

// 取消添加种类
function cancelCatalog()
{
    // 将用户输入的种类名，种类描述清空
    dwr.util.setValue("addKindName" , "");
    dwr.util.setValue("addKindDesc" , "");
    // 隐藏添加种类的输入框
    $("addKind").style.display = "none";
}

function addCatalog()
{
    // 获取种类名
    var addKindName = trim($("addKindName").value);
    // 获取种类描述
    var addKindDesc = trim($("addKindDesc").value);
    var errStr = "";
    // 进行客户端输入校验
    if (addKindName == null || addKindName == "")
    {
        errStr += "您没有输入种类名！\n";
    }
    else if (addKindDesc == null || addKindDesc == "")
    {
        errStr += "您没有输入种类描述！\n";
    }
    else if (addKindName.length >= 10 || addKindName.length < 2)
    {
        errStr += "种类名的长度必须在2到10之间！\n";
    }
    else if (addKindDesc.length <=8)
    {
        errStr += "种类描述的长度必须大于8个字符！\n";
    }
    // 如果不能通过客户端输入校验
    if (errStr != "")
    {
        alert(errStr);
        return false;
    }
    // 如果可以通过客户端输入校验
    else
    {
        // 调用addKind前端处理方法来处理添加种类
        am.addKind(addKindName , addKindDesc , addKindCb);
    }
}

// 添加种类的回调函数
function addKindCb(data)
{
    // 方法返回值是新增种类的主键，如果主键大于0，表明增加种类成功
    if (data != null && typeof data == "number" && data > 0)
    {
        alert("添加种类成功");
        // 取消添加
        cancelCatalog();
        // 重新查看系统中所有的物品种类
        viewCatalog();
    }
    else
    {
        alert("添加种类失败");
    }
}

// 显示添加物品的表单控件
function showAddItem()
{
    // 获取所有物品种类
    am.getAllKind(showAddItemCb);
}

// 显示添加物品的回调函数
function showAddItemCb(data)
{
    if (data != null && data.length > 0)
    {
        // 从addItemCatalog的select列表中删除所有选项
        dwr.util.removeAllOptions("addItemCatalog");
        // 将data中的数据项添加为addItemCatalog的select列表中的各项
        dwr.util.addOptions("addItemCatalog" , data ,
            'id' , 'kindName');
        $("addItem").style.display = "";
    }
    // 必须有物品种类，才可以添加物品
    else
    {
        alert("还没有物品种类，请先添加物品种类");
    }
}

// 取消添加物品
function cancelItem()
{
    // 将添加新物品的各输入控件清空
    dwr.util.setValue("addItemName" , "");
    dwr.util.setValue("addItemDesc" , "");
    dwr.util.setValue("addItemPrice" , "");
    dwr.util.setValue("addItemPic" , "");
    // 隐藏添加物品的页面组件
    $("addItem").style.display = "none";
}

// 添加物品
function addItem()
{
    // 先通过输入框获取添加物品的各项基本信息
    var addItemName = trim($("addItemName").value);
    var addItemDesc = trim($("addItemDesc").value);
    var addItemPic = trim($("addItemPic").value);
    // 获取物品的初始价格
    var addItemPrice = trim($("addItemPrice").value);
    // 获取物品的拍卖时间
    var addItemAvail = trim(dwr.util.getValue("addItemAvail"));
    var addItemCatalog = trim(dwr.util.getValue("addItemCatalog"));
    var errStr = "";
    // 进行客户端输入校验
    if (addItemName == null || addItemName == "")
    {
        errStr += "您没有输入物品名！\n";
    }
    else if (addItemPrice == null || addItemPrice == "")
    {
        errStr += "您没有输入物品的起拍价\n";
    }
    else if (addItemName.length >= 10 || addItemName.length < 2)
    {
        errStr += "物品名的长度必须在2到10之间！\n";
    }
    if (isNaN(addItemPrice))
    {
        errStr += "物品的起拍价必须是数字！\n";
    }
    // 如果客户端输入校验不能通过
    if (errStr != "")
    {
        // 输出校验提示信息
        alert(errStr);
        return false;
    }
    // 如果通过客户端输入校验
    else
    {
        // 调用addItem业务方法来处理添加物品
        am.addItem(addItemName, addItemDesc, addItemPic,
            parseFloat(addItemPrice), addItemAvail, addItemCatalog, addItemCb);
    }
}

// 添加物品的回调函数
function addItemCb(data)
{
    // 添加物品后方法返回新增物品的主键
    if (data != null && typeof data == "number" && data > 0)
    {
        alert("添加物品成功");
        // 取消添加
        cancelItem();
        // 查看自己所有处于拍卖中的物品
        viewOwnerItem();
    }
    else
    {
        alert("添加物品失败");
    }
}

// 浏览拍卖中的物品
function viewInBid()
{
    // 调用getAllKind前端处理方法获取所有的物品种类
    am.getAllKind(viewInBidCb);
}
// 浏览拍卖中的物品的回调函数
function viewInBidCb(data)
{
    // 如果当前物品种类不为空，且至少返回了一个物品种类
    if (data != null && data.length > 0)
    {
        // 删除selectBidCatalog下拉列表中的所有选项
        dwr.util.removeAllOptions("selectBidCatalog");
        // 删除拍卖物品表中的全部行
        dwr.util.removeAllRows("viewInBidBody");
        // 将系统当前的所有物品种类添加在selectBidCatalog下拉列表中显示
        dwr.util.addOptions("selectBidCatalog" , data , 'id' , 'kindName');
        // 隐藏当前显示的内容
        if (curShow != null)
        {
            curShow.style.display = "none";
        }
        // 显示浏览拍卖物品的表格
        $("viewInBid").style.display = "";
        curShow = $("viewInBid");
    }
    else
    {
        alert("暂时没有任何物品");
    }
}

// 根据用户选择的种类加载物品
function loadItemByCatalog(cataId)
{
    // 设置显示物品列表的标题
    dwr.util.setValue("bidCatalog" , dwr.util.getText("selectBidCatalog"));
    // 删除物品表格中的所有表格行
    dwr.util.removeAllRows("viewInBidBody");
    // 调用getItemsByKind()前端处理方法
    am.getItemsByKind(cataId , loadItemByCatalogCb);
}
// 根据用户选择的种类记载物品的回调函数
function loadItemByCatalogCb(data)
{
    // 如果调用远程方法的返回值为不空，且获得了至少一个物品
    if (data != null && data.length > 0)
    {
        // 遍历方法返回值中的每个对象
        for (var i = 0; i < data.length; i++ )
        {
            // 创建一个表格行
            var tr = $("viewInBidBody").insertRow(i);
            // 根据表格行的奇偶不同，设置表格行的背景色
            if(i % 2 == 0)
            {
                tr.style.backgroundColor = "#ffffff";
            }
            else
            {
                tr.style.backgroundColor = "#e2ffe2";
            }
            // 插入多个单元格，将数据在表格中显示出来
            var td = tr.insertCell(0);
            td.innerHTML = '<a href="#" onClick="viewDetail('
                + data[i]['id'] +')">' + data[i]['name'] + '</a>';
            td = tr.insertCell(1);
            td.innerHTML = data[i]['addTime'].toLocaleString();
            td = tr.insertCell(2);
            td.innerHTML = data[i]['endTime'].toLocaleString();
            td = tr.insertCell(3);
            td.innerHTML = data[i]['maxPrice'];
            td = tr.insertCell(4);
            td.innerHTML = data[i]['owner'];
        }
    }
    else
    {
        alert("该种类下暂时没有拍卖物品，请重新选择！");
    }
}

// 查看物品详细信息
function viewDetail(itemId)
{
    // 调用getItem前端处理方法，根据物品ID获取该物品的详细信息。
    am.getItem(itemId , viewDetailCb);
}
// 查看物品详细信息的回调函数
function viewDetailCb(data)
{
    // 隐藏当前显示的内容
    if (curShow != null)
    {
        curShow.style.display = "none";
    }
    // curItem是个全局变量，用于保存当前物品ID
    curItem = data["id"];
    // 将获取的物品信息在页面中显示出来
    dwr.util.setValue("detailName" , data["name"]);
    dwr.util.setValue("detailDesc" , data["desc"]);
    dwr.util.setValue("detailRemark" , data["pic"]);
    dwr.util.setValue("detailKind" , data["kind"]);
    dwr.util.setValue("detailOwner" , data["owner"]);
    dwr.util.setValue("detailInitPrice" , data["initPrice"]);
    dwr.util.setValue("detailMaxPrice" , data["maxPrice"]);
    dwr.util.setValue("detailStartTime" , data["addTime"].toLocaleString());
    dwr.util.setValue("detailEndTime" , data["endTime"].toLocaleString());
    // 显示浏览物品详细信息的表格
    $("viewDetail").style.display = "";
    curShow = $("viewDetail");
}

// 取消竞价
function cancelBid()
{
    dwr.util.setValue("bidPrice" , "");
}

// 处理用户竞价
function submitBid()
{
    // 获取竞拍价
    var bidPrice = trim(dwr.util.getValue("bidPrice"));
    // 获取该物品的当前最高价
    var maxPrice = trim(dwr.util.getValue("detailMaxPrice"));
    var errStr = "";
    // 进行客户端的输入校验
    if (bidPrice == null || bidPrice == "")
    {
        errStr += "您没有输入想竞价的价格！\n";
    }
    if (isNaN(bidPrice))
    {
        errStr += "竞价的价格必须是数字！\n";
    }
    // 判断输入的竞拍价必须高于物品的当前最高价
    if (parseFloat(bidPrice) <= parseFloat(maxPrice))
    {
        errStr += "竞价的价格必须高于当前最高出价！\n";
    }
    // 如果客户端输入校验失败，弹出出错提示
    if (errStr != "")
    {
        alert(errStr);
        return false;
    }
    // 客户端输入校验通过
    else
    {
        if(curItem && curItem > 0)
        {
            //调用addBid前端处理方法处理添加竞价
            am.addBid(curItem , parseFloat(bidPrice) , submitBidCb);
        }
    }
}
// 提交竞价回调函数
function submitBidCb(data)
{
    // 如果方法返回值是数字，且大于0，表明竞价成功
    if (data != null && typeof data == "number" && data > 0)
    {
        alert("竞价成功！");
        viewDetail(curItem);
        // 清空竞价输入框
        dwr.util.setValue("bidPrice" , "");
    }
    else
    {
        alert("竞价失败！");
    }
}