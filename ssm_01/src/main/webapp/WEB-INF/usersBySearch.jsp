<%--
  Created by IntelliJ IDEA.
  User: 王凯
  Date: 2020/3/12
  Time: 8:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>学生列表</title>

    <style type="text/css">
        table{
            margin-top: 5px;
            margin-left: 10px;
            border: 1px solid;
            width: 800px;
            height: 50px;
            text-align: center;
        }
        th{
            border: 1px solid;
        }
        td{
            border: 1px solid;
        }
        a{
            text-decoration: none;
        }

        .form1{
            display: inline-block;
        }
        .form3{
            display: inline-block;
            padding-left: 100px;
        }
        ul{
            list-style: none;
        }
        ul li{
            display: inline-block;
            border-top: 1px solid;
            border-right: 1px solid;
            border-bottom: 1px solid;
            width: 35px;
            padding-left: 0px;
            float: left;
            text-align: center;
        }
        .one_li{
            border-left: 1px solid;
            width: 55px;
        }
        .last_li{
            width: 55px;
        }
    </style>
</head>
<body>

<form action="/user/selectOne" method="post" class="form1">
    <input type="text" name="uid" value="">
    <input type="submit" value="查询">
</form>
<form action="/user/selectAll" method="post" class="form1">
    <input type="submit" value="取消查询">
</form>
<form action="/user/insertUserForm" method="post" class="form3">
    <input type="submit" value="添加学生">
</form>

<form action="/user/selectByCondition" method="get">
    学生姓名: <input type="text" name="username" value="${sc.username}">
    出生日期: <input type="text" name="startday" value="${sc.startday}" /> -- <input type="text" name="endday" value="${sc.endday}"/>
    职 &nbsp;&nbsp;务: <select name="roleName" class="selectRole">
    <c:forEach items="${roles}" var="role">
        <c:if test="${sc.roleName == ''}">
            <option selected = "selected"></option>
        </c:if>
        <c:if test="${role.roleName == sc.roleName}">
            <option selected = "selected"></option>
            <option selected = "selected" hidden = "hidden">${role.roleName}</option>
        </c:if>
        <option>${role.roleName}</option>
    </c:forEach>
</select>
    职 &nbsp;&nbsp;责:<select name="roleDesc" class="selectRole">
    <c:forEach items="${roles}" var="role">
        <c:if test="${sc.roleDesc == ''}">
            <option selected = "selected"></option>
        </c:if>
        <c:if test="${role.roleDesc == sc.roleDesc}">
            <option selected = "selected"></option>
            <option selected = "selected" hidden = "hidden">${role.roleDesc}</option>
        </c:if>
        <option>${role.roleDesc}</option>
    </c:forEach>
</select>
    <input type="submit" value="查询">
</form>

<table cellspacing="0">
    <thead>
    <tr>
        <td>学生编号</td>
        <td>学生姓名</td>
        <td>出生日期</td>
        <td>性别</td>
        <td>家庭住址</td>
        <td>工资</td>
        <td>职务</td>
        <td>职责</td>
        <td colspan="2">操作</td>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="user" items="${users}" begin="0">
        <tr>
            <th>${user.uid}</th>
            <th>${user.username}</th>
            <th><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${user.birthday}"/></th>
            <th>${user.sex}</th>
            <th>${user.address}</th>
            <th>${user.sal}</th>
            <th>${user.role.roleName}</th>
            <th>${user.role.roleDesc}</th>
            <th><a href="/user/updateUserForm?uid=${user.uid}">修改信息</a> </th>
            <th><a href="/user/deleteUser?uid=${user.uid}">删 除</a> </th>
        </tr>
    </c:forEach>

    </tbody>
</table>

    一共 ${length} 条记录-

<%--&lt;%&ndash;显示分页信息&ndash;%&gt;--%>
<%--<div class="row">--%>
    <%--&lt;%&ndash;文字提示信息&ndash;%&gt;--%>
    <%--<div class="col-md-6">--%>
        <%--当前第 ${pageInfo1.pageNum} 页 &nbsp;&nbsp;总共 ${pageInfo1.pages} 页 &nbsp;&nbsp;一共 ${pageInfo1.total} 条记录--%>
    <%--</div>--%>

    <%--&lt;%&ndash;分页&ndash;%&gt;--%>
    <%--<div class="col-md-6">--%>
        <%--<nav aria-label="Page navigation">--%>
            <%--<ul class="pagination">--%>
                <%--<li class="one_li"><a href="/user/selectByCondition?page=1&searchCondition=${sc}">首页</a></li>--%>

                <%--&lt;%&ndash;上一页&ndash;%&gt;--%>
                <%--<li>--%>
                    <%--<c:if test="${pageInfo1.hasPreviousPage}">--%>
                        <%--<a href="/user/selectByCondition?page=${pageInfo1.pageNum-1}&searchCondition=${sc}" aria-label="Previous">--%>
                            <%--<span aria-hidden="true"><<</span>--%>
                        <%--</a>--%>
                    <%--</c:if>--%>
                <%--</li>--%>

                <%--&lt;%&ndash;循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接&ndash;%&gt;--%>
                <%--<c:forEach items="${pageInfo1.navigatepageNums}" var="page_num">--%>
                    <%--<c:if test="${page_num == pageInfo1.pageNum}">--%>
                        <%--<li class="active"><a href="#">${page_num}</a></li>--%>
                    <%--</c:if>--%>
                    <%--<c:if test="${page_num != pageInfo1.pageNum}">--%>
                        <%--<li><a href="/user/selectByCondition?page=${page_num}&searchCondition=${sc}">${page_num}</a></li>--%>
                    <%--</c:if>--%>
                <%--</c:forEach>--%>

                <%--&lt;%&ndash;下一页&ndash;%&gt;--%>
                <%--<li>--%>
                    <%--<c:if test="${pageInfo1.hasNextPage}">--%>
                        <%--<a href="/user/selectByCondition?page=${pageInfo1.pageNum+1}&searchCondition=${sc}" aria-label="Next">--%>
                            <%--<span aria-hidden="true">>></span>--%>
                        <%--</a>--%>
                    <%--</c:if>--%>
                <%--</li>--%>

                <%--&lt;%&ndash;尾页&ndash;%&gt;--%>
                <%--<li class="last_li"><a href="/user/selectByCondition?page=${pageInfo1.pages}&searchCondition=${sc}">尾页</a></li>--%>
            <%--</ul>--%>
        <%--</nav>--%>
    <%--</div>--%>
<%--</div>--%>
</body>
</html>
