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
    <title>修改个人信息</title>

    <!-- Bootstrap -->
    <link href="../../statics/css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="../../statics/js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="../../statics/js/bootstrap.min.js"></script>
    <script>
        $(function () {
            // 返回
            $("#return").click(function () {
                window.history.back();
            });
        })
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

    <div class="container">

	<h3 style="text-align: center;"><strong>修改密码</strong></h3>

	<div style="margin-top: 20px">
		<form class="form-horizontal" action="/user/alterPassword" method="post">
			<div class="login">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputEmail3" name="oldepassword" placeholder="旧密码">
					</div>
				</div>

				<div class="form-group">
					<label for="inputNewPassword3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputNewPassword3" name="newpassword1" placeholder="新密码">
					</div>
				</div>

				<div class="form-group">
					<label for="inputNewPassword4" class="col-sm-2 control-label"><span class="glyphicon glyphicon-asterisk" aria-hidden="true"></span></label>
					<div class="col-sm-10">
						<input type="text" class="form-control" id="inputNewPassword4" name="newpassword2" placeholder="再次确认新密码">
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10 loginbtn">
						<button type="submit" class="btn btn-primary btn-sm">确认</button>
						<button type="reset" class="btn btn-default btn-sm">重置</button>
						<input class="btn btn-default btn-sm" type="button" value="返回" id="return"/>
					</div>
				</div>
			</div>

			<h3 style="color: red">${requestScope.msg}</h3>

			<%--隐藏域，将id值传过去--%>
			<input type="hidden" name="id" value="${sessionScope.user.id}">
		</form>
	</div>

</div>

</body>
</html>