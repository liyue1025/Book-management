package com.glut.dao;

import com.glut.domain.Book;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

/**
 * 商品持久层接口
 */
@Repository
public interface IBookDao {

    /**
     * 查询所有商品信息
     * @return
     */
    @Select("select * from book")
    List<Book> findAll();

    /**
     * 根据id查询商品
     * @param id
     * @return
     */
    @Select("select * from book where id = #{id}")
    Book findById(Integer id);

    /**
     * 条件查询商品总数
     * @param bookName 商品名称
     * @param bookCategory 商品类别
     * @return
     */
    int conditionUserCount(@Param("bookName") String bookName, @Param("bookCategory") String bookCategory);

    /**
     * 条件查询商品
     * @param start 开始查询索引
     * @param rows 查询数目
     * @param bookName 商品名称
     * @param bookCategory 商品类别
     * @return
     */
    List<Book> conditionBook(@Param("start") int start, @Param("rows") int rows, @Param("bookName") String bookName, @Param("bookCategory") String bookCategory);

    /**
     * 商品库存减少
     */
    @Update("update book set stock = stock - #{number} where id = #{book_id}")
    void subStock(@Param("book_id") Integer book_id, @Param("number") Integer number);
}
