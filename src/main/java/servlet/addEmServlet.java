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

        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("em_id");
        String name = request.getParameter("em_name");
        String gender = request.getParameter("em_gender");
        String age=request.getParameter("em_age");
        String position=request.getParameter("em_position");
        String department=request.getParameter("em_department");
        String phone=request.getParameter("em_phone");
        String email=request.getParameter("em_email");
        Date addtime = new Date(System.currentTimeMillis());
        EM em = new EM();
        em.setEm_id(id);
        em.setEm_name(name);
        em.setEm_gender(gender);
        em.setEm_age(Integer.parseInt(age));
        em.setEm_position(position);
        em.setEm_department(department);
        em.setEm_phone(phone);
        em.setEm_email(email);
        em.setEm_addtime(addtime);
        if(request.getParameter("em_btn").equals("提交")){
            DB db = new DB();
            db.addEm(em);
            db.addAcc(id);
            response.sendRedirect("main.jsp");
        } else if (request.getParameter("em_btn").equals("修改")) {
            new DB().modifyEm(em);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
