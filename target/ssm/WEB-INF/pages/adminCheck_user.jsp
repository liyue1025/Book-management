<%@ page language="java" import="java.util.*" pageEncoding="utf-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
    
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>网上书店</title>
<link type="text/css" rel="stylesheet" href="../../statics/css/style.css"/>

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

<div id="logo"><img src="../../statics/images/logoB.png" /></div>

</head>
<body onload="getNowFormatDate()">

<div id="childNav">
	<div class="welcome wrap">
		管理员您好，今天是<span id="time"></span>，欢迎回到管理后台。
	</div>
</div>
<div id="main" class="wrap">
	<div id="menu-mng" class="lefter">
		<div class="box">
			<dl>
				<dt>管理</dt>
				<!-- 用户管理 -->
				<dd><a href="/admin/findAllUser">用户管理</a></dd>
				<dd><a href="/admin/findAllBook">商品管理</a></dd>
				<dd><a href="/admin/findAllOrder">订单管理</a></dd>
			</dl>
		</div>
	</div>
	<div class="main">
		<h2>用户管理</h2>
		<div class="manage">

				<table class="table table-hover">

					<tr class="active">
						<th width="130px">ID</th>
						<th width="130px">姓名</th>
						<th width="200px">住址</th>
						<th width="100px">Email</th>
						<th width="100px">昵称</th>
						<th width="130">操作</th>
					</tr>

					<c:forEach var="user" items="${users}">
						<tr>
							<!-- id标签 -->
							<td class="first w4 c">${user.id}</td>
							<!-- 用户名标签 -->
							<td class="w1 c">${user.username}</td>
    						<!-- 用户地址标签 -->
							<td class="w2 c">${user.address}</td>
    						<!-- 用户邮箱标签 -->
							<td>${user.email}</td>
							<!-- 用户昵称标签 -->
							<td class="w4 c">${user.nikename}</td>
							<%-- 操作 --%>
							<td><a href="/admin/toAlterUser?id=${user.id}" class="btn btn-default">管理</a></td>
						</tr>
					</c:forEach>


				</table>

			</div>
	</div>
	<div class="clear"></div>
</div>
</body>
</html>
