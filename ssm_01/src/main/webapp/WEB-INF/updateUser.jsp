<%@ page import="com.wangkai.pojo.User" %>
<%@ page import="org.joda.time.format.DateTimeFormat" %>
<%@ page import="org.joda.time.LocalDateTime" %>
<%@ page import="java.util.Date" %>
<%@ page import="org.joda.time.DateTime" %>
<%@ page import="org.joda.time.LocalDate" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 王凯
  Date: 2020/3/10
  Time: 23:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>修改学生信息</title>
    <script type="text/javascript">
        $(".selectRole").removeAttr("disabled")
    </script>
</head>
<body>
    <%--<%--%>
        <%--request.setCharacterEncoding("utf-8");--%>
        <%--String uid = request.getParameter("uid");--%>
        <%--String username = request.getParameter("username");--%>
        <%--String birthday = request.getParameter("birthday");--%>
        <%--String sex = request.getParameter("sex");--%>
        <%--String address = request.getParameter("address");--%>
        <%--String sal = request.getParameter("sal");--%>
    <%--%>--%>
    <form action="/user/updateUser" method="post">
        学生学号: <input type="text" name="uid" value="${user.uid}"><br/><br/>
        学生姓名: <input type="text" name="username" value="${user.username}"><br/><br/>
        出生日期: <input type="datetime-local" name="birthday" value="${user.birthday}"><br/><br/>
        性 &nbsp;&nbsp;别: <input type="text" name="sex" value="${user.sex}"><br/><br/>
        家庭住址: <input type="text" name="address" value="${user.address}"><br/><br/>
        工 &nbsp;&nbsp;资: <input type="text" name="sal" value="${user.sal}"><br/><br/>
        职 &nbsp;&nbsp;务: <select name="role.roleName" class="selectRole">
        <c:forEach items="${roles}" var="role">
                <c:if test="${role.roleName == user.role.roleName}">
                    <option selected = "selected" hidden = "hidden">${role.roleName}</option>
                </c:if>
                <option>${role.roleName}</option>
            </c:forEach>
        </select>
        职 &nbsp;&nbsp;责:<select name="role.roleDesc" class="selectRole">
            <c:forEach items="${roles}" var="role">
                <c:if test="${role.roleDesc == user.role.roleDesc}">
                    <option selected = "selected" hidden = "hidden">${role.roleDesc}</option>
                </c:if>
                <option>${role.roleDesc}</option>
            </c:forEach>
        </select>
        <input type="submit" value="保存">
    </form>
</body>
</html>
