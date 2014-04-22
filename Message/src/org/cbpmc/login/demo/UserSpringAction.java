package org.cbpmc.login.demo;

/**
 * Created by dongxl on 14-4-22.
 */
public class UserSpringAction {
    private User user;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String execute() throws Exception {
        user.printUser();
        return "success";
    }
}
