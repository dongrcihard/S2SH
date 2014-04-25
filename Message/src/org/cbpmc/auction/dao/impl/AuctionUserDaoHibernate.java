package org.cbpmc.auction.dao.impl;

import org.cbpmc.auction.dao.AuctionUserDao;
import org.cbpmc.auction.domain.AuctionUser;
import org.cbpmc.common.dao.impl.BaseDaoHibernate4;

import java.util.List;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-24
 * Time: 下午2:37
 * Ver:
 */
public class AuctionUserDaoHibernate
        extends BaseDaoHibernate4<AuctionUser> implements AuctionUserDao
{

    /**
     * 根据用户名，密码查找用户
     * @param username 查询所需的用户名
     * @param pass 查询所需的密码
     * @return 指定用户名、密码对应的用户
     */
    public AuctionUser findByNameAndPass(String username , String pass)
    {
        // 执行HQL查询
        List<AuctionUser> ul = (List<AuctionUser>)find(
                "from AuctionUser au where au.username=?0 and au.userpass=?1" ,
                username , pass);
        // 返回查询得到的第一个AuctionUser对象
        if (ul != null && ul.size() == 1)
        {
            return (AuctionUser)ul.get(0);
        }
        return null;
    }
    /**
     * 根据物品id、出价查询用户
     * @param itemId 物品id;
     * @param price 竞价的价格
     * @return 指定物品、指定竞价对应的用户
     */
    public AuctionUser findByItemAndPrice(Integer itemId , Double price)
    {
        // 执行HQL查询
        List<AuctionUser> userList = (List<AuctionUser>)find(
                "select user from AuctionUser user inner join user.bids bid"
                        + " where bid.bidItem.id=?0 and bid.bidPrice=?1"
                , itemId , price);
        // 返回查询得到的第一个Bid对象关联的AuctionUser对象
        if (userList != null && userList.size() == 1)
        {
            return userList.get(0);
        }
        return null;
    }
}