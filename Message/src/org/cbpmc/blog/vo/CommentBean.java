package org.cbpmc.blog.vo;

import java.util.Date;

public class CommentBean
{
    //评论者的名字
    private String user;
    //评论人的电子邮件
    private String email;
    //评论人的url
    private String url;
    //评论的内容
    private String content;
    //评论的添加时间
    private Date addTime;

    //无参数的构造器
    public CommentBean()
    {
    }
    //初始化全部属性的构造器
    public CommentBean(String user , String email , String url ,
                       String content , Date addTime)
    {
        this.user = user;
        this.email = email;
        this.url = url;
        this.content = content;
        this.addTime = addTime;
    }

    //user属性的setter和getter方法
    public void setUser(String user)
    {
        this.user = user;
    }
    public String getUser()
    {
        return this.user;
    }

    //email属性的setter和getter方法
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getEmail()
    {
        return this.email;
    }

    //url属性的setter和getter方法
    public void setUrl(String url)
    {
        this.url = url;
    }
    public String getUrl()
    {
        return this.url;
    }

    //content属性的setter和getter方法
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getContent()
    {
        return this.content;
    }

    //addTime属性的setter和getter方法
    public void setAddTime(Date addTime)
    {
        this.addTime = addTime;
    }
    public Date getAddTime()
    {
        return this.addTime;
    }

}