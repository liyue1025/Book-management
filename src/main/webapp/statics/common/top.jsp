<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../css/top.css">
	<script type="text/javascript" src="../js/bootstrap.min.js"></script>
	
<div class="header">
			<nav class="navbar navbar-default">
	  			<div class="container-fluid">
	    			<div class="navbar-header">
	      				<a class="navbar-brand" href="main">
	        				<img src="../images/icon_log.png" alt="Brand" class="img-rounded">
	      				</a>
	    			</div>
	    			<h4>BookStore</h4>
					<!--登录者操作 -->
					
					<div class="btn-group logininfo">
						 	<div class="btn-group" role="group" style="margin-top:8px;">
						 	  <c:if test="${user != null }">
						 	  	<h5>欢迎:&nbsp;<strong>${user.username }</strong>&emsp;<a href="cancel">退出</a></h5>
						 	  </c:if>
						 	  <c:if test="${user == null }">
						 	  	<img title="用户登录" alt="登录" src="../images/icon_login.png" onclick="location.href='tologin'">
						 	  </c:if>
							</div>
					</div>
					
					<div class="btn-group cart">
						<img title="购物车" alt="购物车" src="../images/icon_cart.png" onclick="location.href='cart'">
					</div>
	  			</div>
			</nav>
  	</div>
  	