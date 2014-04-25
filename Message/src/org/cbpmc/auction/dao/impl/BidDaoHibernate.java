package org.cbpmc.auction.dao.impl;

import org.cbpmc.auction.dao.BidDao;
import org.cbpmc.auction.domain.Bid;
import org.cbpmc.common.dao.impl.BaseDaoHibernate4;

import java.util.List;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-24
 * Time: 下午3:06
 * Ver:
 */
public class BidDaoHibernate
        extends BaseDaoHibernate4<Bid> implements BidDao
{
    /**
     * 根据用户查找竞价
     * @param id 用户id
     * @return 用户对应的全部
     * @return 用户对应的全部竞价
     */
    public List<Bid> findByUser(Integer userId)
    {
        return (List<Bid>)find(
                "select bid from Bid bid where bid.bidUser.id=?0" , userId);
    }
}
