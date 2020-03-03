package com.glut.dao;

import com.glut.domain.Admin;
import com.glut.domain.Book;
import com.glut.domain.User;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface IAdminDao {

    /**
     * 通过adminname和password查找
     * @param adminname
     * @param password
     * @return
     */
    @Select("select * from admin where adminname=#{adminname} and password=#{password}")
    Admin findByAdminnameAndPassword(@Param("adminname") String adminname, @Param("password") String password);

    /**
     * 查询所有用户
     * @return
     */
    @Select("select * from user")
    List<User> findAllUser();

    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    @Select("select * from user where id = #{id}")
    User findUserById(Integer id);

    /**
     * 修改用户信息
     * @param user
     */
    @Update("update user set username = #{username}, password = #{password}, nikename = #{nikename} , email = #{email} , address = #{address} where id = #{id}")
    void alterUser(User user);

    /**
     * 删除用户
     * @param id
     * @return
     */
    @Delete("delete from user where id = #{id}")
    void deleteUserById(Integer id);

    /**
     * 修改商品信息
     * @param book
     */
    @Update("update book set name = #{name}, price = #{price}, category = #{category} , info = #{info} where id = #{id}")
    void alterBook(Book book);

    /**
     * 删除商品
     * @param id
     * @return
     */
    @Delete("delete from book where id = #{id}")
    void deleteBookById(Integer id);

    /**
     * 进货
     * @param stock
     */
    @Update("update book set stock = stock+#{stock} where id = #{id}")
    void addStock(@Param("id") Integer id, @Param("stock") Integer stock);
}
