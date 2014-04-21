package org.cbpmc.message.domain;

public class Message
{
    // 标识属性
    private Integer id;
    // 消息标题
    private String title;
    // 消息内容
    private String content;
    // 该消息的发布者
    private User user;

    // 无参数的构造器
    public Message()
    {
    }
    // 初始化全部成员变量的构造器
    public Message(Integer id , String title , String content)
    {
        this.id = id;
        this.title = title;
        this.content = content;
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

    // title的setter和getter方法
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getTitle()
    {
        return this.title;
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

    // user的setter和getter方法
    public void setUser(User user)
    {
        this.user = user;
    }
    public User getUser()
    {
        return this.user;
    }
}