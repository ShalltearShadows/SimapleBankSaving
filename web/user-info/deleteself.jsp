<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/23
  Time: 21:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="data.CardBean" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>注销账号</title>
</head>
<body>
<p>请输入您的账号和密码，以便我们核对您的信息</p>
<form class="pane" action="deleteself.jsp" method="post">
    账号：<input type="text" name="uid" required>
    密码：<input type="password" name="upwd" required>
    <input type="submit" value="提交">
</form>

<%
    String uid = request.getParameter("uid");
    String upwd = request.getParameter("upwd");
    if (uid==null||upwd==null){

    }else if (user.getUid().equals(uid)&&user.getUpwd().equals(upwd)){

        Vector<CardBean> cardBeans = CardDAO.getCardBeanbyUid(uid);
        cardBeans.setSize(2);
        if (cardBeans.get(0)!=null) {
            CardDAO.deleteCardandBindingByUidandCid(uid, cardBeans.get(0).getCid());
        }else if (cardBeans.get(1)!=null){
            CardDAO.deleteCardandBindingByUidandCid(uid,cardBeans.get(1).getCid());
        }
        UserDAO.deleteUserByUid(uid);

        response.sendRedirect("welcome.jsp?flag=1");
    }else {
        response.sendRedirect("aindex.jsp?flag=8");
    }
%>


</body>
</html>
