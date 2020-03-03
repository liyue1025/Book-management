<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html lang="zh-CN">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
	<title>登录</title>

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
            <h1>欢迎登录网上书城！ </h1><h3><small>在这里选购你喜欢的图书</small></h3>
        </div>

        <div style="margin-top: 5%">
            <form class="form-horizontal" action="/user/login" method="post">
                <div class="login">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-user" aria-hidden="true"></span></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="inputEmail3" name="username" placeholder="用户名">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label"><span class="glyphicon glyphicon-lock" aria-hidden="true"></span></label>
                        <div class="col-sm-10">
                            <input type="password" class="form-control" id="inputPassword3" name="password" placeholder="密码">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10 loginbtn">
                            <button type="submit" class="btn btn-default btn-sm">登录</button>
                            <button type="reset" class="btn btn-default btn-sm">重置</button>
                        </div>
                    </div>

                    <div style="margin-left: 150px">
                        <h3 style="color: red">${requestScope.msg}</h3>
                    </div>

                    <div class="form-group setregister">
                        <div class="col-sm-offset-2 col-sm-10 loginbtn">
                            <img alt="尴尬" src="../../statics/images/icon_gangaface.png">&nbsp;还没有账户？<a href="/action/goRegister">点击注册一个吧！</a>
                        </div>
                    </div>
                </div>
            </form>
        </div>

	</div>


</body>
</html>