<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>我的购物车</title>

    <!-- Bootstrap -->
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../statics/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../statics/js/bootstrap.min.js"></script>
    <style>
        td{
            vertical-align:middle;
        }
    </style>
    <script>

        // 商品数量减少
        function reduce(book_id, book_price, id) {

            // 获取商品数量
            var count = $("#count"+book_id);

            if(parseInt(count.html()) == 1) {
                var flag = confirm("确定从购物车中删除吗？");
                if (flag) {
                    window.location.href = "/order/deleteFromCart?id="+id+"&user_id="+${user.id};
                }
            }else {
                $.ajax({
                    url:"/order/reduceFromCart",
                    type:"POST",
                    data:{"user_id":${user.id},"book_id":book_id},
                });
                // 修改商品数量
                count.html(parseInt(count.html())-1);
                // 修改购物车总价
                var cartPrice = $("#cartPrice");
                cartPrice.html(parseInt(cartPrice.html())-book_price);
                // 修改商品总价
                var totalPrice = $("#totalPrice"+book_id);
                totalPrice.html(parseInt(totalPrice.html())-book_price);
            }
        }

        // 商品数量增加
        function add(book_id,book_price) {

            // 获取商品数量
            var count = $("#count"+book_id);
            $.ajax({
                url:"/order/addToCart",
                type:"POST",
                data:{"user_id":${user.id},"book_id":book_id},
            });
            // 修改商品数量
            count.html(parseInt(count.html())+1);
            // 修改购物车总价
            var cartPrice = $("#cartPrice");
            cartPrice.html(parseInt(cartPrice.html())+book_price);
            // 修改商品总价
            var totalPrice = $("#totalPrice"+book_id);
            totalPrice.html(parseInt(totalPrice.html())+book_price);
        }
    </script>
</head>
<body>

    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <%-- 汉堡按钮 --%>
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="/book/bookList"><span class="glyphicon glyphicon-book" aria-hidden="true"></span>&nbsp;网上书城</a>
            </div>

                <ul class="nav navbar-nav navbar-right">

                    <c:if test="${sessionScope.user != null}">
                        <li><a href="/order/myCart?user_id=${user.id}">我的购物车<span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span></a></li>
                    </c:if>

                    <c:if test="${sessionScope.user == null}">
                        <li><a href="/action/goLogin">登录</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.nikename} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="/order/myOrder?user_id=${sessionScope.user.id}">我的订单</a></li>
                                <li><a href="/action/goPersonInformation">个人信息</a></li>
                                <li><a href="/action/goAlterPassword">修改密码</a></li>
                                <li role="separator" class="divider"></li>
                                <li><a href="/user/logoff">注销</a></li>
                            </ul>
                        </li>
                    </c:if>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>

    <div class="container">

        <div class="page-header">
            <h1><span class="glyphicon glyphicon-shopping-cart" aria-hidden="true"></span>&nbsp;我的购物车 </h1>
        </div>

        <c:if test="${requestScope.orderForms.size() == 0}">
            <div class="text-center" style="margin-top: 200px">
                <h3>购物车是空的，赶紧去<a href="/book/bookList">购物</a>吧！</h3>
            </div>
        </c:if>

        <c:if test="${requestScope.orderForms.size() != 0}">
            <div class="row">
                <div class="col-md-3" style="text-align: center" ><h3>商品信息</h3></div>
                <div class="col-md-3"></div>
                <div class="col-md-2"><h3>单价</h3></div>
                <div class="col-md-2"><h3>数量</h3></div>
                <div class="col-md-2"><h3>总价</h3></div>
            </div>
            <hr>

            <c:forEach items="${requestScope.orderForms}" var="orderForm">
                <div class="row">
                    <div class="col-md-3"><img src="${orderForm.book.imgurl}" alt="图片加载失败" style="width: 150px; height: 150px"></div>
                    <div class="col-md-3" style="margin-top: 55px"><a href="/book/bookInfo?book_id=${orderForm.book.id}"><h4>${orderForm.book.name}</h4></a></div>
                    <div class="col-md-2" style="margin-top: 55px"><h4>${orderForm.book.price}</h4></div>
                    <div class="col-md-2" style="margin-top: 55px">
                        <%-- 调整商品数量 --%>
                        <button type="button" class="btn btn-primary btn-sm " onclick="reduce(${orderForm.book.id},${orderForm.book.price},${orderForm.id})">-</button>
                        <sapn id="count${orderForm.book.id}">${orderForm.count}</sapn>
                        <button type="button" class="btn btn-primary btn-sm " onclick="add(${orderForm.book.id},${orderForm.book.price})">+</button>
                    </div>
                    <div class="col-md-2" style="margin-top: 55px"><h4><span id="totalPrice${orderForm.book.id}">${orderForm.totalPrice}</span></h4></div>
                </div>
                <hr>
            </c:forEach>

            <div class="row">
                <div class="col-sm-3"></div>
                <div class="col-sm-3"></div>
                <div class="col-sm-3"></div>
                <div class="col-sm-3">
                    <h4>合计：&nbsp;￥<span id="cartPrice">${requestScope.total}</span></h4>
                    <p><a href="/order/payment?user_id=${sessionScope.user.id}" type="button" class="btn btn-primary">&nbsp;&nbsp;付款&nbsp;&nbsp;<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span></a></p>
                </div>
            </div>

        </c:if>


        
    </div>


</body>
</html>