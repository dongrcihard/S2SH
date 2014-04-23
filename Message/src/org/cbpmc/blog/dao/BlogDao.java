package org.cbpmc.blog.dao;


import org.cbpmc.blog.domain.Blog;
import org.cbpmc.common.dao.BaseDao;

import java.util.List;

public interface BlogDao extends BaseDao<Blog>
{
    /**
     * 查询指定页的Blog
     * @param pageNo 需要查询的页码
     * @param pageSize 每页显示的Blog数
     * @return 查询到的Blog集合
     */
    List findAllByPage(int pageNo , int pageSize);
}