package controller;


import dao.UserDAO;
import data.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        String uid = request.getParameter("uid");
        String pwd = request.getParameter("pwd");
        HttpSession session = request.getSession(true);

        if(UserDAO.chenkLoginByUidandUpwd(uid,pwd)) {
            UserBean user = UserDAO.findUserByID(uid);
            session.setAttribute("user",user);
            response.sendRedirect("user-info/index.jsp");
        }else {
            response.sendRedirect("login.jsp?flag=1");
        }

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
