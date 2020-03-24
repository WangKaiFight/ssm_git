<%--
  Created by IntelliJ IDEA.
  User: 王凯
  Date: 2020/3/10
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>用户界面</title>

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

    <form action="/user/selectByCondition" method="post">
        学生姓名: <input type="text" name="username" value="">
        出生日期: <input type="text" name="startday"/> -- <input type="text" name="endday"/>
        职 &nbsp;&nbsp;务: <input type="text" list="roleNames" name="roleName"><br/><br/>
                            <datalist id="roleNames">
                                <c:forEach items="${roles}" var="role">
                                    <option>${role.roleName}</option>
                                </c:forEach>
                            </datalist>
        职 &nbsp;&nbsp;责: <input type="text" name="roleDesc" list="roleDescs"><br/><br/>
                            <datalist id="roleDescs">
                                <c:forEach items="${roles}" var="role">
                                    <option>${role.roleDesc}</option>
                                </c:forEach>
                            </datalist>
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

        <c:if test="${user != null}">
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
        </c:if>

        </tbody>
    </table>


    <%--显示分页信息--%>
    <div class="row">
        <%--文字提示信息--%>
        <div class="col-md-6">
            当前第 ${pageInfo.pageNum} 页 &nbsp;&nbsp;总共 ${pageInfo.pages} 页 &nbsp;&nbsp;一共 ${pageInfo.total} 条记录
        </div>

        <%--分页--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                    <li class="one_li"><a href="/user/selectAll?page=1">首页</a></li>

                    <%--上一页--%>
                    <li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <a href="/user/selectAll?page=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true"><<</span>
                            </a>
                        </c:if>
                    </li>

                    <%--循环遍历连续显示的页面，若是当前页就高亮显示，并且没有链接--%>
                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${page_num == pageInfo.pageNum}">
                            <li class="active"><a href="#">${page_num}</a></li>
                        </c:if>
                        <c:if test="${page_num != pageInfo.pageNum}">
                            <li><a href="/user/selectAll?page=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <%--下一页--%>
                    <li>
                        <c:if test="${pageInfo.hasNextPage}">
                            <a href="/user/selectAll?page=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">>></span>
                            </a>
                        </c:if>
                    </li>

                    <%--尾页--%>
                    <li class="last_li"><a href="/user/selectAll?page=${pageInfo.pages}">尾页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</body>
</html>
