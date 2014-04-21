package org.cbpmc.message.domain;

import java.util.HashSet;
import java.util.Set;

public class User
{
    // 标识属性
    private Integer id;
    // 用户的用户名
    private String name;
    // 用户的密码
    private String pass;
    // 该用户所发布的全部消息
    private Set<Message> messages
            = new HashSet<>();

    // 无参数的构造器
    public User()
    {
    }
    // 初始化全部成员变量的构造器
    public User(Integer id , String name , String pass)
    {
        this.id = id;
        this.name = name;
        this.pass = pass;
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

    // name的setter和getter方法
    public void setName(String name)
    {
        this.name = name;
    }
    public String getName()
    {
        return this.name;
    }

    // pass的setter和getter方法
    public void setPass(String pass)
    {
        this.pass = pass;
    }
    public String getPass()
    {
        return this.pass;
    }

    // messages的setter和getter方法
    public void setMessages(Set<Message> messages)
    {
        this.messages = messages;
    }
    public Set<Message> getMessages()
    {
        return this.messages;
    }

}