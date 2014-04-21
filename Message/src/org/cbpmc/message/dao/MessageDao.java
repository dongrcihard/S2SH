package org.cbpmc.message.dao;

import org.cbpmc.common.dao.BaseDao;
import org.cbpmc.message.domain.Message;

import java.util.List;

public interface MessageDao extends BaseDao<Message>
{
    // 设置每页显示的记录条数
    public static final int PAGE_SIZE = 4;
    /**
     * 查询指定页应该显示的消息（控制分页的查询方法）
     * @param pageNo 需要查询的页码
     * @return 查询到的消息集合
     */
    List<Message> findAllByPage(int pageNo);
}