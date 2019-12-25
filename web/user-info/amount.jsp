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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/tables.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="cont">


    <%
        if (user.getCardBean1()!=null&&user.getCardBean1().getCid()==null){
            user.setCardBean1(null);
        }
        if (user.getCardBean2()!=null&&user.getCardBean2().getCid()==null){
            user.setCardBean2(null);
        }

        CardBean card1 = user.getCardBean1();
        CardBean card2 = user.getCardBean2();

        if (card1!=null&&card2!=null){
    %>
        <table>
            <tr><th>银行卡号</th><th>余额</th><th>开卡日期</th></tr>
            <tr><td><%=card1.getCid()%></td><td><%=card1.getAmount()%></td><td><%=card1.getDate()%></td></tr>
            <tr><td><%=card2.getCid()%></td><td><%=card2.getAmount()%></td><td><%=card2.getDate()%></td></tr>
        </table>


    <%
        } else {
            if (card1!=null){
    %>
    <table class="table">
        <tr><td>银行卡号</td><td>余额</td><td>开卡日期</td></tr>
        <tr><td><%=card1.getCid()%></td><td><%=card1.getAmount()%></td><td><%=card1.getDate()%></td></tr>
    </table>
    <%
            } else if (card2!=null){
    %>
    <table>
        <tr><td>银行卡号</td><td>余额</td><td>开卡日期</td></tr>
        <tr><td><%=card2.getCid()%></td><td><%=card2.getAmount()%></td><td><%=card2.getDate()%></td></tr>
    </table>
    <%
            }
            else {%>
                <p>您现在还没有银行卡，请先申请注册银行卡！</p>
            <%}
        }
    %>

</div>

</body>
</html>
