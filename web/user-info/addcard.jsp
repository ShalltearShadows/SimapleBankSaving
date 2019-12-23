<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/22
  Time: 13:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="data.CardBean" %>
<%@ page import="java.sql.Date" %>
<%@ page import="dao.CardDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>添加银行卡</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>

    <div>
        <h3>
            提示：每一位用户至多可拥有两张银行卡，请在申请银行卡之前检查自己的银行卡数量。
        </h3>
    <%
        CardBean card1 = user.getCardBean1();
        CardBean card2 = user.getCardBean2();

        if (card1!=null&&card2!=null){
    %>
        <p class="pane">尊敬的用户，对不起，您已经拥有两张银行卡，不可以进行申请操作！！！</p>
    <% } else {%>
            <p>请输入您的账号和密码，以便我们核对您的信息</p>
            <form class="pane" action="addcard.jsp" method="post">
                账号：<input type="text" name="uid" required>
                密码：<input type="password" name="upwd" required>
                <input type="submit" value="提交">
            </form>
    <%}%>
    </div>
<%
    String n = request.getParameter("uid");
    String p = request.getParameter("upwd");
    if(user.getUid().equals(n)&&user.getUpwd().equals(p)){
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
        CardDAO.addCardbyCardBean(c);
        CardDAO.addBindingByUidandCid(user,c.getCid());
        if (user.getCardBean1()==null){
            user.setCardBean1(c);
        }else if (user.getCardBean2()==null){
            user.setCardBean2(c);
        }

        response.sendRedirect("index.jsp?flag=9");

    }else if (n!=null||p!=null){
        response.sendRedirect("index.jsp?flag=8");
    }
%>


</body>
</html>
