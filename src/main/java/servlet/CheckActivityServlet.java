package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DB;

public class CheckActivityServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();

        // 调用 checkAc() 方法来检查活动
        DB db = new DB();
        boolean hasFutureActivity = db.checkFutureAc();
        boolean hasDoingActivity = db.checkDoingAc();
        // 将结果发送回客户端
        if (hasDoingActivity) {
            out.print("hasDoingActivity");
        } else if (hasFutureActivity) {
            out.print("hasFutureActivity");
        } else {
            out.print("noActivity");
        }

        out.close();
    }
}