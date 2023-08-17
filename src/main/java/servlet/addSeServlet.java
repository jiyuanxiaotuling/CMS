package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import db.DB;
public class addSeServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("se_id");
        String time = request.getParameter("se_time");
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
        SE se = new SE();
        try {
            java.util.Date date = dateFormat.parse(time);
            java.sql.Date sqlDate = new java.sql.Date(date.getTime());
            se.setSe_time(sqlDate);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        String kind = request.getParameter("se_kind");
        String priority = request.getParameter("se_priority");
        String status = request.getParameter("se_status");
        String content = request.getParameter("se_content");
        String feedback = request.getParameter("se_feedback");
        int satisfaction = Integer.parseInt(request.getParameter("se_satisfaction"));
        String cs_id = request.getParameter("cs_id1");
        String em_id = request.getParameter("em_id1");
        se.setSe_id(id);
        se.setSe_kind(kind);
        se.setSe_priority(priority);
        se.setSe_status(status);
        se.setSe_content(content);
        se.setSe_feedback(feedback);
        se.setSe_satisfaction(satisfaction);
        se.setCs_id(cs_id);
        se.setEm_id(em_id);
        if(request.getParameter("se_btn").equals("提交")){
            new DB().addSe(se);
            response.sendRedirect("main.jsp");
        } else if (request.getParameter("se_btn").equals("修改")) {
            new DB().modifySe(se);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
