package org.cbpmc.blog.dao.impl;

import org.cbpmc.blog.dao.BlogDao;
import org.cbpmc.blog.domain.Blog;
import org.cbpmc.common.dao.impl.BaseDaoHibernate4;

import java.util.List;

public class BlogDaoHibernate
        extends BaseDaoHibernate4<Blog> implements BlogDao
{
    /**
     * 查询指定页的Blog
     * @param pageNo 需要查询的页码
     * @return 查询到的Blog集合
     */
    public List findAllByPage(int pageNo , int pageSize)
    {
        //返回分页查询的结果
        return findByPage("select b from Blog b order by b.id desc"
                , pageNo , pageSize);
    }
}