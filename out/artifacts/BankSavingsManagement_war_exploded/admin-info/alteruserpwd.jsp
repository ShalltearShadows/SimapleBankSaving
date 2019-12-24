<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 22:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<html>
<head>
    <title>修改用户密码</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<form class="pane" action="alteruserpwd.jsp" method="post">
    请输入用户的ID：<input type="text" name="uid" required>
    请输入修改后的用户密码：<input type="text" name="pwd" required>
    <input class="sub" type="submit" value="确认"/>
</form>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");

    String uid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    if (uid==null||pwd==null){

    }else if (UserDAO.findUserByID(uid)!=null){
        UserDAO.alterUserUpwd(uid,pwd);
        response.sendRedirect("aindex.jsp?flag=1");
    }else {
        response.sendRedirect("aindex.jsp?flag=12");
    }
%>
</body>
</html>

