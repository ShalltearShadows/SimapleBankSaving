<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/21
  Time: 17:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="data.CardBean" %>
<%@ page import="dao.UserDAO" %>
<%@ page import="dao.CardDAO" %>
<%@ page import="java.util.Date" %>
<%@ page import="data.LogBean" %>
<%@ page import="dao.LogDAO" %>
<jsp:useBean id="user" class="data.UserBean" scope="session"/>
<html>
<head>
    <title>转账</title>
    <link rel="shortcut icon" href="#" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/table.css">
    <script src="${pageContext.request.contextPath}/js/jquery-3.4.1.js" ></script>
</head>
<body>
<div class="pane">
    <form action="transferaccounts.jsp" method="post">
        <div>请输入您的卡号：</div>
        <input type="text" name="card1" required/>
        <div>请输入对方的卡号：</div>
        <input type="text" name="card2" required/>
        <div>请输入金额：</div>
        <input type="text" name="amount" required/>
        <input type="submit" value="提交">
    </form>

</div>
<%
    String chu = request.getParameter("card1");
    String ru = request.getParameter("card2");
    String amount = request.getParameter("amount");

    if (user.getCardBean1()==null){
        user.setCardBean1(new CardBean());
    }
    if (user.getCardBean2()==null){
        user.setCardBean2(new CardBean());
    }

    if (chu==null||ru==null){

    }else if (ru!=null){
        if (user.getCardBean1().getCid().equals(chu)) {
            int user_c1_amount = user.getCardBean1().getAmount();
            int user_c1_after = user_c1_amount - Integer.parseInt(amount);
            if (user_c1_after > 0) {
                user.getCardBean1().setAmount(user_c1_after);
                CardDAO.alterAmountByCid(user.getCardBean1().getCid(),user_c1_after);
                CardBean cardBean = CardDAO.getCardByCid(ru);
                int m = cardBean.getAmount();
                int b = m + Integer.parseInt(amount);
                if (user.getCardBean2().getCid().equals(ru)){
                    user.getCardBean2().setAmount(b);
                }else if (user.getCardBean1().getCid().equals(ru)){
                    user.getCardBean1().setAmount(b);
                }
                CardDAO.alterAmountByCid(ru,b);
                //添加日志
                Date date = new Date();
                LogBean lb1 = new LogBean(user.getCardBean1().getCid(),ru,"转出",Integer.parseInt(amount),date);
                LogBean lb2 = new LogBean(ru,user.getCardBean1().getCid(),"转入",Integer.parseInt(amount),date);
                LogDAO.addLogByLogBean(lb1);
                LogDAO.addLogByLogBean(lb2);

                response.sendRedirect("index.jsp?flag=7");//转账成功
            } else {
                response.sendRedirect("index.jsp?flag=6");//余额不足
            }
        }else if (user.getCardBean2().getCid().equals(chu)){
            int user_c2_amount = user.getCardBean2().getAmount();
            int n = user_c2_amount - Integer.parseInt(amount);
            if (n > 0) {
                user.getCardBean2().setAmount(n);
                CardDAO.alterAmountByCid(user.getCardBean2().getCid(),n);
                CardBean cardBean = CardDAO.getCardByCid(ru);
                int a = cardBean.getAmount();
                int b = a + Integer.parseInt(amount);
                if (user.getCardBean1().getCid().equals(ru)){
                    user.getCardBean1().setAmount(b);
                }else if (user.getCardBean2().getCid().equals(ru)){
                    user.getCardBean2().setAmount(b);
                }

                CardDAO.alterAmountByCid(ru,b);

                //添加日志
                Date date = new Date();
                LogBean lb1 = new LogBean(user.getCardBean2().getCid(),ru,"转出",Integer.parseInt(amount),date);
                LogBean lb2 = new LogBean(ru,user.getCardBean2().getCid(),"转入",Integer.parseInt(amount),date);
                LogDAO.addLogByLogBean(lb1);
                LogDAO.addLogByLogBean(lb2);

                response.sendRedirect("index.jsp?flag=7");//转账成功
            } else {
                response.sendRedirect("index.jsp?flag=6");//余额不足
            }
        }
        else {
            response.sendRedirect("index.jsp?flag=3");//银行卡错误
        }

    }else {
        response.sendRedirect("index.jsp?flag=3");//银行卡错误
    }
%>
</body>
</html>
