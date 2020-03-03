package com.glut.controller;

import com.glut.domain.BookPage;
import com.glut.domain.OrderForm;
import com.glut.service.IOrderFormService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 订单web层
 */
@Controller
@RequestMapping("/order")
public class OrderFormController {

    @Autowired
    IOrderFormService orderFormService;

    /**
     * 商品加入购物车
     * @param user_id
     * @param book_id
     */
    @ResponseBody
    @RequestMapping(value = "/addToCart",produces = "text/html;charset=UTF-8")
    public String addToCart(Integer user_id, Integer book_id){
        Boolean flag = orderFormService.addToCart(user_id, book_id);
        if(flag){
            return "加入购物车成功！";
        }else{
            return "加入购物车失败，库存不足！";
        }
    }

    /**
     * 查看购物车
     * @param user_id
     * @return
     */
    @RequestMapping("/myCart")
    public ModelAndView myCart(Integer user_id){
        ModelAndView mv = new ModelAndView();

        // 查询该用户的所有未付款订单信息
        List<OrderForm> orderForms = orderFormService.myOrderForm(user_id);

        // 订单总价
        Double total = 0.0;
        for (OrderForm orderForm : orderForms) {
            total += orderForm.getTotalPrice();
        }
        mv.addObject("orderForms",orderForms);
        mv.addObject("total",total);
        mv.setViewName("cart");
        return mv;
    }

    /**
     * 付款
     * @param user_id
     * @return
     */
    @RequestMapping("/payment")
    public ModelAndView payment(Integer user_id){
        ModelAndView mv = new ModelAndView();

        // 查询该用户的所有未付款订单信息
        List<OrderForm> orderForms = orderFormService.payment(user_id);

        // 订单总价
        Double total = 0.0;
        for (OrderForm orderForm : orderForms) {
            total += orderForm.getTotalPrice();
        }
        mv.addObject("orderForms",orderForms);
        mv.addObject("total",total);
        mv.setViewName("payment");
        return mv;
    }


    /**
     * 确认付款，提交订单，跳转订单页面
     * @param user_id
     * @return
     */
    @RequestMapping("/subOrder")
    public ModelAndView subOrder(Integer user_id){
        ModelAndView mv = new ModelAndView();

        // 将订单状态改为已付款
        orderFormService.changeState(user_id);

        // 查询该用户的所有已付款订单信息
        List<OrderForm> orderForms = orderFormService.order(user_id);

        mv.addObject("orderForms",orderForms);
        mv.setViewName("order");
        return mv;
    }

    /**
     * 查看我的订单
     * @param user_id
     * @return
     */
    @RequestMapping("/myOrder")
    public ModelAndView myOrder(Integer user_id){
        ModelAndView mv = new ModelAndView();

        // 查询该用户的所有已付款订单信息
        List<OrderForm> orderForms = orderFormService.order(user_id);

        mv.addObject("orderForms",orderForms);
        mv.setViewName("order");
        return mv;
    }

    /**
     * 减少商品数量（-1）
     * @param user_id
     * @param book_id
     */
    @RequestMapping("/reduceFromCart")
    @ResponseBody
    public void reduceFromCart(Integer user_id, Integer book_id){
        orderFormService.reduceFromCart(user_id,book_id);
    }

    /**
     * 删除订单
     * @param id
     */
    @RequestMapping("/receive")
    public String receive(Integer id, Integer user_id){
        orderFormService.receive(id);
        return "forward:/order/myOrder?user_id="+user_id;
    }

    /**
     * 从购物车中删除商品
     * @param id
     */
    @RequestMapping("/deleteFromCart")
    public String deleteFromCart(Integer id, Integer user_id){
        orderFormService.deleteFromCart(id);
        return "forward:/order/myCart?user_id="+user_id;
    }


}
