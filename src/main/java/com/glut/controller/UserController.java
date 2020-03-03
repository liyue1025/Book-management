package com.glut.controller;

import com.glut.domain.User;
import com.glut.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

/**
 * 用户web
 */
@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    /**
     * 注册
     * @param user
     * @return
     */
    @RequestMapping("/register")
    public ModelAndView register(User user){

        ModelAndView mv = new ModelAndView();

        if(user.getUsername() == null || user.getPassword().equals("") || user.getPassword() == null || user.getUsername().equals("")){
            mv.addObject("msg","注册失败，用户名或密码不能为空！");
            mv.setViewName("register");
            return mv;
        }

        boolean flag = userService.register(user);

        if(flag){
            // 注册成功
            mv.addObject("msg","注册成功，赶紧登陆吧！");
        }else{
            mv.addObject("msg","注册失败，用户名已存在！");
            mv.setViewName("register");
            return mv;
        }
        mv.setViewName("login");
        return mv;
    }

    /**
     * 登录
     * @param username
     * @param password
     * @param request , HttpServletRequest request
     * @return
     */
    @RequestMapping("/login")
    public String login(String username, String password, HttpServletRequest request){

        // 判断输入是否为空
        if(username == null || username.equals("") || password == null || password.equals("")){
            request.setAttribute("msg","登陆失败！用户名或密码为空！");
            return "login";
        }

        //查询用户
        User user = userService.login(username, password);
        if(user != null){
            request.getSession().setAttribute("user",user);
            return "forward:/book/bookList";
        }else
        {
            request.setAttribute("msg","登陆失败！用户名或密码错误！");
            return "login";
        }
    }

    /**
     * 注销
     * @param request
     * @return
     */
    @RequestMapping("/logoff")
    public String logoff(HttpServletRequest request){
        request.getSession().removeAttribute("user");
        return "forward:/book/bookList";
    }

    /**
     * 修改用户信息
     * @param newUser
     * @param request
     * @return
     */
    @RequestMapping("/alterUser")
    public String alterUser(User newUser, HttpServletRequest request){

        // 判断输入是否为空
        if(newUser.getAddress() == null || newUser.getAddress().equals("") || newUser.getNikename() == null || newUser.getNikename().equals("") || newUser.getEmail() == null || newUser.getEmail().equals("")){
            request.setAttribute("msg","输入不能为空！");
            return "alterUser";
        }

        // 调用service
        User user = userService.alterUser(newUser);
        System.out.println(user);

        // 更新session域中的user
        request.getSession().removeAttribute("user");
        request.getSession().setAttribute("user",user);

        return "personInformation";
    }

    /**
     * 修改密码
     * @param oldepassword 旧密码
     * @param newpassword1 新密码
     * @param newpassword2 新密码
     * @param id 用户id
     * @return
     */
    @RequestMapping("/alterPassword")
    public ModelAndView alterPassword(String oldepassword, String newpassword1, String newpassword2, Integer id){

        ModelAndView mv = new ModelAndView();

        // 1.判断输入是否为空
        if(oldepassword == null || newpassword1 == null || newpassword2 == null || "".equals(oldepassword) || "".equals(newpassword1)|| "".equals(newpassword2) ){
           mv.addObject("msg","输入不能为空！");
           mv.setViewName("alterPassword");
           return mv;
        }
        if(!newpassword1.equals(newpassword2)){
            mv.addObject("msg","两次输入的新密码不一样！请重新输入！");
            mv.setViewName("alterPassword");
            return mv;
        }

        // 2.调用service, flag判断是否修改成功
        Boolean flag = userService.alterPassword(id, oldepassword, newpassword1);

        if(!flag){
            mv.addObject("msg","输入的旧密码错误！");
            mv.setViewName("alterPassword");
            return mv;
        }

        // 3.修改成功，跳转登录页面
        mv.setViewName("login");

        return mv;
    }

}
