package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import db.DB;
public class modifyPersonalInfoServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String phone = request.getParameter("em-phone");
        String email = request.getParameter("em-email");
        String id = request.getParameter("hidden_emid");
        HttpSession session=request.getSession();
        System.out.println(new DB().modifyEmInfo(phone,email,id));
        if(new DB().modifyEmInfo(phone,email,id)){
            session.setAttribute("modifyMessage","success");
            response.sendRedirect("PersonInfo.jsp?modifyMessage=success");
        }else{
            session.setAttribute("modifyMessage","failed");
            response.sendRedirect("PersonInfo.jsp?modifyMessage=failed");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
