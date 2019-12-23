<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 22:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<html>
<head>
    <title>修改用户电话</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<form class="pane" action="alterusername.jsp" method="post">
    请输入用户的ID：<input type="text" name="uid" required>
    请输入修改后的用户电话：<input type="text" name="phone" required>
</form>

<%
    String uid = request.getParameter("uid");
    String phone = request.getParameter("phone");
    if (uid==null||phone==null){

    }else if (UserDAO.findUserByID(uid)!=null){
        UserDAO.alterUserPhone(uid,phone);
        response.sendRedirect("aindex.jsp?flag=1");
    }else {
        response.sendRedirect("aindex.jsp?flag=12");
    }
%>
</body>
</html>
