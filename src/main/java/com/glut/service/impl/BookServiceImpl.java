package com.glut.service.impl;

import com.glut.dao.IBookDao;
import com.glut.domain.Book;
import com.glut.domain.BookPage;
import com.glut.service.IBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service("bookService")
public class BookServiceImpl implements IBookService {

    @Autowired
    private IBookDao bookDao;

    /**
     * 查询所有商品
     * @return
     */
    @Override
    public List<Book> findAll() {
        return bookDao.findAll();
    }

    /**
     * 条件分页查询图书
     * @param pageNumber 当前页码
     * @param map 参数map
     * @return 分页对象BookPage
     */
    @Override
    public BookPage bookList(Integer pageNumber, Map<String, String[]> map) {

        /**
         * 获取map中参数值
         *  bookName:书名查询图书参数
         *  bookCategory:分类查询图书参数
         */
        String bookName = null;
        String bookCategory = null;

        if(map.get("bookName") != null && !"".equals(map.get("bookName")[0])){
            bookName = map.get("bookName")[0];
            System.out.println("bookName不为空");
        }
        if(map.get("bookCategory") != null && !"".equals(map.get("bookCategory")[0])){
            bookCategory = map.get("bookCategory")[0];
            System.out.println("bookCategory不为空");
        }

        // 每页图书最大数量
        int rows = 8;

        // 1.创建Page对象
        BookPage bookPage = new BookPage();

        // 2.条件查询用户总数
        int bookCount = bookDao.conditionUserCount(bookName,bookCategory);
        bookPage.setBookCount(bookCount);

        // 3.条件查询用户List集合
        int start = (pageNumber-1)*rows; //开始查询的索引
        List<Book> list = new ArrayList<Book>();
        list = bookDao.conditionBook(start,rows,bookName,bookCategory);
        bookPage.setList(list);

        // 4.计算总页数
        int pageCount = bookCount % rows == 0 ? bookCount / rows : bookCount / rows + 1;
        bookPage.setPageCount(pageCount);

        // 5.设置参数
        bookPage.setPageNumber(pageNumber);

        return bookPage;
    }

    /**
     * 根据商品id查询商品信息
     * @return
     */
    @Override
    public Book findById(Integer book_id) {
        return bookDao.findById(book_id);
    }

}
