<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 16:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="data.CardBean" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>存款</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane">
    <form action="${pageContext.request.contextPath}/user-info/deposit.jsp" method="post">
        <div>请输入存款卡号：</div>
        <input type="text" name="card" required/>
        <div>请输入金额：</div>
        <input type="text" name="amount" required/>
        <input type="submit" value="提交">
    </form>

</div>
    <%
        String card = request.getParameter("card");
        String amount = request.getParameter("amount");
        if (user.getCardBean1()==null){
            user.setCardBean1(new CardBean());
        }
        if (user.getCardBean2()==null){
            user.setCardBean2(new CardBean());
        }

        if (card==null||amount==null){

        }else if (user.getCardBean1().getCid().equals(card)){
            int m = Integer.parseInt(user.getCardBean1().getAmount());
            int n = Integer.parseInt(amount)+m;
            user.getCardBean1().setAmount(""+n);
            CardDAO.alterAmountByCid(user.getCardBean1().getCid(),""+n);
            response.sendRedirect("index.jsp?flag=2");
        }else if (user.getCardBean2().getCid().equals(card)){
            int m = Integer.parseInt(user.getCardBean2().getAmount());
            int n = Integer.parseInt(amount)+m;
            user.getCardBean2().setAmount(""+n);
            CardDAO.alterAmountByCid(user.getCardBean2().getCid(),""+n);
            response.sendRedirect("index.jsp?flag=2");
        }else {
            response.sendRedirect("index.jsp?flag=3");
        }
    %>
</body>
</html>
