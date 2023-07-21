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
public class addEmServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");

        if(request.getParameter("em_btn").equals("提交")){
            String id = request.getParameter("em_id");
            String name = request.getParameter("em_name");
            String gender = request.getParameter("em_gender");
            String age=request.getParameter("em_age");
            String position=request.getParameter("em_position");
            String department=request.getParameter("em_department");
            String phone=request.getParameter("em_phone");
            String email=request.getParameter("em_email");
            EM em = new EM();
           em.setEm_id(id);
           em.setEm_name(name);
           em.setEm_gender(gender);
           em.setEm_age(Integer.parseInt(age));
           em.setEm_position(position);
           em.setEm_department(department);
           em.setEm_phone(phone);
           em.setEm_email(email);
            new DB().addEm(em);
            response.sendRedirect("main.jsp");
        } else if (request.getParameter("em_btn").equals("修改")) {
            String id = request.getParameter("em_id");
            String name = request.getParameter("em_name");
            String gender = request.getParameter("em_gender");
            String age=request.getParameter("em_age");
            String position=request.getParameter("em_position");
            String department=request.getParameter("em_department");
            String phone=request.getParameter("em_phone");
            String email=request.getParameter("em_email");
            EM em = new EM();
            em.setEm_id(id);
            em.setEm_name(name);
            em.setEm_gender(gender);
            em.setEm_age(Integer.parseInt(age));
            em.setEm_position(position);
            em.setEm_department(department);
            em.setEm_phone(phone);
            em.setEm_email(email);
            new DB().modifyEm(em);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
