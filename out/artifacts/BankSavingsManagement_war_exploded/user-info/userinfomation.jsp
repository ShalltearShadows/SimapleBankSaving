<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 10:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>

<html>
<head>
    <%
        String uid = user.getUid();
        String uname = user.getUname();
        String phone = user.getPhone();
    %>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>

</head>
<body>
<div  id="infomation">
    <table>
        <tr> <td>账号</td> <td class="con"><%=uid%></td> </tr>
        <tr> <td>姓名</td> <td class="con"><%=uname%></td> </tr>
        <tr> <td>电话</td> <td class="con"><%=phone%></td> </tr>
    </table>
</div>
</body>
</html>
