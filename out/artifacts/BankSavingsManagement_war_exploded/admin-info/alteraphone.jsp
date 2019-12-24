<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.AdminDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        String aphone = admin.getAphone();
    %>
</head>
<body>
<div class="pane" id="alterCname">
    <form action="alteraphone.jsp" method="post">
        <p >原电话：<%=aphone%></p>
        <p >新电话：</p>
        <input name="aphone" type="text" required/>
        <input class="sub" type="submit" />
    </form>

</div>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");
    String a = request.getParameter("aphone");
    if (!(a==null||a.equals(""))) {
        admin.setAphone(a);
        session.setAttribute("admin",admin);
        AdminDAO.alterAdminPhone(admin.getAid(),a);
        response.sendRedirect("aindex.jsp?flag=1");
    }
%>
</body>
</html>

