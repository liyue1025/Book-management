package com.glut.service;

import com.glut.domain.User;

public interface IUserService {

    /**
     * 用户注册
     * @param user
     */
    public boolean register(User user);

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    public User login(String username, String password);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    public User alterUser(User user);

    /**
     * 修改用户密码
     * @param id
     * @param oldepassword
     * @param newpassword1
     * @return
     */
    Boolean alterPassword(Integer id, String oldepassword, String newpassword1);
}
