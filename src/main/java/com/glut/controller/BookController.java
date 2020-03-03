package com.glut.controller;

import com.glut.domain.Book;
import com.glut.domain.BookPage;
import com.glut.service.impl.BookServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * 商品web
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookServiceImpl bookService;

    /**
     * 查看商品详细信息
     * @param book_id
     * @return
     */
    @RequestMapping("/bookInfo")
    public ModelAndView bookInfo(Integer book_id){
        ModelAndView mv = new ModelAndView();
        Book book = bookService.findById(book_id);
        mv.addObject("book",book);
        mv.setViewName("book");
        System.out.println(book);
        return mv;
    }

    /**
     * 查看商品列表
     * @return
     */
    @RequestMapping("/bookList")
    public String bookList(HttpServletRequest request){

        // 获取参数map
        Map<String, String[]> map = request.getParameterMap();

        // 获取当前页码pageNumber
        String _pageNumber = request.getParameter("pageNumber");

        // pageNumber是否为空，如果为空赋默认值1
        if(_pageNumber==null || "".equals(_pageNumber)){
            _pageNumber = "1";
        }

        // 拆箱
        int pageNumber = Integer.parseInt(_pageNumber);

        // 调用service
        BookPage bookPage = bookService.bookList(pageNumber,map);
        request.setAttribute("bookPage",bookPage);
        request.setAttribute("map",map);


        return "main";
    }

}
