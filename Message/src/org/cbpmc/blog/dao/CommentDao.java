package org.cbpmc.blog.dao;

import org.cbpmc.blog.domain.Comment;
import org.cbpmc.common.dao.BaseDao;

import java.util.List;

public interface CommentDao extends BaseDao<Comment>
{
    /**
     * 根据Blog、和页码来查找评论
     * @param b 评论所对应Blog文章的ID
     * @param pageNo 查找指定页的Blog
     * @param pageSize 每页显示的评论数量
     * @return 查找到的评论集合
     */
    List<Comment> findByBlogAndPage(int blogId , int pageNo , int pageSize);

    /**
     * 根据Blog文件来获取它关联的评论总数
     * @param blogId 指定Blog文章的ID
     * @return 指定Blog文章所关联的评论的总数
     */
    long findCountByBlog(int blogId);
}