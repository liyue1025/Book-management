<%--
    用户登录成功页面
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>个人信息</title>

	<!-- Bootstrap -->
	<link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../../statics/js/jquery-3.4.1.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="../../statics/js/bootstrap.min.js"></script>
</head>

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

<body>
	<div class="container">
		<div style="margin-top: 180px; width: 60%">
			<h1>欢迎您！${sessionScope.user.nikename}</h1>
			<table class="table">
				<tr>
					<td><span class="glyphicon glyphicon-user" aria-hidden="true"></span>&nbsp;&nbsp;用户名：</td>
					<td>${sessionScope.user.username}</td>
				</tr>
				<tr>
					<td><span class="glyphicon glyphicon glyphicon-home" aria-hidden="true"></span>&nbsp;&nbsp;地址：</td>
					<td>${sessionScope.user.address}</td>
				</tr>
				<tr>
					<td><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span>&nbsp;&nbsp;邮箱：</td>
					<td>${sessionScope.user.email}</td>
				</tr>
			</table>
			<div class="text-right">
				<button type="button" class="btn btn-link"><h5><a href="/action/goAlterUser">修改信息</a></h5></button>
			</div>
		</div>
	</div>
</body>
</html>
