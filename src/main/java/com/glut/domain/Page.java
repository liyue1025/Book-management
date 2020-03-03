package com.glut.domain;

import java.util.List;

/**
 * 分页类
 * @param <T>
 */
public class Page<T> {

    private int userCount; //用户总数
    private int rows; //每页的行数
    private int pageCount; //总页数
    private List<T> list; //当前页用户数据
    private int pageNumber; //当前页码


    public int getUserCount() {
        return userCount;
    }

    public void setUserCount(int userCount) {
        this.userCount = userCount;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

    public int getPageNumber() {
        return pageNumber;
    }

    public void setPageNumber(int pageNumber) {
        this.pageNumber = pageNumber;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    @Override
    public String toString() {
        return "Page{" +
                "userCount=" + userCount +
                ", pageCount=" + pageCount +
                ", list=" + list +
                ", pageNumber=" + pageNumber +
                ", rows=" + rows +
                '}';
    }
}
