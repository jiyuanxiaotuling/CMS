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
public class deleteEmServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");
        String action = request.getParameter("action");
        if(action != null && action.equals("delete")){
            String id = request.getParameter("em_id");
            new DB().deleteEm(id);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
