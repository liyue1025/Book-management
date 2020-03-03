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
    <title>修改商品信息</title>

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

        // 删除提示
        function deleteBook(id) {
            if(confirm("确定删除吗？")){
                location.href = "/admin/deleteBook?id="+id;
            }
        }

    </script>
</head>
<html>
<body>

    <div class="container" id="div" style="width: 600px; margin-top: 40px">

        <h3 style="text-align: center; margin-bottom: 20px;"><strong>管理商品信息</strong></h3>

        <form class="form-horizontal" action="/admin/alterBook" method="post">

            <div class="form-group" >
                <label for="input12" class="col-sm-2 control-label">商品名称</label>
                <div class="col-sm-10">
                    <input name="name" type="text" class="form-control input-lg" id="input12" value="${book.name}">
                </div>
            </div>

            <div class="form-group" >
                <label for="input122" class="col-sm-2 control-label">商品价格</label>
                <div class="col-sm-10">
                    <input name="price" type="text" class="form-control input-lg" id="input122" value="${book.price}">
                </div>
            </div>

             <div class="form-group" >
                <label for="input1" class="col-sm-2 control-label">商品分类</label>
                <div class="col-sm-10">
                    <input name="category" type="text" class="form-control input-lg" id="input1" value="${book.category}">
                </div>
             </div>

            <div class="form-group">
                <label for="input4" class="col-sm-2 control-label" style="">商品简介</label>
                <div class="col-sm-10">
                    <input name="info" type="text" class="form-control input-lg" id="input4" value="${book.info}">
                </div>
            </div>

            <div class="form-group">
                <label for="input6" class="col-sm-2 control-label" style="">进货</label>
                <div class="col-sm-10">
                    <input name="stock" type="text" class="form-control input-lg" id="input6">
                </div>
            </div>

            <div class="form-group" style="margin-left: 150px">
                <div class="col-sm-offset-2 col-sm-10">
                    <input class="btn btn-primary" type="submit" value="提交"  />
                    <input class="btn btn-default" type="button" value="返回" id="return"/>
                    <a class="btn btn-default btn-danger" href="javascript:deleteBook(${book.id});">删除该商品</a>
                </div>
            </div>

            <%--隐藏域，将id值传过去--%>
            <input type="hidden" name="id" value="${book.id}">

        </form>
        <h3 style="color:red">${requestScope.msg}</h3>
    </div>

</body>
</html>
