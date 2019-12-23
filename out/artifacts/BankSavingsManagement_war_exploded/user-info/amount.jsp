<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/19
  Time: 11:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.CardBean" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>余额</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane">
    <%
        CardBean card1 = user.getCardBean1();
        CardBean card2 = user.getCardBean2();
        if (card1!=null&&card2!=null){
    %>
        <div><h3>银行卡1</h3>
                 卡号：<%=card1.getCid()%></div>
            <div>余额：<%=card1.getAmount()%></div>
        <div><h3>银行卡2</h3>
                 卡号：<%=card2.getCid()%></div>
            <div>余额：<%=card2.getAmount()%></div>
    <%
        } else {
            if (card1!=null){
    %>
                <div><h3>银行卡1</h3>
                         卡号：<%=card1.getCid()%></div>
                    <div>余额：<%=card1.getAmount()%></div>
    <%
            } else if (card2!=null){
    %>
                <div><h3>银行卡2</h3>
                         卡号：<%=card2.getCid()%></div>
                    <div>余额：<%=card2.getAmount()%></div>
    <%
            }
        }
    %>

</div>

</body>
</html>
