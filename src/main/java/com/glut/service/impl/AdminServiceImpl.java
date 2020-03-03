package com.glut.service.impl;

import com.glut.dao.IAdminDao;
import com.glut.domain.Admin;
import com.glut.domain.Book;
import com.glut.domain.Page;
import com.glut.domain.User;
import com.glut.service.IAdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("adminService")
public class AdminServiceImpl implements IAdminService {

    @Autowired
    IAdminDao adminDao;

    /**
     * 管理员登陆
     * @param adminname
     * @param password
     * @return
     */
    @Override
    public Admin login(String adminname, String password) {
        return adminDao.findByAdminnameAndPassword(adminname,password);
    }

    /**
     * 查询所有用户
     * @return
     */
    @Override
    public List<User> findAllUser() {
        return adminDao.findAllUser();
    }

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Override
    public User findUserById(Integer id) {
        return adminDao.findUserById(id);
    }

    /**
     * 修改用户信息
     * @param user
     */
    @Override
    public void alterUser(User user) {
        adminDao.alterUser(user);
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @Override
    public void deleteUser(Integer id) {
        adminDao.deleteUserById(id);
    }

    /**
     * 修改商品信息
     * @param book
     */
    @Override
    public void alterBook(Book book) {
        adminDao.alterBook(book);
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @Override
    public void deleteBook(Integer id) {
        adminDao.deleteBookById(id);
    }

    /**
     * 进货
     * @param stock
     */
    @Override
    public void purchase(Integer id, Integer stock) {
        adminDao.addStock(id, stock);
    }
}
