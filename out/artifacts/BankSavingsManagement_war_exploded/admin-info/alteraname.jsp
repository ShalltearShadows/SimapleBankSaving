<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:16
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
        String aname = admin.getAname();
    %>
</head>
<body>
<div class="pane" id="alterCname">
    <form action="alteraname.jsp" method="post">
        <p >原姓名：<%=aname%></p>
        <p >新姓名：</p>
        <input name="aname" type="text" required/>
        <input class="sub" type="submit" value="确认"/>
    </form>

</div>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");
    String a = request.getParameter("aname");
    if (!(a==null||a.equals(""))) {
        admin.setAname(a);
        session.setAttribute("admin",admin);
        AdminDAO.alterAdminAname(admin.getAid(),a);
        response.sendRedirect("aindex.jsp?flag=1");
    }
%>
</body>
</html>
