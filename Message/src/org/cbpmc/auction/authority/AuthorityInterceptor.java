package org.cbpmc.auction.authority;

import org.aspectj.lang.JoinPoint;
import org.cbpmc.auction.exception.AuctionException;

import javax.servlet.http.HttpSession;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-25
 * Time: 下午2:28
 * Ver:
 */
public class AuthorityInterceptor
{
    // 进行权限检查的方法
    public void authority(JoinPoint jp)
            throws Throwable
    {
        HttpSession sess = null;
        // 获取被拦截方法的全部参数
        Object[] args = jp.getArgs();
        // 遍历被拦截方法的全部参数
        for (int i = 0 ; i < args.length ; i++ )
        {
            // 找到HttpSession类型的参数
            if (args[i] instanceof HttpSession) sess =
                    (HttpSession)args[i];
        }
        // 取出HttpSession里的userId属性
        Integer userId = (Integer)sess.getAttribute("userId");
        // 如果HttpSession里的userId属性为null，或小于等于0
        if(userId == null || userId <= 0)
        {
            // 如果还未登录，抛出异常
            throw new AuctionException("您还没有登录，请先登录系统再执行该操作");
        }
    }
}