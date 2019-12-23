package dao;

import data.CardBean;
import data.UserBean;
import java.sql.*;
import java.util.Vector;

public class UserDAO {

    private UserDAO(){};

    //获取数据库连接
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

    //验证登录
    public static boolean chenkLoginByUidandUpwd(String uid,String upwd){
        Connection con = getConnection();
        Statement st;
        ResultSet rs;

        try {
            String sql = "select * from user where uid = '" + uid + "' and upwd = '" + upwd + "'";
            st = con.createStatement();
            rs = st.executeQuery(sql);
            if (rs.next()){
                return true;
            }else
                return false;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //查询用户
    public static UserBean findUserByID(String num) {
        Connection con = getConnection();
        UserBean user = new UserBean();
        Statement sql;
        try {
            String condition = "select * from user where uid ='" + num + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);

            if (rs.next()) {
                user.setUid(rs.getString("uid"));
                user.setUname(rs.getString("uname"));
                user.setUpwd(rs.getString("upwd"));
                user.setPhone(rs.getString("phone"));
            }

            Vector<CardBean> cardBeanlist = CardDAO.getCardBeanbyUid(num);
            cardBeanlist.setSize(2);
            System.out.println(cardBeanlist.get(0).getCid());
            System.out.println(cardBeanlist.get(1).getCid());

            if (cardBeanlist.get(0)!=null){
                String sq = "select * from binding where uid = '"+num+"' and cid1 = '"+cardBeanlist.get(0).getCid()+"'";
                rs = sql.executeQuery(sq);
                if (rs.next()) {
                    user.setCardBean1(cardBeanlist.get(0));
                }

                sq = "select * from binding where uid = '"+num+"' and cid2 = '"+cardBeanlist.get(0).getCid()+"'";
                rs = sql.executeQuery(sq);
                if (rs.next()) {
                    user.setCardBean2(cardBeanlist.get(0));
                }
            }
            if (cardBeanlist.get(1)!=null){
                String sq = "select * from binding where uid = '"+num+"' and cid1 = '"+cardBeanlist.get(1).getCid()+"'";
                rs = sql.executeQuery(sq);
                if (rs.next()) {
                    user.setCardBean1(cardBeanlist.get(1));
                }

                sq = "select * from binding where uid = '"+num+"' and cid2 = '"+cardBeanlist.get(1).getCid()+"'";
                rs = sql.executeQuery(sq);
                if (rs.next()) {
                    user.setCardBean2(cardBeanlist.get(1));
                }

            }

            closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return user;
    }

    //注销用户
    public static void deleteUserByUid(String id){
        Connection con = getConnection();
        Statement  st;
        try {
            String  SQL = "delete from user where uid='"+id+"'";
            st =  con.createStatement();
            st.execute(SQL);

            closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}

    }



    //添加用户
    public static void addUserByBean (UserBean user){
        Connection con = getConnection();
        PreparedStatement  st;
        try {
            String uid = user.getUid();
            String uname = user.getUname();
            String upwd = user.getUpwd();
            String phone = user.getPhone();


            String  SQL1 = "insert into user values(?,?,?,?)";
            st = con.prepareStatement(SQL1);
            st.setString(1,uid);
            st.setString(2,uname);
            st.setString(3,upwd);
            st.setString(4,phone);

            String SQL2 = "insert into binding(uid) values('"+user.getUid()+"')";
            Statement stat = con.createStatement();
            stat.execute(SQL2);

            st.execute();

            closeAll(con,st,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //修改用户名
    public static void alterUserUname(String uid,String name){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update user set uname = '"+name+"' where uid = '"+uid+"' ";
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

    //修改用户密码
    public static void alterUserUpwd(String uid,String pwd){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update user set upwd = '"+pwd+"' where uid = '"+uid+"' ";
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

    //修改用户电话
    public static void alterUserPhone(String uid,String phone){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update user set phone = '"+phone+"' where uid = '"+uid+"' ";
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
