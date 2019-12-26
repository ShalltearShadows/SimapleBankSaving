<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/26
  Time: 12:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tables.css">

</head>
<body>
<form id="dateform">

    <span>请选择日期：</span><input type="date" name="first"/>至<input type="date" name="second"/>
    <span>请输入查询日志的卡号：</span> <input type="text" name="cid" required>
    <input type="button" onclick="ajaxselect()" value="提交">
</form>
<table class="table">
    <tr><th>卡1</th><th>卡2</th><th>操作</th><th>金额</th><th>日期</th></tr>
    <tbody id="logtext">

    </tbody>
</table>
</body>
</html>
