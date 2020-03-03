<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>商品详细</title>

    <!-- Bootstrap -->
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../statics/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../statics/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="../../statics/css/book.css">
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
<body >

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
                        </ul>
                    </li>
                </ul>

                <ul class="nav navbar-nav navbar-right">

                    <c:if test="${sessionScope.user != null}">
                        <li><a href="/order/myCart?user_id=${user.id}">我的购物车</a></li>
                    </c:if>

                    <c:if test="${sessionScope.user == null}">
                        <li><a href="/action/goLogin">登录</a></li>
                    </c:if>
                    <c:if test="${sessionScope.user != null}">
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.user.nikename} <span class="caret"></span></a>
                            <ul class="dropdown-menu">
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

	<div class="panel panel-default container" id="container">
	  <div class="panel-body">
	  	<div class="books">
		   	<div class="bookphoto"><img alt="书图" src="${book.imgurl}" id="book" style="width: 350px; height: 350px"></div>
			<div class="bookinfos">
				<div><label class="info">书名:&emsp;${book.name}</label></div>
				<div><label class="info">价格:&emsp;￥${book.price}</label></div>
				<div><label class="info">库存:&emsp;${book.stock}</label></div>
                <textarea style="width:300%;height:200px;"id="disabledInput"disabled>
                    ${book.info}
				</textarea>
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
	</div>
</body>
</html>