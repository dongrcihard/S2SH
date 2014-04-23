package org.cbpmc.blog.vo;

import java.util.Date;

public class BlogBean
{
    //Blog的ID
    private int id;
    //Blog的标题
    private String title;
    //Blog文章的内容
    private String content;
    //Blog文章的添加时间
    private Date addTime;

    //无参数的构造器
    public BlogBean()
    {
    }
    //初始化全部属性的构造器
    public BlogBean(int id , String title , String content , Date addTime)
    {
        this.id = id;
        this.title = title;
        this.content = content;
        this.addTime = addTime;
    }

    //id属性的setter和getter方法
    public void setId(int id)
    {
        this.id = id;
    }
    public int getId()
    {
        return this.id;
    }

    //title属性的setter和getter方法
    public void setTitle(String title)
    {
        this.title = title;
    }
    public String getTitle()
    {
        return this.title;
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