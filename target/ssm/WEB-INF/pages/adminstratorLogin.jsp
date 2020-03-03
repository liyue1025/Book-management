<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <link rel="stylesheet" type="text/css" href="../../statics/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../../statics/css/top.css">
	
<link rel="stylesheet" type="text/css" href="../../statics/css/login.css">
<title>管理员登入</title>
</head>
<body>
	<nav class="navbar navbar-default">
    <div class="container-fluid">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">管理员登入</span>

            </button>
            <a class="navbar-brand" href="#">网上书城后台管理</a>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
  

            </ul>
           
            <ul class="nav navbar-nav navbar-right">
               
            </ul>
        </div>
    </div>
</nav>
	
	<form class="form-horizontal" action="/admin/login" method="post">
	     <div class="login">
			  <div class="form-group">
			    <label for="inputEmail3" class="col-sm-2 control-label"><img alt="用户" src="../../statics/images/icon_user.png"></label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" id="inputEmail3" name="adminname" placeholder="用户名">
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputPassword3" class="col-sm-2 control-label"><img alt="密码" src="../../statics/images/icon_password.png"></label>
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
			  <div class="form-group setregister">
			    <div class="col-sm-offset-2 col-sm-10 loginbtn">
			     	
			    </div>
			  </div>
	  	</div>
	</form>

	<h3 style="color: red" class="text-center">${requestScope.msg}</h3>

</body>
</html>