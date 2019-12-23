<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.AdminDAO" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <title>注销账号</title>
</head>
<body>
    <p>请输入您的账号和密码，以便我们核对您的信息</p>
    <form class="pane" action="deleteself.jsp" method="post">
        账号：<input type="text" name="aid" required>
        密码：<input type="password" name="apwd" required>
        <input type="submit" value="提交">
    </form>

    <%
        String aid = request.getParameter("aid");
        String apwd = request.getParameter("apwd");
        if (aid==null||apwd==null){

        }else if (admin.getAid().equals(aid)&&admin.getApwd().equals(apwd)){
            AdminDAO.deleteAdminByUid(aid);
            response.sendRedirect("welcome.jsp?flag=1");
        }else {
            response.sendRedirect("aindex.jsp?flag=8");
        }
    %>


</body>
</html>
