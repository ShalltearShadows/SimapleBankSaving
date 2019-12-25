package controller;

import dao.CardDAO;
import dao.LogDAO;
import data.LogBean;
import data.UserBean;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

public class GetUserAllTheLogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String cid = request.getParameter("cid");

        HttpSession session = request.getSession(true);
        Vector<LogBean> logBeanList = new Vector<LogBean>();

        if (CardDAO.getCardByCid(cid).getCid()!=null){

            logBeanList = LogDAO.getAllLogByCid(cid);

            JSONArray stu = JSONArray.fromObject(logBeanList);

            out.print(stu.toString());

        }else {
            JSONObject json=new JSONObject();
            json.put("flag", "3");
            out.print(json);
        }


        out.flush();
        out.close();


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}

