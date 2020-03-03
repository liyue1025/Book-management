package com.glut.dao;

import com.glut.domain.OrderForm;
import org.apache.ibatis.annotations.*;
import org.apache.ibatis.mapping.FetchType;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * 商品持久层接口
 */
@Repository
public interface IOrderFormDao {

    /**
     * 创建订单
     * @param user_id
     * @param book_id
     * @param price
     * @param date
     */
    @Insert("insert into orderform values(null, #{user_id}, #{book_id}, 1, #{price}, #{date}, 0)")
    void createOrder(@Param("user_id") Integer user_id, @Param("book_id")Integer book_id, @Param("price")Double price, @Param("date")Date date);

    /**
     * 订单商品数量+1 ,订单总价增加
     * @param user_id
     * @param book_id
     */
    @Update("update orderform set count = count + 1, totalPrice = totalPrice + #{price} where user_id = #{user_id} and book_id = #{book_id}")
    void addOrderCount(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id, @Param("price") Double price);

    /**
     * 订单商品数量-1 ,订单总价减少
     * @param user_id
     * @param book_id
     */
    @Update("update orderform set count = count - 1, totalPrice = totalPrice - #{price} where user_id = #{user_id} and book_id = #{book_id}")
    void reduceOrderCount(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id, @Param("price") Double price);

    /**
     * 判断订单是否存在
     * @param user_id
     * @param book_id
     * @return 不存在返回0，存在则返回1
     */
    @Select("SELECT COUNT(*) FROM orderform WHERE user_id = #{user_id} AND book_id = #{book_id}")
    int contain(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);

    /**
     * 根据用户id查询出所有订单信息
     * @param user_id
     * @return
     */
    @Select("select * from orderform where user_id = #{user_id}")
    @Results(id = "orderFormMap" ,
            value = {
            @Result(id = true, property = "id", column = "id"),
            @Result(property = "user_id", column = "user_id"),
            @Result(property = "book_id", column = "book_id"),
            @Result(property = "count", column = "count"),
            @Result(property = "totalPrice", column = "totalPrice"),
            @Result(property = "date", column = "date"),
            @Result(property = "state", column = "state"),
            @Result(property = "book", column = "book_id",one = @One(select = "com.glut.dao.IBookDao.findById", fetchType = FetchType.EAGER))
    })
    List<OrderForm> findByUid(Integer user_id);

    /**
     * 根据用户id查询出所有已付款订单信息
     * @param user_id
     * @return
     */
    @Select("select * from orderform where user_id = #{user_id} and state != 0")
    @ResultMap("orderFormMap")
    List<OrderForm> findByUidPaid(Integer user_id);

    /**
     * 根据用户id查询出所有未付款订单信息
     * @param user_id
     * @return
     */
    @Select("select * from orderform where user_id = #{user_id} and state = 0")
    @ResultMap("orderFormMap")
    List<OrderForm> findByUidUnpaid(Integer user_id);

    /**
     * 更改订单状态为已付款
     * @param user_id
     */
    @Update("update orderform set state = 1 where user_id = #{user_id}")
    void changeStateByUid(Integer user_id);

    /**
     * 判断订单是否存在且已付款
     * @param user_id
     * @param book_id
     * @return 不存在返回0，存在则返回1
     */
    @Select("SELECT COUNT(*) FROM orderform WHERE user_id = #{user_id} AND book_id = #{book_id} and state = 1")
    int containPaid(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);

    /**
     * 判断订单是否存在且未付款
     * @param user_id
     * @param book_id
     * @return 不存在返回0，存在则返回1
     */
    @Select("SELECT COUNT(*) FROM orderform WHERE user_id = #{user_id} AND book_id = #{book_id} and state = 0")
    int containUnpaid(@Param("user_id") Integer user_id, @Param("book_id") Integer book_id);

    /**
     * 根据订单id删除订单
     * @param id
     */
    @Delete("delete from orderform where id = #{id}")
    void deleteById(Integer id);

    @Select("select * from orderform")
    List<OrderForm> findAll();
}
