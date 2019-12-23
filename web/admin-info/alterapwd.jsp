<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane" id="alterPwd">
    <form action="alterapwd.jsp" method="post">
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
            admin.setApwd(a);
            session.setAttribute("admin", admin);
            UserDAO.alterUserUpwd(admin.getAid(),a);
            response.sendRedirect("aindex.jsp?flag=1");
        }else {
            response.sendRedirect("aindex.jsp?flag=4");
        }
    }
%>
</body>
</html>
