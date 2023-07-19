package db;
import java.net.URLEncoder;
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
    public ArrayList findCsInfo(){
        try{
            pstmt=ct.prepareStatement("select * from customer_info");
            ArrayList al=new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                CS cs_info=new CS();
                cs_info.setCs_id(rs.getString(1));
                cs_info.setCs_name(rs.getString(2));
                cs_info.setCs_sex(rs.getString(3));
                cs_info.setCs_phone(rs.getString(4));
                cs_info.setCs_email(rs.getString(5));
                cs_info.setCs_address(rs.getString(6));
                cs_info.setCs_kind(rs.getString(7));
                cs_info.setCs_remark(rs.getString(8));
                al.add(cs_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList findCsInfo(String br,String key){
        try{
            if(key == null){
                pstmt = ct.prepareStatement("select * from customer_info");
            }else{
                pstmt=ct.prepareStatement("select * from customer_info where "+ br +" like ?");
                pstmt.setString(1,"%" + key + "%");
            }
            ArrayList al = new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                CS cs_info=new CS();
                cs_info.setCs_id(rs.getString(1));
                cs_info.setCs_name(rs.getString(2));
                cs_info.setCs_sex(rs.getString(3));
                cs_info.setCs_phone(rs.getString(4));
                cs_info.setCs_email(rs.getString(5));
                cs_info.setCs_address(rs.getString(6));
                cs_info.setCs_kind(rs.getString(7));
                cs_info.setCs_remark(rs.getString(8));
                al.add(cs_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public boolean addCs(CS cs){
        try{
            pstmt=ct.prepareStatement("insert into customer_info (cs_name,cs_sex,cs_phone,cs_email,cs_address,cs_kind,cs_remark,cs_id) values(?,?,?,?,?,?,?,?)");
            pstmt.setString(1, cs.getCs_name());
            pstmt.setString(2, cs.getCs_sex());
            pstmt.setString(3, cs.getCs_phone());
            pstmt.setString(4, cs.getCs_email());
            pstmt.setString(5, cs.getCs_address());
            pstmt.setString(6, cs.getCs_kind());
            pstmt.setString(7, cs.getCs_remark());
            pstmt.setString(8, cs.getCs_id());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean modifyCs(CS cs){
        try{
            pstmt=ct.prepareStatement("UPDATE customer_info SET cs_name=?,cs_sex=?,cs_phone=?,cs_email=?,cs_address=?,cs_kind=?,cs_remark=? WHERE cs_id=?");
            pstmt.setString(1, cs.getCs_name());
            pstmt.setString(2, cs.getCs_sex());
            pstmt.setString(3, cs.getCs_phone());
            pstmt.setString(4, cs.getCs_email());
            pstmt.setString(5, cs.getCs_address());
            pstmt.setString(6, cs.getCs_kind());
            pstmt.setString(7, cs.getCs_remark());
            pstmt.setString(8, cs.getCs_id());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteCs(String id){
        try{
            pstmt=ct.prepareStatement("DELETE from customer_info WHERE cs_id=?");
            pstmt.setString(1,id);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
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
