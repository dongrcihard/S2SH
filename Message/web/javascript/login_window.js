Ext.onReady(function () {

    Ext.form.Field.prototype.msgTarget = "side";
    /*创建窗口*/
    var form1 = Ext.create('Ext.form.Panel', {
        title: '用户登录窗口',
        width: 263,
        height: 140,
        frame: true,
//        labelWidth: 60,
        minButtonWidth: 80,
        buttonAlign: "left",
        renderTo: Ext.get("loginWin"),
//        defaults: {width: 180},
        items: [
            {
                xtype: 'textfield',
                fieldLabel: "用户名",
                id: "txtName",
                name: 'user.name',
                allowBlank: false,
                blankText: "用户名不能为空!"
            },
            {
                xtype: 'textfield',
                fieldLabel: "密码",
                allowBlank: false,
                blankText: "密码不能为空!",
                name: 'user.pass',
                inputType: 'password'
            }
        ],
        buttons: [
            {
                text: '<div style="color: red">登  录</div>',
                type: 'submit',
                margin: '0 0 0 20px',
                handler: function () {
                    if (form1.getForm().isValid()) {
                        Ext.MessageBox.show({
                            title: '请等待',
                            msg: '正在加载',
                            progressText: '',
                            width: 150,
                            progress: true,
                            closable: 'false',
                            animEl: 'loading'
                        });
                        var f = function (v) {
                            return function () {
                                var i = v / 11;
                                Ext.MessageBox.updateProgress(i, '');
                            }
                        };
                        for (var i = 1; i < 33; i++) {
                            setTimeout(f(i), i * 1500);
                        }
                        //提交到服务器操作
                        form1.form.doAction('submit', {
                            url: 'user.action',
                            method: 'post',
                            success: function (form, action) {
                                document.location = "index.jsp";
                                Ext.MessageBox.show({
                                    title: "登录成功！",
                                    msg: action.result.message,
                                    icon: Ext.MessageBox.INFO
                                });
                            },
                            failure: function (form, action) {
                                Ext.MessageBox.show({
                                    title: "登录失败！",
                                    msg: action.result.message,
                                    buttons: Ext.MessageBox.OK,
                                    icon: Ext.MessageBox.ERROR
                                });
                            }
                        });
                    }
                }},
            {
                text: '<div style="color: #04408c">重  置</div>',
                margin: '0 0 0 35px',
                handler: function () {
                    form1.getForm().reset();
                }
            }
        ]
    });
});