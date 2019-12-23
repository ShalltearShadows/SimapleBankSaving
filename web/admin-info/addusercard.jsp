<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="data.CardBean" %>
<%@ page import="java.sql.Date" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="data.UserBean" %>
<%@ page import="dao.UserDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <title>添加银行卡</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>

<div>

    <form class="pane" action="addcard.jsp" method="post">
        请输入用户的账号：<input type="text" name="uid" required>
        <input type="submit" value="提交">
    </form>
</div>
<%
    String uid = request.getParameter("uid");
//    String p = request.getParameter("upwd");

    Vector<CardBean> cardBeans = CardDAO.getCardBeanbyUid(uid);
    int size = cardBeans.size();

    if(size!=2){
        String number="4578";
        for(int i=0;i<8;i++){
            int num = (int)(Math.random()*10);
            number+=""+num;
        }
        CardBean c = new CardBean();
        c.setCid(number);
        c.setAmount("0");
        java.util.Date d = new java.util.Date();
        Date sqldate = new Date(d.getTime());
        c.setDate(sqldate);
        UserBean user = UserDAO.findUserByID(uid);
        CardDAO.addCardbyCardBean(c);
        CardDAO.addBindingByUidandCid(user,c.getCid());

        response.sendRedirect("aindex.jsp?flag=9");

    }else if (uid!=null){
        response.sendRedirect("aindex.jsp?flag=3");
    }
%>


</body>
</html>
