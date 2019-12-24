<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>

<html>
<head>
    <%
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        String aid = admin.getAid();
        String aname = admin.getAname();
        String aphone = admin.getAphone();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>

</head>
<body>
<div  id="infomation">
    <table>
        <tr> <td>账号</td> <td class="con"><%=aid%></td> </tr>
        <tr> <td>姓名</td> <td class="con"><%=aname%></td> </tr>
        <tr> <td>电话</td> <td class="con"><%=aphone%></td> </tr>
    </table>
</div>
</body>
</html>

