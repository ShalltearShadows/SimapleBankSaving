package controller;

import dao.UserDAO;
import data.UserBean;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class RegisterServlet extends HttpServlet {
    public void init(ServletConfig config) throws ServletException {
        super.init(config);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        req.setCharacterEncoding("UTF-8");
        //创建bean实体，并设置信息
        UserBean user = new UserBean();
        String name = req.getParameter("uname");
        String phone = req.getParameter("phone");

        user.setUname(name);
        user.setUpwd("111111");
        user.setPhone(phone);
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
        user.setUid(number);
        UserDAO.addUserByBean(user);
        resp.sendRedirect("user-info/index.jsp?flag=10");
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}

