package org.cbpmc.blog.domain;

import java.util.Date;

public class Comment
{
    // 标识属性
    private Integer id;
    // 发表评论的用法
    private String user;
    // 发表评论的用户的email
    private String email;
    // 发表评论的用户的url
    private String url;
    // 评论内容
    private String content;
    // 评论添加时间
    private Date addTime;
    // 评论所关联的Blog
    private Blog blog;

    // 无参数的构造器
    public Comment()
    {
    }
    // 初始化全部成员变量的构造器
    public Comment(Integer id , String user , String email,
                   String url , String content , Date addTime)
    {
        this.id = id;
        this.user = user;
        this.email = email;
        this.url = url;
        this.content = content;
        this.addTime = addTime;
    }

    // id的setter和getter方法
    public void setId(Integer id)
    {
        this.id = id;
    }
    public Integer getId()
    {
        return this.id;
    }

    // user的setter和getter方法
    public void setUser(String user)
    {
        this.user = user;
    }
    public String getUser()
    {
        return this.user;
    }

    // email的setter和getter方法
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getEmail()
    {
        return this.email;
    }

    // url的setter和getter方法
    public void setUrl(String url)
    {
        this.url = url;
    }
    public String getUrl()
    {
        return this.url;
    }

    // content的setter和getter方法
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getContent()
    {
        return this.content;
    }

    // addTime的setter和getter方法
    public void setAddTime(Date addTime)
    {
        this.addTime = addTime;
    }
    public Date getAddTime()
    {
        return this.addTime;
    }

    // blog的setter和getter方法
    public void setBlog(Blog blog)
    {
        this.blog = blog;
    }
    public Blog getBlog()
    {
        return this.blog;
    }
}