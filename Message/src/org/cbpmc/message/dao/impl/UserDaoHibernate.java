package org.cbpmc.message.dao.impl;

import org.cbpmc.common.dao.impl.BaseDaoHibernate4;
import org.cbpmc.message.dao.UserDao;
import org.cbpmc.message.domain.User;

import java.util.List;

public class UserDaoHibernate
        extends BaseDaoHibernate4<User> implements UserDao
{
    /**
     * 根据用户名查找用户
     * @param name 需要查找的用户的用户名
     * @return 查找到的用户
     */
    public User findByName(String name)
    {
        List ul = find("select u from User u where u.name = ?0"
                , name);
        if (ul != null && ul.size() > 0)
        {
            return (User)ul.get(0);
        }
        return null;
    }

    /**
     * 根据用户名、密码查找用户
     * @param name 需要查找用户的用户名
     * @param pass 需要查找用户的密码
     * @return 查找到的用户
     */
    public User findByNameAndPass(String name , String pass)
    {
        List ul = find("select u from User u where"
                + " u.name = ?0 and u.pass=?1" , name , pass);
        if (ul != null && ul.size() > 0)
        {
            return (User)ul.get(0);
        }
        return null;
    }
}