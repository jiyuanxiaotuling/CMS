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

public class ptServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String ac_id = request.getParameter("ac-cs");
        String cs_id = request.getParameter("ac-cs_id");
        PT pt=new PT();
        pt.setAc_id(ac_id);
        pt.setCs_id(cs_id);
        if(request.getParameter("Pt_btn").equals("参与")){
            new DB().addPt(pt);
            response.sendRedirect("main.jsp");
        } else if (request.getParameter("Pt_btn").equals("退出")) {
            new DB().deletePt(ac_id,cs_id);
            response.sendRedirect("main.jsp");
        }
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
