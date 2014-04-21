package org.cbpmc.message.dao;

import org.cbpmc.common.dao.BaseDao;
import org.cbpmc.message.domain.User;

public interface UserDao extends BaseDao<User>
{
    /**
     * 根据用户名查找用户
     * @param name 需要查找用户的用户名
     * @return 查找到的用户
     */
    User findByName(String name);

    /**
     * 根据用户名、密码查找用户
     * @param name 需要查找用户的用户名
     * @param pass 需要查找用户的密码
     * @return 查找到的用户
     */
    User findByNameAndPass(String name ,String pass);
}
