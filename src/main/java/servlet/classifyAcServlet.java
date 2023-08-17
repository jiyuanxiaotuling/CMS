package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import db.DB;
import model.AC;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class classifyAcServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String branch = request.getParameter("branch");
        String keyword = request.getParameter("keyword");
        DB db=new DB();
        HttpSession session=request.getSession();
        ArrayList ac_al=db.findAcInfo(branch,keyword);
        if(keyword == null){
            response.sendRedirect("main.jsp");
        }else{
            session.setAttribute("ac_al", ac_al);
            response.sendRedirect("main.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
