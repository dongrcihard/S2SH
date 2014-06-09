package org.cbpmc.login.test;//package test;

import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ActionContext;
import org.cbpmc.message.domain.User;
import org.cbpmc.message.service.MessageService;

import java.util.Map;


public class UserAction extends ActionSupport {

    private boolean success;
    private String message;
    private User user;
    private MessageService myService;

    public void setMyService(MessageService myService) {
        this.myService = myService;
    }

    public String execute() throws Exception {
        this.success = true;
        try {
            /*查找用户*/
            int find = myService.validateUserLogin(user);
            switch (find) {
                case 1:
                    this.success = false;
                    this.message = "对不起，用户名错误";
                    break;
                case 2:
                    this.success = false;
                    this.message = "对不起，密码错误";
                    break;
                default:
                    this.success = true;
                    this.message = "恭喜您，登录成功";
                    /*set ths session*/
                    ActionContext actionContext = ActionContext.getContext();
                    Map session = actionContext.getSession();
                    session.put("userId", user.getName());
                    return SUCCESS;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return SUCCESS;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}