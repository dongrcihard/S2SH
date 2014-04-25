package org.cbpmc.auction.dao;

import org.cbpmc.auction.domain.AuctionUser;
import org.cbpmc.common.dao.BaseDao;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-24
 * Time: 下午2:32
 * Ver:
 */
public interface AuctionUserDao extends BaseDao<AuctionUser>
{
    /**
     * 根据用户名，密码查找用户
     * @param username 查询所需的用户名
     * @param pass 查询所需的密码
     * @return 指定用户名、密码对应的用户
     */
    AuctionUser findByNameAndPass(String username , String pass);
    /**
     * 根据物品id、出价查询用户
     * @param itemId 物品id;
     * @param price 出价的价格
     * @return 指定物品、指定竞价对应的用户
     */
    AuctionUser findByItemAndPrice(Integer itemId , Double price);
}