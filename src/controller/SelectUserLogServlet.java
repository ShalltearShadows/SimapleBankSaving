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
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Vector;

public class SelectUserLogServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();

        String cid = request.getParameter("cid");
        String first = request.getParameter("first");
        String second = request.getParameter("second");

        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date datefirst = new Date();
        Date datesecond = new Date();
        try {
            datefirst = simpleDateFormat.parse(first);
            datesecond = simpleDateFormat.parse(second);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        HttpSession session = request.getSession(true);
        Vector<LogBean> logBeanList = new Vector<LogBean>();
        UserBean user = (UserBean) session.getAttribute("user");
        try {
            if (datesecond.getTime() < datefirst.getTime()){
                JSONObject json=new JSONObject();
                json.put("flag", "1");
                out.print(json);
            }else if (CardDAO.getCardByCid(cid).getCid()!=null) {
                logBeanList = LogDAO.getAllLogByCid(cid);
                long secondtime = datesecond.getTime()+86400000L;
                for (int i=0;i<logBeanList.size();i++){
                    if (logBeanList.get(i).getDate().getTime()<datefirst.getTime()||
                            logBeanList.get(i).getDate().getTime()>secondtime){
                        logBeanList.removeElementAt(i);
                        i-=1;
                    }
                }
                JSONArray stu = JSONArray.fromObject(logBeanList);
                out.print(stu.toString());
            }else  {
                JSONObject json=new JSONObject();
                json.put("flag", "3");
                out.print(json);
            }
        }catch (Exception e){

        }



        out.flush();
        out.close();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
