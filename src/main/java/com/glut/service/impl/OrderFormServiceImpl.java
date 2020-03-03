package com.glut.service.impl;

import com.glut.dao.IBookDao;
import com.glut.dao.IOrderFormDao;
import com.glut.domain.BookPage;
import com.glut.domain.OrderForm;
import com.glut.service.IOrderFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * 订单业务层
 */
@Service("orderService")
public class OrderFormServiceImpl implements IOrderFormService {

    @Autowired
    IOrderFormDao orderFormDao;
    @Autowired
    IBookDao bookDao;

    /**
     * 查询所有订单信息
     * @return
     */
    @Override
    public List<OrderForm> findAll(){
        return orderFormDao.findAll();
    }

    /**
     * 商品加入购物车
     * @param user_id
     * @param book_id
     */
    @Override
    public Boolean addToCart(Integer user_id, Integer book_id) {

        // 查看库存是否足够
        Integer stock = bookDao.findById(book_id).getStock();

        if(stock > 0){
            // 查询改商品价格
            Double price = bookDao.findById(book_id).getPrice();
            System.out.println("商品单价："+price);

            // 1.查询是否有未付款的相同的订单
            int contain = orderFormDao.containUnpaid(user_id, book_id);
            System.out.println("contain:"+contain);
            if(contain == 0){
                // 无未付款相同的订单
                // 创建新订单
                Date date = new Date();
                System.out.println(date);
                orderFormDao.createOrder(user_id, book_id, price, date);
                // 商品库存 -1
                bookDao.subStock(book_id,1);
            }else {
                // 有未付款相同的订单，判断订单状态是否为已付款
                // 则订单中的商品数量 +1,订单总价增加
                orderFormDao.addOrderCount(user_id, book_id, price);
                // 商品库存 -1
                bookDao.subStock(book_id,1);
            }
            return true;
        }else{
            return false;
        }
    }

    /**
     * 查看购物车
     * @param user_id
     * @return
     */
    @Override
    public List<OrderForm> myOrderForm(Integer user_id) {
        // 根据用户id查询出未付款订单
        List<OrderForm> orderForms = orderFormDao.findByUidUnpaid(user_id);

        return orderForms;
    }

    /**
     * 付款页
     * @param user_id
     * @return
     */
    @Override
    public List<OrderForm> payment(Integer user_id) {
        // 根据用户id查询出未付款订单对象
        List<OrderForm> orderForms = orderFormDao.findByUidUnpaid(user_id);

        return orderForms;
    }

    /**
     * 查看订单
     * @param user_id
     * @return
     */
    @Override
    public List<OrderForm> order(Integer user_id) {

        // 根据用户id查询出已付款订单对象
        List<OrderForm> orderForms = orderFormDao.findByUidPaid(user_id);

        return orderForms;
    }

    /**
     * 更改订单状态为已付款
     * @param user_id
     */
    @Override
    public void changeState(Integer user_id) {
        orderFormDao.changeStateByUid(user_id);
    }

    /**
     * 减少商品数量（-1）
     * @param user_id
     * @param book_id
     */
    @Override
    public void reduceFromCart(Integer user_id, Integer book_id) {
        // 查询改商品价格
        Double price = bookDao.findById(book_id).getPrice();

        orderFormDao.reduceOrderCount(user_id,book_id,price);
    }

    /**
     * 收货
     * @param id
     */
    @Override
    public void receive(Integer id) {
        orderFormDao.deleteById(id);
    }

    /**
     * 从购物车中删除商品
     * @param id
     */
    @Override
    public void deleteFromCart(Integer id) {
        orderFormDao.deleteById(id);
    }

}
