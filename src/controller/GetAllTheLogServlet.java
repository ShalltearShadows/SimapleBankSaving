package controller;

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

public class GetAllTheLogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String cid = request.getParameter("cid");

        HttpSession session = request.getSession(true);
        Vector<LogBean> logBeanList = new Vector<LogBean>();
        UserBean user = (UserBean) session.getAttribute("user");
        try {
            if (user.getCardBean1().getCid().equals(cid)&&user.getCardBean1().getCid()!=null) {
                logBeanList = LogDAO.getAllLogByCid(cid);
            }else if (user.getCardBean2().getCid().equals(cid)&&user.getCardBean2().getCid()!=null){
                logBeanList = LogDAO.getAllLogByCid(cid);
            }else {
                //银行卡错误
                JSONObject json=new JSONObject();
                json.put("flag", "3");
                out.print(json);
            }
        }catch (Exception e){

        }
        JSONArray stu = JSONArray.fromObject(logBeanList);

        out.print(stu.toString());
        out.flush();
        out.close();


    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }
}
