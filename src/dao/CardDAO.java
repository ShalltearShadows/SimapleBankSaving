package dao;

import data.CardBean;
import data.UserBean;

import java.sql.*;
import java.util.Vector;

public class CardDAO {
    public static Connection getConnection() {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/bank?serverTimezone=GMT&useSSL=false";
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

    //查询银行卡list
    public static Vector<CardBean> getCardBeanbyUid(String uid){
        Connection con = getConnection();
        Statement sql;
        Vector<CardBean> cardBeansList = new Vector<>();
        try {
            String SQL ="SELECT * FROM card " +
                    "WHERE cid IN ( SELECT cid1 FROM binding WHERE uid='" + uid + "' ) " +
                    "OR " +
                    "cid IN ( SELECT cid2 FROM binding WHERE uid='" + uid + "' ) ";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(SQL);

            while (rs.next()) {
                CardBean c = new CardBean();
                c.setCid(rs.getString("cid"));
                c.setAmount(rs.getString("amount"));
                c.setDate(rs.getDate("date"));
                cardBeansList.add(c);
            }

            closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return cardBeansList;
    }

    //查询银行卡
    public static CardBean getCardByCid(String cid){
        Connection con = getConnection();
        Statement st;
        ResultSet rs;
        CardBean cardBean = new CardBean();
        try {
            st = con.createStatement();
            String sql = "select * from card where cid = '"+cid+"'";
            rs = st.executeQuery(sql);
            if (rs.next()){
                cardBean.setCid(rs.getString("cid"));
                cardBean.setAmount(rs.getString("amount"));
                cardBean.setDate(rs.getDate("date"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return cardBean;
    }

    //修改银行卡金额
    public static void alterAmountByCid(String cid,String amount){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update card set amount = '"+amount+"' where cid = '"+cid+"' ";
            st = con.createStatement();
            st.execute(sql);
            closeAll(con,null,null);
            if (st!=null){
                st.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    //注销银行卡
    public static void deleteCardandBindingByUidandCid(String uid,String cid){
        Connection con = getConnection();
        Statement  st;
        try {
            st =  con.createStatement();

            String  SQL = "update binding set cid1 = null where uid ='"+uid+"' and cid1 = '"+cid+"'";
            st.execute(SQL);

            SQL = "update binding set cid2 = null where uid ='"+uid+"' and cid2 = '"+cid+"'";
            st.execute(SQL);

            SQL = "delete from card where cid='"+cid+"'";
            st.execute(SQL);

            closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}
    }

    //添加银行卡
    public static Date addCardbyCardBean(CardBean card){
        Connection con = getConnection();
        PreparedStatement  st;
        try {
            String cid = card.getCid();
            String amount = card.getAmount();
            Date date = card.getDate();



            String  SQL = "insert into card values(?,?,?)";
            st = con.prepareStatement(SQL);

            st.setString(1,cid);
            st.setString(2,amount);
            st.setDate(3,date);

            st.execute();

            closeAll(con,st,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    //添加绑定信息
    public static void addBindingByUidandCid(UserBean user, String cid){
        Connection con = getConnection();
        Statement  st;
        try {

            st = con.createStatement();

            if (user.getCardBean1()!=null) {
                String  SQL = "update binding set cid2 = '"+cid+"' where uid ='"+user.getUid()+"' and cid2 is NULL ";
                st.execute(SQL);
            }else if (user.getCardBean2()!=null){
                String  SQL = "update binding set cid1 = '"+cid+"' where uid ='"+user.getUid()+"' and cid1 is NULL ";
                st.execute(SQL);
            }


            closeAll(con,null,null);
            if (st!=null){
                st.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public static void closeAll(Connection conn, PreparedStatement ps, ResultSet rs) {
        try {
            if (rs != null) {
                rs.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        try {
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
