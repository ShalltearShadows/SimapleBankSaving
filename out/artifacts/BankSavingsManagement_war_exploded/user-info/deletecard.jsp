<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/22
  Time: 15:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="data.CardBean" %>
<%@ page import="dao.CardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>删除银行卡</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
    <div class="pane">
        <form action="deletecard.jsp" onsubmit="return Sure();" method="post">
            请输入您要删除的卡号：<input type="text" name="cid" required><br>
            <input type="submit" value="提交">
        </form>
    </div>


    <%
        String cid = request.getParameter("cid");
        CardBean c1 = user.getCardBean1();
        CardBean c2 = user.getCardBean2();
        if (cid==null){}
        else if (c1.getCid().equals(cid)) {
            CardDAO.deleteCardandBindingByUidandCid(user.getUid(),cid);
            user.setCardBean1(null);
            response.sendRedirect("index.jsp?flag=11");
        }else if (c2.getCid().equals(cid)){
            CardDAO.deleteCardandBindingByUidandCid(user.getUid(),cid);
            user.setCardBean2(null);
            response.sendRedirect("index.jsp?flag=11");
        }
        else {
            response.sendRedirect("index.jsp?flag=3");
        }
    %>


</body>
</html>
