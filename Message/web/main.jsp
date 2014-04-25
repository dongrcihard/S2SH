<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <meta name="author" content="Yeeku.H.Lee(CrazyIt.org)" />
    <meta http-equiv="Content-Type" content="text/html; charset=gbk" />
    <title> 商业拍卖Ajax+Java EE程序框架 </title>
    <link href="css/css.css" rel="stylesheet" type="text/css"/>
    <script type='text/javascript' src='leedwr/engine.js'> </script>
    <script type='text/javascript' src='leedwr/interface/am.js'></script>
    <script type='text/javascript' src='leedwr/util.js'></script>
    <script type='text/javascript' src='javascript/am.js'></script>
</head>
<body onload="init();">
<table width="780" border="0" align="center"
       cellpadding="0" background="image/auction/bodybg.jpg">
    <tr>
        <td width="164" height="94" rowspan="2" >
            <a href="http://www.crazyit.org">
                <img src="http://www.crazyit.org/logo.jpg" alt="疯狂Java联盟" border="0" align="right"/>
            </a></td>
        <td width="443" height="65">
            <font size="+2" color="#C60"><b>商业拍卖Ajax+Java EE程序框架</b></font></td>
        <td width="165" rowspan="2">
            <div align="left"><a href="http://www.crazyit.org">
                <img src="http://www.crazyit.org/logo.jpg" alt="疯狂Java联盟" border="0"/></a></div></td>
    </tr>
    <tr>
        <td height="15"><div align="center" class="title">
            如果需要开发高档的Ajax+Java EE应用，请登录<a href="http://www.crazyit.org">http://www.crazyit.org</a>联系</div>
        </td>
    </tr>
    <tr>
        <td colspan="3"><br />
            <table width="631" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="47"><a href="#" onclick="showLogin();return false;">登录</a></td>
                    <td width="95"><a href="#" onclick="viewSuccess();return false;">查看竞得物品</a></td>
                    <td width="99"><a href="#" onclick="viewFail();return false;">浏览流拍物品</a></td>
                    <td width="66"><a href="#" onclick="viewCatalog();return false;">管理种类</a></td>
                    <td width="75"><a href="#" onclick="viewOwnerItem();return false;">管理物品</a></td>
                    <td width="95"><a href="#" onclick="viewInBid();return false;">浏览拍卖物品</a></td>
                    <td width="99"><a href="#" onclick="viewBid();return false;">查看自己竞标</a></td>
                    <td width="84"><a href="#" onclick="showIndex();return false;">返回首页</a></td>
                </tr>
            </table></td>
    </tr>
    <tr>
        <td height="5" colspan="3"><hr /></td>
    </tr>
</table>
<!-- 上面是页面头部分 -->
<!-- 首页表格  -->
<table id="index" width="780" align="center" background="image/auction/bodybg.jpg">
    <tr>
        <td colspan="3">
            <br /><br />
            <p>这仅仅是一个Ajax+Java EE的框架程序。程序模拟一个简单电子拍卖站点的功能。</p>
            <p>程序的功能不是很复杂，但模拟了一个Ajax+Java EE的程序结构，
                技术包括：DWR,Spring,Hibernate <br />
                JavaMail,整个应用使用Spring提供的DAO支持操作数据库,同时利用Spring的声明式事务,<br />
                Spring的邮件抽象层。程序中的权限检查使用Spring的AOP框架支持，也利用了Spring的任务调度抽象<br />
                Hibernate为底层的数据库访问提供支持,作为O/R Mapping框架使用。</p>
            <p>本程序的源代码随程序一起发布，版权属于疯狂Java联盟（http://www.crazyit.org）<br />
                任何个人可用来参考学习Ajax+Java EE架构，规范，但请勿在本程序的基础上修改，用做任何商业用途。<br />
                本人保留依法追究相关责任的权利。转载和学习请保留此信息。</p>
            <br />
        </td>
    </tr>
</table>
<!-- 登录表格 -->
<table id="login" style="display:none" width="780"
       align="center" background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <form action="#">
                <table width="420" border="0" align="center" cellpadding="4" cellspacing="0">
                    <tr>
                        <td height="27">欢迎登录系统，请输入您的用户名和密码：</td>
                    </tr>
                    <tr>
                        <td>用户名：<input id="loginUser" type="text" size="15"/>
                        </td>
                    </tr>
                    <tr>
                        <td>密&nbsp;&nbsp;码：<input id="loginPass" type="text" size="15"/>
                        </td>
                    </tr>
                    <tr>
                        <td>验证码：<input id="vercode" type="text" size="15" maxlength="6" />
                        </td>
                    </tr>
                    <tr>
                        <td>验证码：<img src="auth.jpg" name="d" id="d" alt="验证码"/> </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="button" name="submit" onclick="submitLogin();" value="登录" />
                            <input type="reset" name="submit" value="清除" />
                        </td>
                    </tr>
                    <tr>
                        <td rowspan="2">如果您还有没有账户，请与系统管理员联系，本系统不提供注册！</td>
                    </tr>
                </table>
            </form>
        </td>
    </tr>
</table>
<!-- 查看所属/流拍物品 -->
<table id="viewFail" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <br />
            <table width="80%" border="0" align="center" cellspacing="1" bgcolor="#ccc">
                <tbody>
                <tr bgcolor="#eee">
                    <td colspan="4" ><div id="failAndOwnerTitle" class="mytitle">所有流拍的物品</div></td>
                </tr>
                <tr>
                    <th>物品名</th>
                    <th>物品种类</th>
                    <th>初始/最高价格</th>
                    <th>物品描述</th>
                </tr>
                </tbody>
                <tbody id="viewFailBody">
                </tbody>
            </table>
            <br />
            <a id="addItemHref" href="#" onclick="showAddItem(); return false;">添加物品</a>
            <br /><br />
            <!-- 添加新拍卖物品的表格 -->
            <table id="addItem" style="border:1px solid #666;display:none"
                   width="383" border="0" align="center">
                <tr>
                    <td height="37" colspan="2">添加新物品</td>
                </tr>
                <tr>
                    <td height="37" width="20%">物&nbsp;品&nbsp;名：</td>
                    <td><input id="addItemName" type="text" size="46"/></td>
                </tr>
                <tr>
                    <td height="37" >物品描述：</td>
                    <td><textarea id="addItemDesc" cols="44" rows="3"></textarea></td>
                </tr>
                <tr>
                    <td height="37" >物品备注：</td>
                    <td><textarea id="addItemPic" cols="44" rows="4"></textarea></td>
                </tr>
                <tr>
                    <td height="37" >起拍价格：</td>
                    <td><input id="addItemPrice" type="text" size="46"/></td>
                </tr>
                <tr>
                    <td height="37" >有效时间：</td>
                    <td>
                        <select id="addItemAvail">
                            <option value="1" selected="selected">一天</option>
                            <option value="2">二天</option>
                            <option value="3">三天</option>
                            <option value="4">四天</option>
                            <option value="5">五天</option>
                            <option value="7">一个星期</option>
                            <option value="30">一个月</option>
                            <option value="365">一年</option>
                        </select></td>
                </tr>
                <tr>
                    <td height="37" >物品种类：</td>
                    <td><select id="addItemCatalog" style="width:150"></select></td>
                </tr>
                <tr>
                    <td height="37" colspan="2">
                        <input type="submit" value="添加" onclick="addItem();"/>
                        <input type="reset"  value="取消" onclick="cancelItem();"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- 查看自己赢取物品的表格 -->
<table id="viewSucc" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <br />
            <br />
            <table width="80%" border="0" align="center" cellspacing="1" bgcolor="#ccc">
                <tbody>
                <tr bgcolor="#eee" >
                    <td colspan="4" ><div class="mytitle">您赢取的所有物品</div></td>
                </tr>
                <tr>
                    <th>物品名</th>
                    <th>物品种类</th>
                    <th>赢取价格</th>
                    <th>物品描述</th>
                </tr>
                </tbody>
                <tbody id="viewSuccBody">
                </tbody>
            </table>
        </td>
    </tr>
</table>
<!-- 查看自己的竞价记录  -->
<table id="viewBid" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <br />
            <br />
            <table width="80%" border="0" align="center" cellspacing="1" bgcolor="#ccc">
                <tbody>
                <tr bgcolor="#eee" >
                    <td colspan="4" ><div class="mytitle">您参与的全部竞价</div></td>
                </tr>
                <tr>
                    <th>物品名</th>
                    <th>竞标价格</th>
                    <th>竞标时间</th>
                    <th>竞标人</th>
                </tr>
                </tbody>
                <tbody id="viewBidBody">
                </tbody>
            </table>
        </td>
    </tr>
</table>
<!-- 查看种类的表格 -->
<table id="viewCatalog" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <br />
            <br />
            <table width="80%" border="0" align="center" cellspacing="1" bgcolor="#ccc">
                <tbody>
                <tr bgcolor="#eee" >
                    <td colspan="4" ><div class="mytitle">当前的物品种类如下：</div></td>
                </tr>
                <tr>
                    <th width="20%">种类名</th>
                    <th width="80%">种类描述</th>
                </tr>
                </tbody>
                <tbody id="viewCatalogBody">
                </tbody>
            </table>
            <br />
            <a href="#" onclick="$('addKind').style.display = ''; return false;">添加种类</a>
            <br />
            <br />
            <!-- 添加种类表格 -->
            <table id="addKind" style="border:1px solid #666;display:none"
                   width="383" border="0" align="center" cellpadding="0">
                <tr>
                    <td height="37" colspan="2">添加新种类</td>
                </tr>
                <tr>
                    <td height="37"  width="20%">种&nbsp;类&nbsp;名：</td>
                    <td><input id="addKindName" type="text" size="46" /></td>
                </tr>
                <tr>
                    <td height="37" >种类描述：</td>
                    <td><textarea id="addKindDesc" cols="44" rows="4"></textarea></td>
                </tr>
                <tr>
                    <td height="37" colspan="2">
                        <input type="submit" value="添加" onclick="addCatalog();"/>
                        <input type="reset"  value="取消" onclick="cancelCatalog();"/>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- 查看处于拍卖中的物品 -->
<table id="viewInBid" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td width="21%"><br />
            <select id="selectBidCatalog" size="8"
                    onchange="loadItemByCatalog(this.value);"></select>
        </td>
        <td width="79%" valign="top">
            <br />
            <table width="96%" border="0" align="left" cellspacing="1" bgcolor="#ccc">
                <tbody>
                <tr bgcolor="#eee" >
                    <td colspan="5"><div class="mytitle">当前种类是：
                        <span id="bidCatalog"></span></div></td>
                </tr>
                <tr>
                    <th>物品名</th>
                    <th>起拍时间</th>
                    <th>结束时间</th>
                    <th>最高价格</th>
                    <th>所有者</th>
                </tr>
                </tbody>
                <tbody id="viewInBidBody">
                </tbody>
            </table>
        </td>
    </tr>
</table>
<!-- 查看物品详细信息 -->
<table id="viewDetail" style="display:none" width="780"
       align="center"  background="image/auction/bodybg.jpg">
    <tr>
        <td>
            <table width="60%" border="0" align="center" cellspacing="1"
                   cellpadding="4" bgcolor="#ccc">
                <tr bgcolor="#eee">
                    <td colspan="2"><div class="mytitle">您浏览的物品详细信息</div></td>
                </tr>
                <tr>
                    <th>物品名</th>
                    <td bgcolor="#fff"><span id="detailName"></span></td>
                </tr>
                <tr>
                    <th>物品描述</th>
                    <td bgcolor="#fff"><span id="detailDesc"></span></td>
                </tr>
                <tr>
                    <th>物品备注</th>
                    <td bgcolor="#fff"><span id="detailRemark"></span></td>
                </tr>
                <tr>
                    <th>物品种类</th>
                    <td bgcolor="#fff"><span id="detailKind"></span></td>
                </tr>
                <tr>
                    <th>物品所有者</th>
                    <td bgcolor="#fff"><span id="detailOwner"></span></td>
                </tr>
                <tr>
                    <th>物品起拍价</th>
                    <td bgcolor="#fff"><span id="detailInitPrice"></span></td>
                </tr>
                <tr>
                    <th>物品最高价</th>
                    <td bgcolor="#fff"><span id="detailMaxPrice"></span></td>
                </tr>
                <tr>
                    <th>物品起拍时间</th>
                    <td bgcolor="#fff"><span id="detailStartTime"></span></td>
                </tr>
                <tr>
                    <th>物品结束时间</th>
                    <td bgcolor="#fff"><span id="detailEndTime"></span></td>
                </tr>
                <tr bgcolor="#fff">
                    <td colspan="2">如果您有兴趣参与该物品竞价，请输入价格后提交。<br />
                        请注意，您的价格应大于物品的最高价</td>
                </tr>
                <tr bgcolor="#fff">
                    <td colspan="2">竞拍价：<input id="bidPrice" name="bidPrice" type="text"/>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" bgcolor="#fff">
                        <input type="button" value="竞价" onclick="submitBid()"/>
                        <input type="button" value="取消" onclick="cancelBid()"/></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<!-- 下面是页面脚部分 -->
<table width="780" border="0" align="center"
       cellpadding="0" background="image/auction/bodybg.jpg">
    <tr>
        <td width="283" height="86">
            <img src="image/auction/dwr.gif" alt="dwr" width="147" height="124"/></td>
        <td width="246">
            <img src="image/auction/spring.gif" alt="spring" width="209" height="87"/></td>
        <td width="243">
            <img src="image/auction/hibernate.png" alt="hiberate" width="204" height="59"/></td>
    </tr>
    <tr>
        <td height="68" colspan="3"><hr />
            All Rights Reserved.&copy;
            <a href="http://www.crazyit.org">http://www.crazyit.org</a><br />
            版权所有 Copyright&copy;2010 Yeeku.H.Lee <br />
            如有任何问题和建议，请登录
            <a href="http://www.crazyit.org">http://www.crazyit.org</a><br />
        </td>
    </tr>
    <tr height="5"><td colspan="3" background="image/auction/bottom.jpg"></td></tr>
</table>
</body>
</html>