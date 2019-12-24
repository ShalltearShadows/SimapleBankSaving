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
<%@ page import="dao.UserDAO" %>
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
        请输入该用户的ID：<input type="text" name="uid" required><br>
        请输入该用户的密码：<input type="password" name="pwd" required><br>
        <input type="submit" value="提交">
    </form>
</div>


<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");

    String cid = request.getParameter("cid");
    String uid = request.getParameter("uid");
    String pwd = request.getParameter("pwd");
    Vector<CardBean> cardBeanlist = CardDAO.getCardBeanbyUid(uid);
    cardBeanlist.setSize(2);
    if (cid==null){}
    else if (!UserDAO.chenkLoginByUidandUpwd(uid,pwd)){
        response.sendRedirect("aindex.jsp?flag=8");
    }else if (cid.equals(cardBeanlist.get(0).getCid())) {
        CardDAO.deleteCardandBindingByUidandCid(uid,cid);
        response.sendRedirect("aindex.jsp?flag=11");
    } else if (cid.equals(cardBeanlist.get(1).getCid())){
        CardDAO.deleteCardandBindingByUidandCid(uid,cid);
        response.sendRedirect("aindex.jsp?flag=11");
    }else {
        response.sendRedirect("aindex.jsp?flag=3");
    }
%>


</body>
</html>