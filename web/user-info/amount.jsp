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
        <div><h4>银行卡1</h4>
                 卡号：<%=card1.getCid()%></div>
            <div>余额：<%=card1.getAmount()%></div>
        <div><h4>银行卡2</h4>
                 卡号：<%=card2.getCid()%></div>
            <div>余额：<%=card2.getAmount()%></div>
    <%
        } else {
            if (card1!=null){
    %>
                <div><h4>银行卡1</h4>
                         卡号：<%=card1.getCid()%></div>
                    <div>余额：<%=card1.getAmount()%></div>
    <%
            } else if (card2!=null){
    %>
                <div><h4>银行卡2</h4>
                         卡号：<%=card2.getCid()%></div>
                    <div>余额：<%=card2.getAmount()%></div>
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
