<%--
    用户信息页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<html lang="zh-CN">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <title>用户列表</title>

    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="js/jquery-3.4.1.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="js/bootstrap.min.js"></script>
    <style>
        th,td{
            text-align: center;
        }
        table{
            background-color: rgba(236, 242, 239, 0.4);
        }
    </style>
    <script>
        // 删除提示
        function deleteUser(id) {
            if(confirm("确定删除吗？")){
                location.href = "${pageContext.request.contextPath}/deleteUserServlet?id="+id;
            }
        }

        $(function () {
            // 重置
            $("#reset").click(function () {
                location.href = "${pageContext.request.contextPath}/userListServlet";
            });
        })

    </script>
</head>
<body >
    <div style="margin-top: 10px; margin-left: 10px">
        <a class="btn btn-default" href="${pageContext.request.contextPath}/logoffServlet"><span class="glyphicon glyphicon-menu-left" aria-hidden="true"></span>退出</a>
    </div>

<div class="container" id="whole" >
    <h2 style="text-align: center; margin-bottom: 20px; margin-top: 30px;"><strong>用户信息列表</strong></h2>

    <div style="float: left;">
        <form class="form-inline" action="${pageContext.request.contextPath}/userListServlet" method="post">
            <div class="form-group">
                <label for="disabledTextInput">ID</label>
                <input type="text" id="disabledTextInput" class="form-control " placeholder="ID查询" name="id" value="${requestScope.map.id[0]}" >
            </div>
            <div class="form-group">
                <label for="disabledTextInput2" >用户名</label>
                <input type="text" id="disabledTextInput2" class="form-control " placeholder="用户名查询" name="username" value="${requestScope.map.username[0]}" >
            </div>
            <button type="submit" class="btn btn-default btn-lg"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
            <button type="button" class="btn btn-default btn-lg" aria-label="Left Align" id="reset">
                <span class="glyphicon glyphicon-repeat" aria-hidden="true"></span>
            </button>
            <%--<a href="${pageContext.request.contextPath}/userListServlet"><span class="glyphicon glyphicon-repeat" aria-hidden="true"></span></a>--%>
        </form>
    </div>


    <form action="${pageContext.request.contextPath}/userListServlet">


        <table class="table table-hover table-bordered">

            <tr>
                <th>ID</th>
                <th>用户名</th>
                <th>密码</th>
                <th>昵称</th>
                <th>邮箱</th>
                <th>地址</th>
                <th>操作</th>
            </tr>

            <c:forEach items="${requestScope.page.list}" var="book" varStatus="s">
                <tr>
                    <td>${book.id}</td>
                    <td>${book.username}</td>
                    <td>${book.password}</td>
                    <td>${book.nikename}</td>
                    <td>${book.email}</td>
                    <td>${book.address}</td>
                    <td>
                        <a class="btn btn-default btn-warning" href="${pageContext.request.contextPath}/forwardServlet?id=${book.id}">修改</a>&nbsp;
                        <a class="btn btn-default btn-danger" href="javascript:deleteUser(${book.id});">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>

        <%--分页条--%>
        <nav aria-label="Page navigation">
            <ul class="pagination">

                <%--上一页--%>
                <%--不是第一页--%>
                <c:if test="${requestScope.page.pageNumber - 1 > 0}">
                    <li>
                        <a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${requestScope.page.pageNumber-1}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--是第一页--%>
                <c:if test="${requestScope.page.pageNumber - 1 <= 0}">
                    <li class="disabled">
                           <a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${requestScope.page.pageNumber}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}">
                            <span aria-hidden="true">&laquo;</span>
                        </a>
                    </li>
                </c:if>

                    <c:forEach begin="1" end="${requestScope.page.pageCount}" var="i">
                    <%--判断是否激活状态--%>
                    <c:if test="${requestScope.page.pageNumber == i}">
                        <li class="active"><a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${i}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}">${i}</a></li>
                    </c:if>
                    <c:if test="${requestScope.page.pageNumber != i}">
                        <li><a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${i}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}">${i}</a></li>
                    </c:if>
                </c:forEach>

                <%--下一页--%>
                <%--不是最后一页--%>
                <c:if test="${requestScope.page.pageNumber < requestScope.page.pageCount}">
                    <li>
                        <a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${requestScope.page.pageNumber+1}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>
                <%--是最后一页--%>
                <c:if test="${requestScope.page.pageNumber >= requestScope.page.pageCount}">
                    <li class="disabled">
                        <a href="${pageContext.request.contextPath}/userListServlet?pageNumber=${requestScope.page.pageNumber}&username=${requestScope.map.username[0]}&id=${requestScope.map.id[0]}" aria-label="Next">
                            <span aria-hidden="true">&raquo;</span>
                        </a>
                    </li>
                </c:if>


            </ul>
        </nav>

        <span ><h4>一共${requestScope.page.userCount}条记录，${requestScope.page.pageCount}页</h4></span>



    </form>
</div>
</body>
</html>
