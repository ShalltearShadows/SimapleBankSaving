package controller;

import dao.AdminDAO;
import data.AdminBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminLoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");

        String aid = request.getParameter("aid");
        String apwd = request.getParameter("apwd");
        HttpSession session = request.getSession(true);

        if(AdminDAO.chenkLoginByUidandUpwd(aid,apwd)) {
            AdminBean admin = AdminDAO.findAdminByID(aid);
            session.setAttribute("admin",admin);
            response.sendRedirect("admin-info/aindex.jsp");
        }else {
            response.sendRedirect("admin.jsp?flag=1");
        }

    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
