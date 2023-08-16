package db;
import java.net.URLEncoder;
import java.sql.*;
import java.util.ArrayList;
import java.util.TimeZone;

import model.*;

import javax.servlet.http.HttpSession;

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
            pstmt.setString(2,password);
            ResultSet rs=pstmt.executeQuery();

            if(!rs.next()){
                return null;
            }else{
                User user=new User();
                user.setId(rs.getInt(1));
                user.setUsername(rs.getString(2));
                user.setPassword(rs.getString(3));
                return user;
            }
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
    public String getEmId(String username)  {
        String emid = null;
        try {
            pstmt=ct.prepareStatement("select em_id from account where acc_username=?");
            pstmt.setString(1, username);
            ResultSet rs=pstmt.executeQuery();
            while(rs.next())  {
                emid = rs.getString(1);
            }
            return emid;
        } catch(Exception e)  {
            e.printStackTrace();
            return null;
        }
    }
//    查询用户信息（无参数版）
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
                cs_info.setCs_addtime(rs.getDate(9));
                al.add(cs_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList findSeInfo(){
        try{
            pstmt=ct.prepareStatement("select * from service");
            ArrayList al = new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                SE se_info = new SE();
                se_info.setSe_id(rs.getString(1));
                se_info.setSe_time(rs.getDate(2));
                se_info.setSe_kind(rs.getString(3));
                se_info.setSe_priority(rs.getString(4));
                se_info.setSe_status(rs.getString(5));
                se_info.setSe_content(rs.getString(6));
                se_info.setSe_feedback(rs.getString(7));
                se_info.setSe_satisfaction(rs.getInt(8));
                se_info.setCs_id(rs.getString(9));
                se_info.setEm_id(rs.getString(10));
                al.add(se_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList findEmInfo(){
        try{
            pstmt=ct.prepareStatement("select * from employee");
            ArrayList al=new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                EM em_info=new EM();
                em_info.setEm_id(rs.getString(1));
                em_info.setEm_name(rs.getString(2));
                em_info.setEm_gender(rs.getString(3));
                em_info.setEm_age(rs.getInt(4));
                em_info.setEm_position(rs.getString(5));
                em_info.setEm_department(rs.getString(6));
                em_info.setEm_phone(rs.getString(7));
                em_info.setEm_email(rs.getString(8));
                em_info.setEm_addtime(rs.getDate(10));
                al.add(em_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
//    通过员工ID来查找信息，用于再个人信息中显示
    public ArrayList findEmInfoById(String id){
        try{
            pstmt=ct.prepareStatement("select * from employee where em_id=?");
            pstmt.setString(1,id);
            ResultSet rs=pstmt.executeQuery();
            ArrayList al=new ArrayList();
            while(rs.next()){
                EM em_info=new EM();
                em_info.setEm_id(rs.getString(1));
                em_info.setEm_name(rs.getString(2));
                em_info.setEm_gender(rs.getString(3));
                em_info.setEm_age(rs.getInt(4));
                em_info.setEm_position(rs.getString(5));
                em_info.setEm_department(rs.getString(6));
                em_info.setEm_phone(rs.getString(7));
                em_info.setEm_email(rs.getString(8));
                em_info.setEm_addtime(rs.getDate(10));
                al.add(em_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
//    根据分类和关键字查询用户信息
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
                cs_info.setCs_addtime(rs.getDate(9));
                al.add(cs_info);
            }
            return al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList findEmInfo(String br,String key){
        try{
            if(key == null){
                pstmt = ct.prepareStatement("select * from employee");
            }else{
                pstmt=ct.prepareStatement("select * from employee where "+ br +" like ?");
                pstmt.setString(1,"%" + key + "%");
            }
            ArrayList em_al = new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                EM em_info=new EM();
                em_info.setEm_id(rs.getString(1));
                em_info.setEm_name(rs.getString(2));
                em_info.setEm_gender(rs.getString(3));
                em_info.setEm_age(rs.getInt(4));
                em_info.setEm_position(rs.getString(5));
                em_info.setEm_department(rs.getString(6));
                em_info.setEm_phone(rs.getString(7));
                em_info.setEm_email(rs.getString(8));
                em_info.setEm_addtime(rs.getDate(10));
                em_al.add(em_info);
            }
            return em_al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList findSeInfo(String br,String key){
        try{
            if(key == null){
                pstmt = ct.prepareStatement("select * from service");
            }else{
                pstmt=ct.prepareStatement("select * from service where "+ br +" like ?");
                pstmt.setString(1,"%" + key + "%");
            }
            ArrayList se_al = new ArrayList();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                SE se_info = new SE();
                se_info.setSe_id(rs.getString(1));
                se_info.setSe_time(rs.getDate(2));
                se_info.setSe_kind(rs.getString(3));
                se_info.setSe_priority(rs.getString(4));
                se_info.setSe_status(rs.getString(5));
                se_info.setSe_content(rs.getString(6));
                se_info.setSe_feedback(rs.getString(7));
                se_info.setSe_satisfaction(rs.getInt(8));
                se_info.setCs_id(rs.getString(9));
                se_info.setEm_id(rs.getString(10));
                se_al.add(se_info);
            }
            return se_al;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
    public ArrayList<AC> findDate(String emid){
        try{
            pstmt = ct.prepareStatement("select * from activity where ac_id = (select ac_id from employee where em_id = ?);");
            pstmt.setString(1,emid);
            ArrayList<AC> ac_info = new ArrayList<>();
            ResultSet rs=pstmt.executeQuery();
            while(rs.next()){
                AC ac=new AC();
                ac.setAc_id(rs.getString(1));
                ac.setAc_name(rs.getString(2));
                ac.setAc_kind(rs.getString(3));
                ac.setAc_content(rs.getString(4));
                ac.setAc_address(rs.getString(5));
                ac.setAc_btime(rs.getDate(6));
                ac.setAc_etime(rs.getDate(7));
                ac.setAc_btime_specific(rs.getTimestamp(6));
                ac.setAc_etime_specific(rs.getTimestamp(7));
                ac_info.add(ac);
            }
            return ac_info;
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
    }
//   添加用户
    public boolean addCs(CS cs){
        try{
            pstmt=ct.prepareStatement("insert into customer_info (cs_name,cs_sex,cs_phone,cs_email,cs_address,cs_kind,cs_remark,cs_id,cs_addtime) values(?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, cs.getCs_name());
            pstmt.setString(2, cs.getCs_sex());
            pstmt.setString(3, cs.getCs_phone());
            pstmt.setString(4, cs.getCs_email());
            pstmt.setString(5, cs.getCs_address());
            pstmt.setString(6, cs.getCs_kind());
            pstmt.setString(7, cs.getCs_remark());
            pstmt.setString(8, cs.getCs_id());
            pstmt.setDate(9, (Date) cs.getCs_addtime());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean addEm(EM em){
        try{
            pstmt=ct.prepareStatement("insert into employee (em_id,em_name,em_gender,em_age,em_position,em_department,em_phone,em_email,em_addtime) values(?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, em.getEm_id());
            pstmt.setString(2, em.getEm_name());
            pstmt.setString(3, em.getEm_gender());
            pstmt.setInt(4, em.getEm_age());
            pstmt.setString(5, em.getEm_position());
            pstmt.setString(6, em.getEm_department());
            pstmt.setString(7, em.getEm_phone());
            pstmt.setString(8, em.getEm_email());
            pstmt.setDate(9, em.getEm_addtime());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean addAcc(String em_id){
        try{
            pstmt=ct.prepareStatement("insert into account (acc_username,acc_password,em_id,acc_kind) values(?,?,?,?)");
            pstmt.setString(1, em_id);
            pstmt.setString(2, "000000");
            pstmt.setString(3, em_id);
            pstmt.setString(4, "employee");
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean addSe(SE se){
        try{
            pstmt=ct.prepareStatement("insert into service (se_id,se_time,se_kind,se_priority,se_status,se_content,se_feedback,se_satisfaction,cs_id,em_id) values(?,?,?,?,?,?,?,?,?,?)");
            pstmt.setString(1, se.getSe_id());
            pstmt.setDate(2, se.getSe_time());
            pstmt.setString(3, se.getSe_kind());
            pstmt.setString(4, se.getSe_priority());
            pstmt.setString(5, se.getSe_status());
            pstmt.setString(6, se.getSe_content());
            pstmt.setString(7, se.getSe_feedback());
            pstmt.setInt(8, se.getSe_satisfaction());
            pstmt.setString(9, se.getCs_id());
            pstmt.setString(10, se.getEm_id());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
//    修改用户信息
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
    public boolean modifyEm(EM em){
        try{
            pstmt=ct.prepareStatement("UPDATE employee SET em_name=?,em_gender=?,em_age=?,em_position=?,em_department=?,em_phone=?,em_email=? WHERE em_id=?");
            pstmt.setString(1, em.getEm_name());
            pstmt.setString(2, em.getEm_gender());
            pstmt.setInt(3, em.getEm_age());
            pstmt.setString(4, em.getEm_position());
            pstmt.setString(5, em.getEm_department());
            pstmt.setString(6, em.getEm_phone());
            pstmt.setString(7, em.getEm_email());
            pstmt.setString(8, em.getEm_id());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean modifySe(SE se){
        try{
            pstmt=ct.prepareStatement("UPDATE service SET se_time=?,se_kind=?,se_priority=?,se_status=?,se_content=?,se_feedback=?,se_satisfaction=?,em_id=? WHERE se_id=?");
            pstmt.setDate(1, (Date) se.getSe_time());
            pstmt.setString(2, se.getSe_kind());
            pstmt.setString(3, se.getSe_priority());
            pstmt.setString(4, se.getSe_status());
            pstmt.setString(5, se.getSe_content());
            pstmt.setString(6, se.getSe_feedback());
            pstmt.setInt(7, se.getSe_satisfaction());
            pstmt.setString(8, se.getEm_id());
            pstmt.setString(9, se.getSe_id());
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean modifyEmPwd(String pwd,String id){
        try{
            pstmt=ct.prepareStatement("UPDATE account SET acc_password=? WHERE em_id=?");
            pstmt.setString(1, pwd);
            pstmt.setString(2, id);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean modifyEmInfo(String phone,String email,String id){
        try{
            pstmt=ct.prepareStatement("UPDATE employee SET em_phone=?,em_email=? WHERE em_id=?");
            pstmt.setString(1, phone);
            pstmt.setString(2, email);
            pstmt.setString(3, id);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public String findEmPwd(String id){
        try{
            pstmt=ct.prepareStatement("SELECT acc_password from account WHERE em_id=?");
            pstmt.setString(1, id);
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()) {
                return rs.getString(1);
            }
        }catch(Exception e){
            e.printStackTrace();
            return null;
        }
        return null;
    }
//    删除用户
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
    public boolean deleteEm(String id){
        try{
            pstmt=ct.prepareStatement("DELETE from employee WHERE em_id=?");
            pstmt.setString(1,id);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
    public boolean deleteSe(String id){
        try{
            pstmt=ct.prepareStatement("DELETE from service WHERE cs_id=?");
            pstmt.setString(1,id);
            pstmt.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
    }
//    添加员工和客服账户
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

    //消息通知
    //    查找是否有一天内开始的活动
    public boolean checkFutureAc(){
        try{
            pstmt=ct.prepareStatement("SELECT * from activity WHERE ac_btime<=? and ac_etime>=?");

            pstmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()+24*60*60*1000));
            pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()) {
                return true;
            }
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return false;
    }

    public boolean checkDoingAc(){
        try{
            pstmt=ct.prepareStatement("SELECT * from activity WHERE ac_btime<=? and ac_etime>=?");

            pstmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));
            pstmt.setTimestamp(2, new Timestamp(System.currentTimeMillis()));
            ResultSet rs=pstmt.executeQuery();
            if(rs.next()) {
                return true;
            }
        }catch(Exception e){
            e.printStackTrace();
            return false;
        }
        return false;
    }
}
