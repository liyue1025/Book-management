package com.glut.domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 订单类
 */
public class OrderForm implements Serializable {

    Integer id;
    Integer user_id;
    Integer book_id;
    Integer count;
    Integer state;  // 订单状态（0：为提交/1：已提交）
    Double totalPrice;
    Date date;
    Book book; // 该订单下的商品信息

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getBook_id() {
        return book_id;
    }

    public void setBook_id(Integer book_id) {
        this.book_id = book_id;
    }

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    @Override
    public String toString() {
        return "OrderForm{" +
                "id=" + id +
                ", user_id=" + user_id +
                ", book_id=" + book_id +
                ", count=" + count +
                ", state=" + state +
                ", totalPrice=" + totalPrice +
                ", date=" + date +
                ", book=" + book +
                '}';
    }
}
