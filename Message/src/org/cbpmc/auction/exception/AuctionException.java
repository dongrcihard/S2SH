package org.cbpmc.auction.exception;

/**
 * Description:
 * Author: Richard Dong
 * Date: 14-4-25
 * Time: 上午9:12
 * Ver:
 */
public class AuctionException extends Exception
{
    // 定义一个无参数的构造器
    public AuctionException()
    {
    }
    // 定义一个带message参数的构造参数
    public AuctionException(String message)
    {
        super(message);
    }
}

