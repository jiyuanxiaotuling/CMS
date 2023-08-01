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
public class addCsServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("Cs_id");
        String name = request.getParameter("Cs_name");
        String sex=request.getParameter("Cs_sex");
        String phone=request.getParameter("Cs_phone");
        String email=request.getParameter("Cs_email");
        String address=request.getParameter("Cs_address");
        String kind=request.getParameter("Cs_kind");
        String remark=request.getParameter("Cs_remark");
        CS cs=new CS();
        cs.setCs_id(id);
        cs.setCs_name(name);
        cs.setCs_sex(sex);
        cs.setCs_phone(phone);
        cs.setCs_email(email);
        cs.setCs_address(address);
        cs.setCs_kind(kind);
        cs.setCs_remark(remark);
        if(request.getParameter("Cs_btn").equals("提交")){
            new DB().addCs(cs);
            response.sendRedirect("main.jsp");
        } else if (request.getParameter("Cs_btn").equals("修改")) {
            new DB().modifyCs(cs);
            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
