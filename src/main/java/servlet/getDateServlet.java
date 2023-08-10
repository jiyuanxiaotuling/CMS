package servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;
import db.DB;
public class getDateServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("gb2312");
        response.setContentType("text/html;charset=gb2312");
        String id = request.getParameter("em_id");
        ArrayList<AC> arrayList = new DB().findDate(id);
        ArrayList<String> ar = new ArrayList<String>();
        Iterator it = arrayList.iterator();
        AC ac = (AC) it.next();
        ar.add(ac.getAc_id());
        ar.add(ac.getAc_name());
        ar.add(ac.getAc_kind());
        ar.add(ac.getAc_content());
        ar.add(ac.getAc_address());
        ar.add(ac.getAc_btime().getYear()+1900+"");
        ar.add(ac.getAc_btime().getMonth()+1+"");
        ar.add(ac.getAc_btime().getDate()+"");
        HttpSession session=request.getSession();
        session.setAttribute("ac_ar",ar);
        session.setAttribute("year",ac.getAc_btime().getYear()+1900+"");
        session.setAttribute("month",ac.getAc_btime().getMonth()+1+"");
        session.setAttribute("day",ac.getAc_btime().getDate()+"");
        response.sendRedirect("schedule.jsp");
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
