<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 18:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addstu.css"></head>
<body>
    <div class="pane">
        <form action="${pageContext.request.contextPath}/RegisterServlet" method="post">
            <div class="ins"><span class="insp">姓名</span><input type="text" name="uname" required></div>
            <div class="ins"><span class="insp">电话</span><input type="text" name="phone" required></div>
            <input id="sub" type="submit" value="添加">
        </form>
    </div>
</body>
</html>