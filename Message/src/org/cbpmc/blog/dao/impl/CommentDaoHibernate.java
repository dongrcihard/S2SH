package org.cbpmc.blog.dao.impl;

import org.cbpmc.blog.dao.CommentDao;
import org.cbpmc.blog.domain.Comment;
import org.cbpmc.common.dao.impl.BaseDaoHibernate4;

import java.util.List;

public class CommentDaoHibernate
        extends BaseDaoHibernate4<Comment> implements CommentDao
{
    /**
     * 根据Blog、和页码来查找评论
     * @param b 评论所对应Blog文章的ID
     * @param pageNo 查找指定页的Blog
     * @return 查找到的评论集合
     */
    public List<Comment> findByBlogAndPage(int blogId , int pageNo , int pageSize)
    {
        return findByPage("select c from Comment c where c.blog.id = ?0"
                + " order by c.id desc"
                , pageNo , pageSize , blogId);
    }

    /**
     * 根据Blog文件来获取它关联的评论总数
     * @param blogId 指定Blog文章的ID
     * @return 指定Blog文章所关联的评论的总数
     */
    public long findCountByBlog(int blogId)
    {
        List result = find("select count(*) from Comment c "
                + "where c.blog.id = ?0" , blogId);
        // 查询得到的实体总数
        if (result != null && result.size() == 1 )
        {
            return (Long)result.get(0);
        }
        return 0;
    }
}