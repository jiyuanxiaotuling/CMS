package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.*;
import db.DB;
public class addAcServlet extends HttpServlet{
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String id = request.getParameter("Ac_id");
        String name = request.getParameter("Ac_name");
        String kind=request.getParameter("Ac_kind");
        String content=request.getParameter("Ac_content");
        String address=request.getParameter("Ac_address");
        String btim=request.getParameter("Ac_btime");
        String etim=request.getParameter("Ac_etime");
        String em_id=request.getParameter("em-ac_id");
        String dateFormatPattern = "yyyy-MM-dd'T'HH:mm";
        SimpleDateFormat dateFormat = new SimpleDateFormat(dateFormatPattern);
        java.util.Date btime = null;
        try {
            btime = dateFormat.parse(btim);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        java.util.Date etime=null;
        try {
          etime =  dateFormat.parse(etim);
        } catch (ParseException e) {
            throw new RuntimeException(e);
        }
        java.sql.Date sqlBtime = new java.sql.Date(btime.getTime());
        java.sql.Date sqlEtime = new java.sql.Date(etime.getTime());
        AC ac=new AC();
        ac.setAc_id(id);
        ac.setAc_name(name);
        ac.setAc_kind(kind);
        ac.setAc_content(content);
        ac.setAc_address(address);
        ac.setAc_btime(sqlBtime);
        ac.setAc_etime(sqlEtime);
        if(request.getParameter("Ac_btn").equals("提交")){
            new DB().addAc(ac);
            DB db=new DB();
            ArrayList<EM> emList = db.findEmInfoById(String.valueOf(em_id));
            if (!emList.isEmpty()) {
                EM em = emList.get(0);
                em.setAc_id(id);
                db.modifyEm(em);
            }
            response.sendRedirect("main.jsp");
        }else if (request.getParameter("Ac_btn").equals("修改")) {
            new DB().modifyAc(ac);
            DB db=new DB();
            ArrayList<EM> emList = db.findEmInfoById(String.valueOf(em_id));
            ArrayList<EM> emList1 = db.findEmfoAc(String.valueOf(id));
            if (!emList1.isEmpty()) {
                EM em = emList1.get(0);
                em.setAc_id(null);
                db.modifyEm(em);
            }
            if (!emList.isEmpty()) {
                EM em = emList.get(0);
                if(em_id!=null)
                  em.setAc_id(id);
                db.modifyEm(em);
            }

            response.sendRedirect("main.jsp");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
