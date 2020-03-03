package com.glut.dao;

import com.glut.domain.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

@Repository
public interface IUserDao {

    /**
     * 保存用户信息
     */
    @Insert("insert into user values(null,#{username},#{password},#{nikename},#{address},#{email})")
    public void saveUser(User user);

    /**
     * 根据用户名和密码查询用户
     * @param username
     * @param password
     * @return
     */
    @Select("select * from user where username = #{username} and password = #{password}")
    public User findUserByUsernameAndPassword(@Param("username") String username, @Param("password") String password);

    /**
     * 根据用户名查找用户
     * @param username
     * @return
     */
    @Select("select * from user where username = #{username}")
    User findUserByUsername(String username);

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @Update("update user set nikename = #{nikename} , email = #{email} , address = #{address} where id = #{id}")
    void alterUser(User user);

    /**
     * 根据用户id查询用户信息
     * @param id
     * @return
     */
    @Select("select * from user where id = #{id}")
    User findUserById(int id);

    /**
     * 根据用户id修改密码
     * @param id
     * @param newpassword1
     */
    @Update("update user set password = #{newpassword1} where id = #{id}")
    void alterPasswordById(@Param("id") Integer id, @Param("newpassword1") String newpassword1);


}
