package com.glut.service;

import com.glut.domain.Admin;
import com.glut.domain.Book;
import com.glut.domain.Page;
import com.glut.domain.User;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface IAdminService {

    /**
     * 管理员登陆
     * @param adminname
     * @param password
     * @return
     */
    Admin login(String adminname, String password);

    /**
     * 查询所有用户
     * @return
     */
    List<User> findAllUser();

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User findUserById(Integer id);

    /**
     * 修改用户信息
     * @param user
     */
    void alterUser(User user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    void deleteUser(Integer id);

    /**
     * 修改商品信息
     * @param book
     */
    void alterBook(Book book);

    /**
     * 删除商品
     * @param id
     * @return
     */
    void deleteBook(Integer id);

    /**
     * 进货
     * @param stock
     */
    void purchase(Integer id, Integer stock);
}
