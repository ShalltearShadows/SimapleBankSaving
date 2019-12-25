package controller;

import dao.AdminDAO;
import dao.UserDAO;
import data.AdminBean;
import data.UserBean;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class AdminRegisterServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        //创建bean实体，并设置信息
        AdminBean admin = new AdminBean();
        String name = req.getParameter("aname");
        String phone = req.getParameter("aphone");

        admin.setAname(name);
        admin.setApwd("111111");
        admin.setAphone(phone);
        //生成1为不是1的数
        int first = (int) (Math.random() * 10);

        while (first==0){
            first = (int) (Math.random() * 10);
        }

        //随机生成6位学号
        String number=""+first;
        for(int i=0;i<6;i++){
            int num = (int)(Math.random()*10);
            number+=""+num;
        }
        admin.setAid(number);
        AdminDAO.addAdminByBean(admin);
        HttpSession session = req.getSession(true);
        session.setAttribute("admin",admin);

        resp.sendRedirect("admin-info/aindex.jsp?flag=10");

    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
