package org.cbpmc.message.dao.impl;

import org.cbpmc.common.dao.impl.BaseDaoHibernate4;
import org.cbpmc.message.dao.MessageDao;
import org.cbpmc.message.domain.Message;

import java.util.List;

public class MessageDaoHibernate
        extends BaseDaoHibernate4<Message> implements MessageDao
{
    /**
     * 查询指定用户、指定页的消息
     * @param pageNo 需要查询的指定页
     * @return 查询到的消息集合
     */
    public List<Message> findAllByPage(int pageNo)
    {
        return findByPage("select m from Message m order by m.id desc"
                , pageNo , PAGE_SIZE);
    }
}
