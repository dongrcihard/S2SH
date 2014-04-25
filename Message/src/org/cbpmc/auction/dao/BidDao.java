package org.cbpmc.auction.dao;

import org.cbpmc.auction.domain.Bid;
import org.cbpmc.common.dao.BaseDao;

import java.util.List;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-24
 * Time: 下午3:04
 * Ver:
 */
public interface BidDao extends BaseDao<Bid>
{
    /**
     * 根据用户查找竞价
     * @param id 用户id
     * @return 用户对应的全部
     * @return 用户对应的全部竞价
     */
    List<Bid> findByUser(Integer userId);
}
