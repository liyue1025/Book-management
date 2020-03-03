package com.glut.service;

import com.glut.domain.BookPage;
import com.glut.domain.OrderForm;
import com.sun.org.apache.xpath.internal.operations.Bool;

import java.util.List;

/**
 * 订单业务层接口
 */
public interface IOrderFormService {

    /**
     * 查询所有订单
     * @return
     */
    public List<OrderForm> findAll();

    /**
     * 商品加入购物车
     * @param user_id
     * @param book_id
     */
    Boolean addToCart(Integer user_id, Integer book_id);

    /**
     * 查看购物车
     * @param user_id
     * @return
     */
    List<OrderForm> myOrderForm(Integer user_id);

    /**
     * 付款
     * @param user_id
     * @return
     */
    List<OrderForm> payment(Integer user_id);

    /**
     * 查看订单
     * @param user_id
     * @return
     */
    List<OrderForm> order(Integer user_id);

    /**
     * 更改订单状态为已付款
     * @param user_id
     */
    void changeState(Integer user_id);

    /**
     * 减少商品数量（-1）
     * @param user_id
     * @param book_id
     */
    void reduceFromCart(Integer user_id, Integer book_id);

    /**
     * 收货，删除订单
     * @param id
     */
    void receive(Integer id);

    /**
     * 从购物车中删除商品
     * @param id
     */
    void deleteFromCart(Integer id);
}
