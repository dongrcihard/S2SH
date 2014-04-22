package org.cbpmc.login.demo;

import com.opensymphony.xwork2.ActionSupport;

/**
 * Created by dongxl on 14-4-22.
 */
public class UserAction extends ActionSupport {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public String execute() throws Exception {
        user.printUser();
        return "SUCCESS";
    }
}
