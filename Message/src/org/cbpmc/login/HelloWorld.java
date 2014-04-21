package org.cbpmc.login;
public class HelloWorld {
    private String message;			//message属性
    //message属性的getter和setter方法
    public String getMessage() {
        return message;
    }
    public void setMessage(String message) {
        this.message = message;
    }
    //execute()方法
    public String execute() {
        return "SUCCESS";			//返回处理结果字符串
    }
}
