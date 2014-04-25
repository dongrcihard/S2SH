package org.cbpmc.auction.dao;

import org.cbpmc.auction.domain.Item;
import org.cbpmc.common.dao.BaseDao;

import java.util.List;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-24
 * Time: 下午2:48
 * Ver:
 */
public interface ItemDao extends BaseDao<Item>
{
    /**
     * 根据产品分类，获取当前拍卖的全部商品
     * @param kindId 种类id;
     * @return 该类的全部产品
     */
    List<Item> findByKind(Integer kindId);

    /**
     * 根据所有者查找处于拍卖中的物品
     * @param useId 所有者Id;
     * @return 指定用户处于拍卖中的全部物品
     */
    List<Item> findByOwner(Integer userId);

    /**
     * 根据赢取者查找物品
     * @param userId 赢取者Id;
     * @return 指定用户赢取的全部物品
     */
    List<Item> findByWiner(Integer userId);

    /**
     * 根据物品状态查找物品
     * @param stateId 状态Id;
     * @return 该状态下的全部物品
     */
    List<Item> findByState(Integer stateId);
}