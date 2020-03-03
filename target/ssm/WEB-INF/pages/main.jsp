<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>首页</title>

    <!-- Bootstrap -->
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../statics/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../statics/js/bootstrap.min.js"></script>

    <script>
        function addToCart(book_id) {
            $.ajax({
                url:"/order/addToCart",
                type:"POST",
                data:{"user_id":${user.id},"book_id":book_id},
                success:function (data) {
                    alert(data);
                },
                error:function () {
                    alert("加入购物车失败")
                }
            });
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

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">分类 <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/book/bookList?bookCategory=computer">计算机</a></li>
                            <li><a href="/book/bookList?bookCategory=english">英语</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="/book/bookList">所有商品</a></li>
                        </ul>
                    </li>
                </ul>

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

<div  class="container">

    <%-- 页头 --%>
    <div class="page-header">
        <h1>Book<small>&nbsp;
            <c:if test="${requestScope.map.bookCategory[0] eq 'english'}">
                英语书籍
            </c:if>
            <c:if test="${requestScope.map.bookCategory[0] eq 'computer'}">
                计算机书籍
            </c:if>
        </small></h1>
    </div>

    <div style="width: 45%; margin-bottom: 30px">
        <form action="/book/bookList" method="post">
            <div class="input-group">
                <input type="text" class="form-control" name="bookName" value="${requestScope.map.bookName[0]}" >
                <span class="input-group-btn">
            <button class="btn btn-default" type="submit">搜索</button>
        </span>
            </div>
        </form>
    </div>

    <c:forEach items="${requestScope.bookPage.list}" var="book" varStatus="s">
        <div class="col-md-3">
            <div class="thumbnail">
                <a href="/book/bookInfo?book_id=${book.id}"><img src="${book.imgurl}" alt="图片加载失败"></a>
                <div class="caption">
                    <h5 style="color: red">￥${book.price}</h5>
                    <a href="/book/bookInfo?book_id=${book.id}"><h4>${book.name}</h4></a>
                    <div class="btn-group" role="group" aria-label="...">
                        <c:if test="${sessionScope.user != null}">
                            <button type="button" class="btn btn-warning" onclick="addToCart(${book.id})">加入购物车</button>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            <a href="/action/goLogin" type="button" class="btn btn-warning">加入购物车</a>
                        </c:if>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>

</div>

<div class="container">
    <form action="/book/bookList" method="post">
        <%--分页条--%>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <%--上一页--%>
                <%--不是第一页--%>
                <c:if test="${requestScope.bookPage.pageNumber - 1 > 0}">
                    <li>
                        <a href="/book/bookList?pageNumber=${requestScope.bookPage.pageNumber-1}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--是第一页--%>
                <c:if test="${requestScope.bookPage.pageNumber - 1 <= 0}">
                    <li class="disabled">
                        <a href="/book/bookList?pageNumber=${requestScope.bookPage.pageNumber}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                <c:forEach begin="1" end="${requestScope.bookPage.pageCount}" var="i">
                    <%--判断是否激活状态--%>
                    <c:if test="${requestScope.bookPage.pageNumber == i}">
                        <li class="active"><a href="/book/bookList?pageNumber=${i}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${requestScope.bookPage.pageNumber != i}">
                        <li><a href="/book/bookList?pageNumber=${i}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <%--下一页--%>
                <%--不是最后一页--%>
                <c:if test="${requestScope.bookPage.pageNumber < requestScope.bookPage.pageCount}">
                    <li>
                        <a href="/book/bookList?pageNumber=${requestScope.bookPage.pageNumber+1}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--是最后一页--%>
                <c:if test="${requestScope.bookPage.pageNumber >= requestScope.bookPage.pageCount}">
                    <li class="disabled">
                        <a href="/book/bookList?pageNumber=${requestScope.bookPage.pageNumber}&bookName=${requestScope.map.bookName[0]}&bookCategory=${requestScope.map.bookCategory[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
            </ul>
        </nav>

        <span ><h4>共有${requestScope.bookPage.bookCount}件商品</h4></span>
    </form>


</div>


</body>
</html>