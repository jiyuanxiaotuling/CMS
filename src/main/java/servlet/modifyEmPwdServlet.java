package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import db.DB;
public class modifyEmPwdServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String old_pwd = request.getParameter("old_pwd");
        String new_pwd = request.getParameter("new_pwd");
        String new_pwd2 = request.getParameter("new_pwd2");
        String id = request.getParameter("hidden_emid");
        String pwd = new DB().findEmPwd(id);
        if(!old_pwd.equals(pwd)){
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('原密码错误！');window.onload = function() {window.document.location.href=\"PersonInfo.jsp\";document.getElementById(\"forContent2\").style.display = \"block\";}</script>");
        } else if (!new_pwd.equals(new_pwd2)) {
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('两次密码输入不一致！');window.onload = function() {window.document.location.href=\"PersonInfo.jsp\";document.getElementById(\"forContent1\").style.display = \"none\";document.getElementById(\"forContent2\").style.display = \"block\";document.getElementById(\"old_pwd\").value = old_pwd;}</script>");
        } else{
            new DB().modifyEmPwd(new_pwd,id);
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('修改成功！');window.onload = function() {window.document.location.href=\"PersonInfo.jsp\";document.getElementById(\"forContent1\").style.display = \"none\";document.getElementById(\"forContent2\").style.display = \"block\";}</script>");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
