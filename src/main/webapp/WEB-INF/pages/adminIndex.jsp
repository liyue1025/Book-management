<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link type="text/css" rel="stylesheet" href="../../statics/css/style.css"/>
<script type="text/javascript" src="../../statics/js/function.js"></script>
<script type="text/javascript" src="../../statics/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="../../statics/js/jquery.validate-1.13.1.js"></script>
</head>
<div id="logo"><img src="../../statics/images/logoB.png" /></div>
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
			<h2>管理首页</h2>
			<div id="welcome" class="manage">
				<div class="shadow">
					<em class="corner lb"></em>
					<em class="corner rt"></em>
					<div class="box">
						<div class="msg">
							<p>欢迎回来</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="clear"></div>

	</div>

</body>
</html>