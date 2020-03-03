package com.glut.service.impl;

import com.glut.dao.IUserDao;
import com.glut.domain.User;
import com.glut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户业务层接口
 */
@Service("userService")
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    /**
     * 注册
     * @param user
     */
    @Override
    public boolean register(User user) {
        // 查找是否有相同的用户名
        User user1 = userDao.findUserByUsername(user.getUsername());
        if (user1 != null){
            return false;
        }else{
            // 注册新用户
            userDao.saveUser(user);
            return true;
        }
    }

    /**
     * 用户登录
     * @param username
     * @param password
     * @return
     */
    @Override
    public User login(String username, String password) {
        return userDao.findUserByUsernameAndPassword(username,password);
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Override
    public User alterUser(User user) {
        // 更新用户信息
        userDao.alterUser(user);
        // 返回根据id查询的用户信息
        return userDao.findUserById(user.getId());
    }

    /**
     * 修改用户密码
     * @param id
     * @param oldepassword
     * @param newpassword1
     * @return
     */
    @Override
    public Boolean alterPassword(Integer id, String oldepassword, String newpassword1) {

        // 1.判断输入的旧密码是否正确
        User user = userDao.findUserById(id);
        if(!user.getPassword().equals(oldepassword)){
            // 密码不正确
            return false;
        }

        // 2.修改密码
        userDao.alterPasswordById(id,newpassword1);

        return true;
    }

}
