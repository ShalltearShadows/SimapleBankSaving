<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/13
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="java.util.Vector" %>
<%@ page import="data.CardBean" %>
<%@ page import="data.UserBean" %>
<jsp:useBean id="admin" class="data.AdminBean" scope="session"/>
<html>
<head>
    <title>注销用户账号</title>
</head>
<body>
<p>请输入用户的账号和密码，以便我们核对该用户的信息</p>
<form class="pane" action="deleteself.jsp" method="post">
    账号：<input type="text" name="uid" required>
    密码：<input type="password" name="upwd" required>
    <input type="submit" value="提交">
</form>

<%
    String uid = request.getParameter("uid");
    String upwd = request.getParameter("upwd");
    UserBean user = UserDAO.findUserByID(uid);
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
