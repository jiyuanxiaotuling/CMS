package db;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.TimeZone;

import model.*;

public class DB {
    private static final Object UTC= TimeZone.getTimeZone("UTC");
    Connection ct;
    PreparedStatement pstmt;
    String url;
    String user;
    String password;
    public DB(Connection ct, PreparedStatement pstmt, String url, String user, String password) {
        this.ct = ct;
        this.pstmt = pstmt;
        this.url = url;
        this.user = user;
        this.password = password;
    }
    public DB(){
        url= "jdbc:mysql://localhost:3306/customer?characterEncoding=UTF-8"+"&serverTimezone=UTC";
        user ="root";
        password ="root";
        try{
            Class.forName("com.mysql.jdbc.Driver");
            ct=DriverManager.getConnection(url,user,password);
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    public User checkUser(String username,String password){
        try{
            pstmt=ct.prepareStatement("select * from account where acc_username=? and acc_password=?");

            pstmt.setString(1,username);
            pstmt.setString(2, password);
            ResultSet rs=pstmt.executeQuery();
            User user=new User();
            if(!rs.next()){
                return null;
            }
            while(rs.next()){
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                return user;
            }
            return null;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public boolean isExistName(String username){
        ResultSet rs;
        try {
            pstmt = ct.prepareStatement("select acc_username from account");
            rs = pstmt.executeQuery();
            while(rs.next()){
                if(username.equals(rs.getString(1))){
                    return true;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return false;
    }
    public String getUserName(int id)  {
        String username=null;
        try {
            pstmt=ct.prepareStatement("select acc_username from account where acc_id=?");
            pstmt.setInt(1, id);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())  {
                username=rs.getString(1);
            }
            return username;
        } catch(Exception e)  {
            e.printStackTrace();
            return null;
        }
    }

    public boolean insertUser(String username,String pwd){
        try{
            if(username==""||pwd=="") return false;
            pstmt=ct.prepareStatement("insert into account (acc_username, acc_password) values(?,?)");
            pstmt.setString(1, username);
            pstmt.setString(2, pwd);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
}
