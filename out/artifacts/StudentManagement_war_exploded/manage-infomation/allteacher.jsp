<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 15:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="shortcut icon" href="#" />

    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">

</head>
<body>
<div>
    <button class="gbtn" onclick="ajaxfindallteacher()">查看教师信息</button>
    <table>
        <tbody id="ttext">
        </tbody>
    </table>
</div>


</body>
</html>
