package dao;

import data.AdminBean;

import java.sql.*;

public class AdminDAO {
    private AdminDAO(){};

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
    public static boolean chenkLoginByUidandUpwd(String aid,String apwd){
        Connection con = getConnection();
        Statement st;
        ResultSet rs;

        try {
            String sql = "select * from admin where aid = '" + aid + "' and apwd = '" + apwd + "'";
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

    //查询管理员
    public static AdminBean findAdminByID(String num) {
        Connection con = getConnection();
        AdminBean admin = new AdminBean();
        Statement sql;
        try {
            String condition = "select * from admin where aid ='" + num + "'";
            sql = con.createStatement();
            ResultSet rs = sql.executeQuery(condition);

            if (rs.next()) {
                admin.setAid(rs.getString("aid"));
                admin.setAname(rs.getString("aname"));
                admin.setApwd(rs.getString("apwd"));
                admin.setAphone(rs.getString("aphone"));
            }

            closeAll(con, null, rs);
            sql.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }

    //注销管理员
    public static void deleteAdminByUid(String aid){
        Connection con = getConnection();
        Statement  st;
        try {
            String  SQL = "delete from admin where aid='"+aid+"'";
            st =  con.createStatement();
            st.execute(SQL);

            closeAll(con,null,null);
            st.close();
        } catch (SQLException e) {}

    }


    //添加管理员
    public static void addAdminByBean (AdminBean admin){
        Connection con = getConnection();
        PreparedStatement  st;
        try {
            String aid = admin.getAid();
            String aname = admin.getAname();
            String apwd = admin.getApwd();
            String aphone = admin.getAphone();


            String  SQL1 = "insert into admin values(?,?,?,?)";
            st = con.prepareStatement(SQL1);
            st.setString(1,aid);
            st.setString(2,aname);
            st.setString(3,apwd);
            st.setString(4,aphone);

            st.execute();

            closeAll(con,st,null);
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    //修改姓名
    public static void alterAdminAname(String aid,String aname){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update admin set aname = '"+aname+"' where aid = '"+aid+"' ";
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

    //修改密码
    public static void alterAdminApwd(String aid,String apwd){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update admin set apwd = '"+apwd+"' where uid = '"+aid+"' ";
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

    //修改电话
    public static void alterAdminPhone(String aid,String aphone){
        Connection con = getConnection();
        Statement st;

        try {
            String sql = "update admin set aphone = '"+aphone+"' where uid = '"+aid+"' ";
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
