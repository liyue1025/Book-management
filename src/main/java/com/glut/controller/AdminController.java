package com.glut.controller;

import com.glut.dao.IUserDao;
import com.glut.domain.*;
import com.glut.service.IAdminService;
import com.glut.service.IBookService;
import com.glut.service.IOrderFormService;
import com.glut.service.IUserService;
import com.glut.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 管理员web
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    IAdminService adminService;
    @Autowired
    IBookService bookService;
    @Autowired
    IOrderFormService orderFormService;

    /**
     * 管理员登陆
     * @return
     */
    @RequestMapping("/login")
    public ModelAndView login(String adminname, String password, HttpServletRequest request){

        ModelAndView mv = new ModelAndView();

        if(adminname == null || "".equals(adminname) || password == null || "".equals(password)){
            mv.addObject("msg","账号和密码不能为空！");
            mv.setViewName("adminstratorLogin");
            return mv;
        }

        Admin admin = adminService.login(adminname,password);
        if(admin == null){
            mv.addObject("msg","账号或密码错误！");
            mv.setViewName("adminstratorLogin");
            return mv;
        }else{
            mv.setViewName("adminIndex");
            return mv;
        }
    }

    /**
     * 查看所有用户信息
     * @return
     */
    @RequestMapping("findAllUser")
    public ModelAndView findAllUser(){
        ModelAndView mv = new ModelAndView();
        List<User> users = adminService.findAllUser();
        mv.addObject("users",users);
        mv.setViewName("adminCheck_user");
        return mv;
    }

    /**
     * 查看所有订单信息
     * @return
     */
    @RequestMapping("findAllOrder")
    public ModelAndView findAllOrder(){
        ModelAndView mv = new ModelAndView();
        List<OrderForm> orders = orderFormService.findAll();
        System.out.println(orders);
        mv.addObject("orders",orders);
        mv.setViewName("adminCheck_order");
        return mv;
    }

    /**
     * 查看所有商品信息
     * @return
     */
    @RequestMapping("findAllBook")
    public ModelAndView findAllBook(){
        ModelAndView mv = new ModelAndView();
        List<Book> books = bookService.findAll();
        mv.addObject("books",books);
        mv.setViewName("adminCheck_book");
        return mv;
    }

    /**
     * 前往修改用户信息页面，完成回显
     * @param id
     * @return
     */
    @RequestMapping("/toAlterUser")
    public ModelAndView toAlterUser(Integer id){
        // 根据id查询用户
        User user = adminService.findUserById(id);

        ModelAndView mv = new ModelAndView("alterUserByAdmin");
        mv.addObject("user",user);

        return mv;
    }

    /**
     * 修改用户信息
     * @param user
     * @return
     */
    @RequestMapping("/alterUser")
    public String alterUser(User user){

        adminService.alterUser(user);

        return "forward:/admin/findAllUser";
    }

    /**
     * 删除用户
     * @param id
     * @return
     */
    @RequestMapping("/deleteUser")
    public String deleteUser(Integer id){
        adminService.deleteUser(id);
        return "forward:/admin/findAllUser";
    }

    /**
     * 前往修改商品信息页面，完成回显
     * @param id
     * @return
     */
    @RequestMapping("/toAlterBook")
    public ModelAndView toAlterBook(Integer id){
        Book book = bookService.findById(id);
        ModelAndView mv = new ModelAndView("alterBook");
        mv.addObject("book",book);

        return mv;
    }

    /**
     * 修改用户信息，进货
     * @param book
     * @return
     */
    @RequestMapping("/alterBook")
    public String alterBook(Book book){
        // 修改用户信息
        adminService.alterBook(book);
        // 进货
        adminService.purchase(book.getId(), book.getStock());
        return "forward:/admin/findAllBook";
    }

    /**
     * 删除商品
     * @param id
     * @return
     */
    @RequestMapping("/deleteBook")
    public String deleteBook(Integer id){
        adminService.deleteBook(id);
        return "forward:/admin/findAllBook";
    }


}
