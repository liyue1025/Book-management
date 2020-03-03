package com.glut.controller;

import com.glut.domain.OrderForm;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

/**
 * 转发类
 */
@Controller
@RequestMapping("/action")
public class Action {

    // 转发到 login.jsp
    @RequestMapping("/goLogin")
    public String goLogin(){
        return "login";
    }

    // 转发到register
    @RequestMapping("/goRegister")
    public String goRegister(){
        return "register";
    }

    // 转发到 alterPassword.jsp
    @RequestMapping("/goAlterPassword")
    public String goAlterPassword(){
        return "alterPassword";
    }

    // 转发到 personInformation.jsp
    @RequestMapping("/goPersonInformation")
    public String goPersonInformation(){
        return "personInformation";
    }

    // 转发到alterUser.jsp
    @RequestMapping("/goAlterUser")
    public String goAlterUser(){
        return "alterUser";
    }

    // 转发到cart.jsp
    @RequestMapping("/goCart")
    public String goCart(){
        return "cart";
    }

    // 转发到adminstratorLogin.jsp
    @RequestMapping("/goAdminstratorLogin")
    public String goAdminstratorLogin(){
        return "adminstratorLogin";
    }

}
