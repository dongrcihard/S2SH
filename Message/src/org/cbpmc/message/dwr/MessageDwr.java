package org.cbpmc.message.dwr;

import org.cbpmc.message.domain.Message;
import org.cbpmc.message.domain.User;
import org.cbpmc.message.exception.MessageException;
import org.cbpmc.message.service.MessageService;
import org.cbpmc.message.vo.MessageBean;

import javax.servlet.http.HttpSession;
import java.util.List;

public class MessageDwr
{
    // 该前端处理类所依赖的业务逻辑组件
    private MessageService messageService;
    // 依赖注入messageService组件所必须的setter方法
    public void setMessageService(MessageService messageService)
    {
        this.messageService = messageService;
    }

    // 创建一条新消息
    public int createMessage(String title , String content,
                             HttpSession session)throws MessageException
    {
        Integer userId = (Integer)session.getAttribute("userId");
        Message m = new Message();
        m.setTitle(title);
        m.setContent(content);
        return messageService.createMessage(m , userId);
    }

    // 创建一个用户
    public int createUser(String user , String pass ,
                          HttpSession session)throws MessageException
    {
        User u = new User();
        u.setName(user);
        u.setPass(pass);
        int userId = messageService.createUser(u);
        session.setAttribute("userId" , userId);
        return userId;
    }

    // 处理用户
    public int loginPro(String userName , String pass
            , HttpSession session) throws MessageException
    {
        User user = new User();
        user.setName(userName);
        user.setPass(pass);
        int userId = messageService.validateLogin(user);
        if(userId > 0)
        {
            session.setAttribute("userId" , userId);
        }
        return userId;
    }

    // 判断当前页面的浏览者是否已登录
    public int isLogin(HttpSession session)
            throws MessageException
    {
        Integer userId = (Integer)session.getAttribute("userId");
        if (userId != null && userId > 0)
        {
            return (Integer)userId;
        }
        return -1;
    }

    // 根据消息ID返回消息
    public MessageBean getMessage(int msgId
            , HttpSession session)throws MessageException
    {
        return messageService.getMessage(msgId);
    }

    // 返回指定页所显示全部消息
    public List<MessageBean> getAllMessageByPage(int pageNo
            , HttpSession session)throws MessageException
    {
        return messageService.getAllMessageByPage(pageNo);
    }
}