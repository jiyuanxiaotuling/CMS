package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import db.DB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class adminServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        String username = request.getParameter("username");
        String pwd = request.getParameter("password");
        if(username.equals("admin")&&pwd.equals("guest")){
            DB db=new DB();
            HttpSession session=request.getSession();
            ArrayList al=db.findCsInfo();
            session.setAttribute("al", al);
            response.sendRedirect("main.jsp");
        }else if(!(new DB().isExistName(username))){
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('账号不存在！');window.document.location.href=\"login.jsp\";</script>");
        }else if(new DB().checkUser(username,pwd)==null){
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('密码错误！');window.document.location.href=\"login.jsp\";</script>");
        }else{
            response.sendRedirect("employee.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);

    }
}
