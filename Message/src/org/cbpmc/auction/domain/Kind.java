package org.cbpmc.auction.domain;

import javax.persistence.*;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name="kind")
public class Kind
{
    // 标识属性
    @Id
    @Column(name="kind_id")
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer id;
    // 种类名
    @Column(name="kind_name")
    private String kindName;
    // 种类描述
    @Column(name="kind_desc")
    private String kindDesc;
    // 该种类下的所有物品
    @OneToMany(targetEntity=Item.class ,
            mappedBy="kind")
    private Set<Item> items = new HashSet<Item>();

    // 无参数的构造器
    public Kind()
    {
    }
    // 初始化全部基本属性的构造器
    public Kind(Integer id , String kindName , String kindDesc)
    {
        this.id = id;
        this.kindName = kindName;
        this.kindDesc = kindDesc;
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

    // kindName的setter和getter方法
    public void setKindName(String kindName)
    {
        this.kindName = kindName;
    }
    public String getKindName()
    {
        return this.kindName;
    }

    // kindDesc的setter和getter方法
    public void setKindDesc(String kindDesc)
    {
        this.kindDesc = kindDesc;
    }
    public String getKindDesc()
    {
        return this.kindDesc;
    }

    // items的setter和getter方法
    public void setItems(Set<Item> items)
    {
        this.items = items;
    }
    public Set<Item> getItems()
    {
        return this.items;
    }
}