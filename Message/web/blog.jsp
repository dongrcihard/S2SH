<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<html>
<head>
	<meta name="author" content="Yeeku.H.Lee(CrazyIt.org)" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title> 简易Blog系统 </title>
	<!-- 导入Ext JS必需的CSS样式单 -->
	<link href="ExtJS/resources/css/ext-all.css" rel="stylesheet" type="text/css"/>
	<style type="text/css">
		/* 文章标题 */
		.blogTitle {
			font-weight: bold;
			font-size: 12pt;
			text-align: center;
			background-color: #ddf;
			color: #000000;
		}
	</style>
	<!-- 导入Ext JS必需的JavaScript库 -->
	<script type="text/javascript" src="ExtJS/ext-all.js">
	</script>
	<!-- 导入Ext JS国际化所需的JavaScript库 -->
	<script type="text/javascript" src="ExtJS/ext-lang-zh_CN.js">
	</script>
</head>
<body>
<script type="text/javascript">
Ext.onReady(function(){
// 定义显示指定Blog文章的处理函数
    function showTargetBlog(blogId , tabPanel)
    {
        // 发送异步请求
        Ext.Ajax.request({
            url: 'getBlog', // 向该URL发送请求
            params: {
                blogId: blogId
            },
            success: function(response)
            {
                // 获取服务器响应的Blog
                var blog = Ext.decode(response.responseText).blog;
                // 添加Tab页
                tab = tabPanel.add({
                    id: blogId,
                    title: blog.title,
                    bodyPadding: 20,
                    html: '<div>发表于：' + Ext.Date.format(
                            Ext.Date.parse(blog.addTime
                                    , 'Y-m-d H:i:s.u') , 'Y年m月d日 H时i分s秒')
                            + '</div><hr />'
                            + '<div class="blogTitle">' + blog.title
                            + '</div><div>' + blog.content + '</div><br/>'
                            + '<a href="#" onclick="viewComment(\''
                            + blogId + '\');">查看</a>|'
                            + '<a href="#" onclick="showAdd(\''
                            + blogId + '\');">发表回复</a>'
                            + '<div id="viewCommentEl' + blogId
                            + '"></div>',
                    closable:true // 允许关闭
                });
                // 将新创建的Tab页设置成激活页
                tabPanel.setActiveTab(tab);
            }
        });
    }
    // 创建一个Ext.data.Store对象
    var blogStore = Ext.create('Ext.data.Store',
            {
                pageSize: 4, // 设置每页显示4条记录
                // 使用proxy指定加载远程数据
                proxy:
                {
                    type: 'ajax',
                    url: 'getAllBlogsByPage',// 向该URL发送Ajax请求
                    reader: { // 使用Ext.data.reader.Json读取服务器数据
                        type: 'json',
                        totalProperty: 'total',
                        root: 'data' // 直接读取服务器响应的data数据
                    }
                },
                // 定义数据包含的Field
                fields: [
                    {name: 'id' , type: 'int'},
                    {name: 'title', type: 'string'}
                ],
                autoLoad:true
            });
    // 创建Viewport组件，作为整个页面的容器
    Ext.create('Ext.container.Viewport',
            {
                layout: 'border',
                items: [
                    // 上面区域的内容
                    {
                        region: 'north',
                        margins: '0 0 5 0',
                        layout:'absolute',// 使用列布局
                        border: 0,
                        bodyPadding : 5,
                        items: [
                            {
                                x: 0,
                                y: 0,
                                border:0,
                                html: '<a href="http://www.crazyit.org">'
                                        + '<img alt="疯狂java" src="'
                                        + 'http://www.crazyit.org/logo.jpg"></a>'
                            },
                            {
                                x: 160,
                                y: 0,
                                height: 80,
                                anchor: '0 100%',
                                border:0,
                                bodyPadding: '60 0 0 0',
                                bodyStyle: {
                                    textAlign: 'right',
                                    background: 'url(image/blog/banner.png) no-repeat'
                                },
                                html:'<a href="#" onclick="showAddBlog();">'
                                        + '发表新文章</a>'
                            }
                        ]
                    },
                    // 左边区域的内容
                    {
                        region: 'west',
                        xtype: 'gridpanel',
                        width: 280, // 指定表单宽度
                        // 定义该表格包含的所有数据列
                        columns: [
                            {text: 'Blog列表', dataIndex: 'title', width: '100%'}
                        ],
                        listeners: {
                            // 当用户单击列表项时激发该函数
                            itemclick: function(view, record, item, index, evt)  //①
                            {
                                // 获取页面中间区域的TabPanel组件
                                var tabPanel = Ext.getCmp('my_center');
                                var targetTab = Ext.getCmp(record.data.id);
                                // 如果希望打开的Tab页已经存在
                                if(targetTab)
                                {
                                    tabPanel.setActiveTab(targetTab);
                                }
                                else
                                {
                                    // 调用showTargetBlog方法打开新Tab页显示指定文章
                                    showTargetBlog(record.data.id , tabPanel);
                                }
                            }
                        },
                        store: blogStore,
                        // 定义分页工具条
                        bbar:{
                            xtype: 'pagingtoolbar',
                            // 指定该分页工具条控制blogStore的数据加载
                            store: blogStore,
                            displayInfo: false
                        }
                    },
                    // 中间面板的内容：使用一个Ext.tab.Panel
                    {
                        region: 'center',
                        id:'my_center',
                        xtype: 'tabpanel',
                        activeTab: 0,
                        items: {
                            title: '首页',
                            bodyPadding: 10,
                            html: '简易Blog系统。本系统基于Ext JS 4.1+Spring 3.1'
                                    + '+Hibernate 4.1开发<br/>'
                                    + '本系统功能并不复杂，但程序架构具有较好的参考价值。'
                        }
                    },
                    // 下方面板的内容：使用一个Ext.panel.Panel
                    {
                        region: 'south',
                        border: 0,
                        height: 60,
                        html:'<div><b>疯狂Java简易Blog系统</b></div>'
                                + '<div>Powered By Ext JS 4.1<img src="image/blog/sencha.png"/></div>'
                    }]
            });
});
// 显示添加新文章的窗口
var showAddBlog = function()
{
    // 定义添加新Blog文章的处理函数
    var addBlogHandler = function()
    {
        // 获取表单，实际返回的是Ext.form.Basic对象
        var form = this.up('form').getForm();
        // 如果表单输入校验通过
        if (form.isValid())
        {
            // 以Ajax方式提交表单
            form.submit(
                    {
                        url: 'addBlog', // 向该URL提交请求
                        // 提交成功，第一个参数是Ext.form.Basic对象
                        // 第二个参数是Ext.action.Action对象
                        success: function(form, action)
                        {
                            Ext.Msg.alert('添加结果', action.result.msg);
                            // 关闭该窗口
                            addBlogWin.close();
                            document.location = "login.jsp";
                        }
                    });
        }
    }
    // 创建窗口
    var addBlogWin = Ext.create('Ext.window.Window', {
        title:'发表新文章',
        height: 400,
        width: 560,
        layout: 'fit',
        items: [{
            xtype: 'form',
            bodyPadding: 5,
            method: 'POST', // 指定以POST方式提交请求
            // 默认使用anchor布局方式
            layout: 'anchor',
            // 设置表单控件默认占满整个容器
            defaults: {
                anchor: '100%'
            },
            // 设置表单组件的默认类型
            defaultType: 'textfield',
            // 为所有表单控件设置默认属性
            fieldDefaults: {
                labelAlign: 'top'
            },
            items: [
                {
                    fieldLabel: '文章标题', // 表单控件的Label
                    name: 'title', // 表单控件的名称
                    allowBlank: false, // 输入校验：不允许为空
                    minLength: 1 // 最少必须输入10个字符
                },
                {
                    xtype: 'htmleditor', // 指定使用富文本编辑器
                    fieldLabel: '文章内容', // 表单控件的Label
                    name: 'content', // 表单控件的名称
                    height: 270,
                    allowBlank: false, // 输入校验：不允许为空
                    minLength: 4 // 最少必须输入10个字符
                }
            ],
            // 为表单设置按钮
            buttons: [
                {xtype:'tbfill'},
                {
                    // 重设按钮
                    text: '重设',
                    // 单击该按钮的事件处理函数
                    handler: function()
                    {
                        // 获取表单，实际返回的是Ext.form.Basic对象
                        var form = this.up('form').getForm();
                        // 重设该表单
                        this.up('form').getForm().reset();
                    }
                },
                {
                    // 提交按钮
                    text: '提交',
                    disabled: true, // 设置该按钮默认不可用
                    // 只有当整个表单输入校验通过时该按钮才可用
                    formBind: true,
                    // 单击该按钮的事件处理函数
                    handler: addBlogHandler
                },
                {xtype:'tbfill'}
            ]
        }]
    }).show();
}

// 显示添加新评论的窗口
var showAdd = function(blogId)
{
    // 定义添加新评论的处理函数
    var addCommentHandler = function()
    {
        // 获取表单，实际返回的是Ext.form.Basic对象
        var form = this.up('form').getForm();
        // 如果表单输入校验通过
        if (form.isValid())
        {
            // 以Ajax方式提交表单
            form.submit(
                    {
                        url: 'addComment', // 向该URL提交请求
                        params: { // 添加额外的请求参数
                            blogId: blogId
                        },
                        // 提交成功，第一个参数是Ext.form.Basic对象
                        // 第二个参数是Ext.action.Action对象
                        success: function(form, action)
                        {
                            Ext.Msg.alert('评论结果', action.result.msg);
                            // 关闭该窗口
                            addCommentWin.close();
                        }
                    });
        }
    };
    // 创建表单窗口
    var addCommentWin = Ext.create('Ext.window.Window', {
        title:'添加评论',
        height: 320,
        width: 500,
        layout: 'fit',
        items: [{
            xtype: 'form',
            bodyPadding: 5,
            method: 'POST', // 指定以POST方式提交请求
            // 默认使用anchor布局方式
            layout: 'anchor',
            // 设置表单控件默认占满整个容器
            defaults: {
                anchor: '100%'
            },
            // 设置表单组件的默认类型
            defaultType: 'textfield',
            // 为所有表单控件设置默认属性
            fieldDefaults: {
                labelAlign: 'top'
            },
            items: [
                {
                    fieldLabel: '用户名', // 表单控件的Label
                    name: 'username', // 表单控件的名称
                    allowBlank: false // 输入校验：不允许为空
                },
                {
                    fieldLabel: '电子邮件(可选)', // 表单控件的Label
                    name: 'email' // 表单控件的名称
                },
                {
                    fieldLabel: '日志URL(可选)', // 表单控件的Label
                    name: 'url' // 表单控件的名称
                },
                {
                    fieldLabel: '评论内容', // 表单控件的Label
                    xtype: 'textarea',
                    name: 'content', // 表单控件的名称
                    allowBlank: false, // 输入校验：不允许为空
                    minLength: 30 // 最少必须输入30个字符
                }
            ],
            // 为表单设置按钮
            buttons: [
                {xtype:'tbfill'},
                {
                    // 重设按钮
                    text: '重设',
                    // 单击该按钮的事件处理函数
                    handler: function()
                    {
                        // 获取表单，实际返回的是Ext.form.Basic对象
                        var form = this.up('form').getForm();
                        // 重设该表单
                        this.up('form').getForm().reset();
                    }
                },
                {
                    // 提交按钮
                    text: '提交',
                    disabled: true, // 设置该按钮默认不可用
                    // 只有当整个表单输入校验通过时该按钮才可用
                    formBind: true,
                    // 单击该按钮的事件处理函数
                    handler: addCommentHandler
                },
                {xtype:'tbfill'}
            ]
        }]
    }).show();
}
var viewComment = function(blogId)
{
    // 清空viewCommentEl元素的内容
    Ext.DomHelper.overwrite('viewCommentEl' + blogId , '');
    // 创建一个Ext.data.Store对象
    var commentStore = Ext.create('Ext.data.Store',
            {
                pageSize: 3, // 设置每页显示3条记录
                // 使用proxy指定加载远程数据
                proxy:
                {
                    type: 'ajax',
                    url: 'getAllCommentsByBlog',// 向该URL发送Ajax请求
                    extraParams: { // 发送额外的请求参数
                        blogId: blogId
                    },
                    reader: { // 使用Ext.data.reader.Json读取服务器数据
                        type: 'json',
                        totalProperty: 'total',
                        root: 'data' // 直接读取服务器响应的data数据
                    }
                },
                // 定义数据包含的Field
                fields: [
                    {name: 'user' , type: 'string'},
                    {name: 'email', type: 'string'},
                    {name: 'url', type: 'string'},
                    {name: 'content', type: 'string'},
                    {name: 'addTime', type: 'date' ,
                        dateFormat: 'Y-m-d H:i:s.u'}
                ],
                autoLoad:true
            });
    Ext.create('Ext.grid.Panel' , {
        renderTo: 'viewCommentEl' + blogId,
        height: 300,
        // 定义该表格包含的所有数据列
        columns: [
            { text: '评论人', dataIndex: 'user', flex: 1},
            { text: 'Email', dataIndex: 'email', flex: 1},
            { text: '日志URL', dataIndex: 'url', flex: 1}
        ],
        store: commentStore,
        features:[
            // 通过features选项启用rowbody特性
            {
                ftype: 'rowbody',
                getAdditionalData: function(data, rowIndex, record, orig)
                {
                    var headerCt = this.view.headerCt,
                            colspan = headerCt.getColumnCount();
                    return {
                        rowBodyStyle: {
                            padding: '20px'
                        },
                        rowBody: '<div style="font-size:14px;padding:10px">'
                                + '<h3>评论内容:</h3><div>'
                                + record.get('content')+ '</div>'
                                + '<div style="text-align:right">于'
                                + Ext.Date.format(record.get('addTime')
                                        , 'Y年m月d日 H时i分s秒')
                                + '评论。</div></div>',
                        rowBodyColspan: colspan
                    };
                }
            }
        ],
        // 定义分页工具条
        bbar:{
            xtype: 'pagingtoolbar',
            // 指定该分页工具条控制commentStore的数据加载
            store: commentStore,
            displayInfo: false
        }
    });
}
</script>
</body>
</html>
