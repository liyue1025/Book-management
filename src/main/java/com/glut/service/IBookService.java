package com.glut.service;

import com.glut.domain.Book;
import com.glut.domain.BookPage;

import java.util.List;
import java.util.Map;

/**
 * 商品业务层接口
 */
public interface IBookService {

    /**
     * 查询所有商品信息
     * @return
     */
    List<Book> findAll();

    /**
     * 条件分页查询图书
     * @param pageNumber 当前页码
     * @param map 参数map
     * @return 分页对象BookPage
     */
    BookPage bookList(Integer pageNumber, Map<String, String[]> map);

    /**
     * 根据商品id查询商品信息
     * @return
     */
    Book findById( Integer book_id);

}
