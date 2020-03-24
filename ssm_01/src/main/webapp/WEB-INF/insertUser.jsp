<%--
  Created by IntelliJ IDEA.
  User: 王凯
  Date: 2020/3/10
  Time: 22:42
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>添加学生页面</title>
</head>
<body>
    <form action="/user/insertUser" method="post">
        学生姓名: <input type="text" name="username" value=""><br/><br/>
        出生日期: <input type="datetime-local" name="birthday" value=""><br/><br/>
        性 &nbsp;&nbsp;别: <input type="text" name="sex" value=""><br/><br/>
        家庭住址: <input type="text" name="address" value=""><br/><br/>
        工 &nbsp;&nbsp;资: <input type="text" name="sal" value=""><br/><br/>
        职 &nbsp;&nbsp;务: <input type="text" list="roleNames" name="role.roleName"><br/><br/>
                             <datalist id="roleNames">
                                 <c:forEach items="${roles}" var="role">
                                     <option>${role.roleName}</option>
                                 </c:forEach>
                             </datalist>
        职 &nbsp;&nbsp;责:<input type="text" name="role.roleDesc" list="roleDescs"><br/><br/>
                            <datalist id="roleDescs">
                                <c:forEach items="${roles}" var="role">
                                    <option>${role.roleDesc}</option>
                                </c:forEach>
                            </datalist>
        <input type="submit" value="保存">
    </form>
</body>
</html>
