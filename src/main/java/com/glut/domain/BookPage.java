package com.glut.domain;

import java.util.List;

/**
 * 图书分页类
 */
public class BookPage {

    private int bookCount; //图书总数
    private int pageCount; //总页数
    private List<Book> list; //当前页图书数据
    private int pageNumber; //当前页码

    public int getBookCount() {
        return bookCount;
    }

    public void setBookCount(int bookCount) {
        this.bookCount = bookCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List<Book> getList() {
        return list;
    }

    public void setList(List<Book> list) {
        this.list = list;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    @Override
    public String toString() {
        return "BookPage{" +
                "bookCount=" + bookCount +
                ", pageCount=" + pageCount +
                ", list=" + list +
                ", pageNumber=" + pageNumber +
                '}';
    }
}
