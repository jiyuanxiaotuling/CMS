package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import db.DB;
import model.CS;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class classifyCsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String branch = request.getParameter("branch");
        String keyword = request.getParameter("keyword");
        DB db=new DB();
        HttpSession session=request.getSession();
        ArrayList cs_al=db.findCsInfo(branch,keyword);
        if(keyword == null){
            response.sendRedirect("main.jsp");
        }else{
            session.setAttribute("cs_al", cs_al);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
