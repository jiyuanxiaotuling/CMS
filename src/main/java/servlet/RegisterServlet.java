package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import db.DB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class RegisterServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        String username=request.getParameter("username");
        String pwd=request.getParameter("pwd");
        String re_pwd=request.getParameter("re_pwd");
        if(new DB().isExistName(username)){
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('该用户名已被注册！');window.document.location.href=\"register.jsp\";</script>");
        } else if (!(pwd.equals(re_pwd))) {
            response.setContentType("text/html; charset=UTF-8");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().print("<script language='javascript'>alert('两次输入密码不一致！');window.document.location.href=\"register.jsp\";</script>");
        } else if(new DB().insertUser(username, pwd)){
            response.sendRedirect("login.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);

    }
}
