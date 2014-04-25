package org.cbpmc.auction.schedule;

import org.cbpmc.auction.exception.AuctionException;
import org.cbpmc.auction.service.AuctionService;

import java.util.TimerTask;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-25
 * Time: 下午1:28
 * Ver:
 */
public class CheckWiner extends TimerTask
{
    // 该任务所依赖业务逻辑组件
    private AuctionService mgr;
    // 依赖注入业务逻辑组件必须的setter方法
    public void setMgr(AuctionService mgr)
    {
        this.mgr = mgr;
    }
    // 该任务的执行体
    public void run()
    {
        try
        {
            mgr.updateWiner();
        }
        catch (AuctionException ae)
        {
            ae.printStackTrace();
        }
    }
}