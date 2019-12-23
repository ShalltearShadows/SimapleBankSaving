<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 22:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane" id="alterPwd">
    <form action="${pageContext.request.contextPath}/user-info/alterpwd.jsp" method="post">
        <p>新密码：</p><input id="sss" name="pwd" type="password" required/>
        <p>再次输入：</p><input  name="spwd" type="password" required/>
        <input class="sub" type="submit" id="alterPwdSurebtn"/>
    </form>
</div>
<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");
    String a = request.getParameter("pwd");
    String b = request.getParameter("spwd");
    if (!(a==null||a.equals(""))) {
        if (a.equals(b)) {
            user.setUpwd(a);
            session.setAttribute("user", user);
            UserDAO.alterUserUpwd(user.getUid(),a);
            response.sendRedirect("index.jsp?flag=1");
        }else {
            response.sendRedirect("index.jsp?flag=4");
        }
    }
%>
</body>
</html>