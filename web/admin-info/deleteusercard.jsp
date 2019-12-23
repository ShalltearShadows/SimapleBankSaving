<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 20:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="data.CardBean" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <title>删除银行卡</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane">
    <form action="deleteusercard.jsp" onsubmit="return Sure();" method="post">
        请输入您要删除的卡号：<input type="text" name="cid" required><br>
        &nbsp;&nbsp;请输入该用户的ID：<input type="text" name="uid" required><br>
        <input type="submit" value="提交">
    </form>
</div>


<%
    String cid = request.getParameter("cid");
    String uid = request.getParameter("uid");
    Vector<CardBean> cardBeanlist = CardDAO.getCardBeanbyUid(uid);
    cardBeanlist.setSize(2);
    if (cid==null){}
    else if (cid.equals(cardBeanlist.get(0).getCid())) {
        CardDAO.deleteCardandBindingByUidandCid(uid,cid);
        response.sendRedirect("index.jsp?flag=11");
    } else if (cid.equals(cardBeanlist.get(1).getCid())){
        CardDAO.deleteCardandBindingByUidandCid(uid,cid);
        response.sendRedirect("index.jsp?flag=11");
    }else {
        response.sendRedirect("index.jsp?flag=3");
    }
%>


</body>
</html>