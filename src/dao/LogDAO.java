package dao;

import data.LogBean;

import java.sql.*;
import java.util.Vector;

public class LogDAO {
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bank?serverTimezone=Asia/Shanghai&useSSL=false";
            String name = "root";
            String pwd = "lq0522";

            Connection con = DriverManager.getConnection(url, name, pwd);//获取连接对象
            return con;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return null;
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }

    public static Vector<LogBean> getAllLogByCid(String cid){
        Connection con = getConnection();
        Vector<LogBean> logBeans = new Vector<>();
        Statement st;
        ResultSet rs;

        try {
            st = con.createStatement();
            String sql = "select * from log where cid1 = '"+cid+"'";
            rs = st.executeQuery(sql);
            while (rs.next()){
                String cid1 = rs.getString("cid1");
                String cid2 = rs.getString("cid2");
                String type = rs.getString("type");
                int amount = rs.getInt("amount");
                java.util.Date date = rs.getTimestamp("date");
                LogBean lb = new LogBean(cid1,cid2,type,amount,date);

                logBeans.add(lb);
            }

            closeAll(con,st,null,rs);

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return logBeans;
    }

    public static void addLogByLogBean(LogBean lb){
        Connection con = getConnection();
        Vector<LogBean> logBeans = new Vector<>();
        PreparedStatement st;
        System.out.println(lb.getCid1()+lb.getDate()+lb.getType()+lb.getAmount()+lb.getCid2());

        try {
            String sql = "insert into log values(?,?,?,?,?) ";
            st = con.prepareStatement(sql);
            st.setString(1,lb.getCid1());
            st.setString(2,lb.getCid2());
            st.setString(3,lb.getType());
            st.setInt(4,lb.getAmount());
            st.setTimestamp(5,new java.sql.Timestamp(lb.getDate().getTime()));
            st.execute();

            closeAll(con,null,st,null);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public static void closeAll(Connection conn,Statement st, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (st!=null){
                st.close();
            }

            if (ps != null) {
                ps.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
            if (conn != null) {
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
