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
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>

<form class="pane" action="deleteuser.jsp" method="post">
    <p>请输入用户的账号和密码，以便我们核对该用户的信息</p>
    账号：<input type="text" name="uid" required>
    密码：<input type="password" name="upwd" required>
    <input type="submit" value="删除">
</form>

<%
    response.setContentType("text/html;charset=UTF-8");
    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("UTF-8");

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
        response.sendRedirect("aindex.jsp?flag=11");
    }else {
        response.sendRedirect("aindex.jsp?flag=8");
    }
%>


</body>
</html>
