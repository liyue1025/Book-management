<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
		<h2>订单管理</h2>
		<div class="manage">
			<div class="search">
		
			</div>
			<div class="spacer"></div>
			    <table class="table table-hover">
					<c:forEach items="${orders}" var="order">
						<tr class="active ">
							<td class="first w4 c">订单号:${order.id}</td>
							<td class="w1 c">${order.date}</td>
							<td class="w1 c">收货人id:${order.user_id}</td>
						</tr>
					</c:forEach>
				</table>
        </div>
    </div>

	<div class="clear">

    </div>
</div>

</body>
</html>
