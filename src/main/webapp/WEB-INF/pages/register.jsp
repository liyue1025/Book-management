<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>注册</title>

	<!-- Bootstrap -->
	<link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
	<script src="../../statics/js/jquery-3.4.1.min.js"></script>
	<!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
	<script src="../../statics/js/bootstrap.min.js"></script>
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

		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>

	<div class="container">

		<div class="page-header">
			<h1>注册账号 </h1><h3></h3>
		</div>

		<div class="text-center">
			<form class="form-horizontal" action="/user/register" method="post">
				<div class="register">
					<!-- 用户名 -->
					<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputName3" name="username" placeholder="请输入用户名">
						</div>
					</div>

					<!-- 密码 -->
					<div class="form-group">
						<label for="inputPassword4" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="inputPassword4" name="password" placeholder="请输入密码">
						</div>
					</div>

					<!-- 昵称 -->
					<div class="form-group">
						<label for="inputNicheng3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-star" aria-hidden="true"></span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputNicheng3" name="nikename" placeholder="请输入昵称">
						</div>
					</div>

					<!-- 地址 -->
					<div class="form-group">
						<label for="inputAdress3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-home" aria-hidden="true"></span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputAdress3" name="address" placeholder="请输入地址">
						</div>
					</div>
					<!-- 邮箱 -->
					<div class="form-group">
						<label for="inputEmail3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-envelope" aria-hidden="true"></span></label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="inputEmail3" name="email" placeholder="请输入邮箱">
						</div>
					</div>

					<h3 style="color: red">${requestScope.msg}</h3>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10 registerbtn">
							<button type="submit" class="btn btn-default btn-sm">确定</button>
						</div>
					</div><button type="reset" class="btn btn-default btn-sm">重置</button>
				</div>
			</form>
		</div>
	</div>
</body>
</html>