package org.cbpmc.message.vo;

public class MessageBean
{
    // 保存消息id
    private int id;
    // 消息标题
    private String title;
    // 消息内容
    private String content;
    // 消息发布者id
    private int owerId;
    // 消息发布者的名字
    private String owerName;


    // 无参数的构造器
    public MessageBean()
    {
    }
    // 初始化全部属性的构造器
    public MessageBean(int id , String title ,
                       String content , int owerId , String owerName)
    {
        this.id = id;
        this.title = title;
        this.content = content;
        this.owerId = owerId;
        this.owerName = owerName;
    }

    // id属性的setter和getter方法
    public void setId(int id)
    {
        this.id = id;
    }
    public int getId()
    {
        return this.id;
    }

    // title属性的setter和getter方法
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getTitle()
    {
        return this.title;
    }

    // content属性的setter和getter方法
    public void setContent(String content)
    {
        this.content = content;
    }
    public String getContent()
    {
        return this.content;
    }

    // owerId属性的setter和getter方法
    public void setOwerId(int owerId)
    {
        this.owerId = owerId;
    }
    public int getOwerId()
    {
        return this.owerId;
    }

    // owerName属性的setter和getter方法
    public void setOwerName(String owerName)
    {
        this.owerName = owerName;
    }
    public String getOwerName()
    {
        return this.owerName;
    }
}