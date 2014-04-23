package org.cbpmc.blog.service;

import org.cbpmc.blog.vo.BlogBean;
import org.cbpmc.blog.vo.CommentBean;

import java.util.List;

public interface BlogService
{
    /**
     * 创建一篇新的Blog
     * @param title Blog的标题
     * @param content Blog的内容
     * @return 新创建Blog的主键,如果创建失败，返回-1。
     */
    int createBlog(String title , String content);

    /**
     * 创建一个评论
     * @param user 发表评论的用户
     * @param email 发表评论用户的的Email
     * @param url 发表评论用户的的url
     * @param content 发表评论的内容
     * param blogId 发表评论所对应的Blog Id
     * @return 新发表评论的主键
     */
    int createComment(String user, String email, String url,
                      String content, int blogId);

    /**
     * 返回指定页的Blog列表
     * @param pageNo 指定页面
     * @param pageSize 每页显示的Blog数量
     * @return 指定页的Blog列表
     */
    List<BlogBean> getAllBlogByPage(int pageNo , int pageSize);

    /**
     * 返回Blog文章的总数
     * @return Blog文章的总数
     */
    long getBlogCount();

    /**
     * 返回指定Blog,指定页所对应的评论
     * @param blogId 指定Blog的ID
     * @param pageNo 指定页面
     * @param pageSize 每页显示的评论数量
     * @return 指定Blog，指定页码的所有评论
     */
    List<CommentBean> getCommentsByBlogAndPage(int blogId
            , int pageNo , int pageSize);

    /**
     * 返回指定Blog文章对应的评论总数
     * @param blogId 指定Blog的ID
     * @return 该Blog文章的评论的总数
     */
    long getCommentCountByBlog(int blogId);

    /**
     * 返回指定Blog文章
     * @param blogId 需要查询的Blog文章的id
     * @return blogId对应的Blog文章
     */
    BlogBean getBlog(int blogId);
}