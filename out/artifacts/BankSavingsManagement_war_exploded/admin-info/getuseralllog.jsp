<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/25
  Time: 17:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tables.css">
</head>
<body>
<div>
    <form class="form" method="post">
        <span>请输入查询日志的卡号：</span> <input type="text" id="cid" required>
        <input type="button" onclick="ajaxfindall()" value="提交">
    </form>

</div>

<table class="table">
    <tr><th>卡1</th><th>卡2</th><th>操作</th><th>金额</th><th>日期</th></tr>
    <tbody id="text">

    </tbody>
</table>



</body>
</html>
