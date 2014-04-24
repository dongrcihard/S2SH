package org.cbpmc.blog.domain;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

public class Blog
{
    // 标识属性
    private Integer id;
    // 标题
    private String title;
    // 内容
    private String content;
    // 添加时间
    private Date addTime;
    // 该Blog关联的全部评论
    private Set<Comment> comments
            = new HashSet<>();

    // 无参数的构造器
    public Blog()
    {
    }
    // 初始化全部成员变量的构造器
    public Blog(Integer id , String title
            , String content , Date addTime)
    {
        this.id = id;
        this.title = title;
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

    // addTime的setter和getter方法
    public void setAddTime(Date addTime)
    {
        this.addTime = addTime;
    }
    public Date getAddTime()
    {
        return this.addTime;
    }

    // comments的setter和getter方法
    public void setComments(Set<Comment> comments)
    {
        this.comments = comments;
    }
    public Set<Comment> getComments()
    {
        return this.comments;
    }
}
