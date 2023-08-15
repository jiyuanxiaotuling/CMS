package servlet;
import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.*;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import model.*;
import db.DB;
public class ImportCustomerServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Part filePart = request.getPart("importCsFile");
        InputStream inputStream = filePart.getInputStream();
        // 根据文件类型，选择不同的解析方法
        String fileName = filePart.getSubmittedFileName();
        if (fileName.endsWith(".xlsx")) {
            // 解析 XLS 文件
            Workbook workbook = new XSSFWorkbook(inputStream);
            Sheet sheet = workbook.getSheetAt(0);
            System.out.println(sheet.getLastRowNum());
            // 遍历每行数据，将其插入到数据库中
            CS cs = new CS();
            for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                Row row = sheet.getRow(i);
                String id = row.getCell(0).getStringCellValue();
                String name = row.getCell(1).getStringCellValue();
                String sex = row.getCell(2).getStringCellValue();
                String phone = row.getCell(3).getStringCellValue();
                String email = row.getCell(4).getStringCellValue();
                String address = row.getCell(5).getStringCellValue();
                String kind = row.getCell(6).getStringCellValue();
                String remark = row.getCell(7).getStringCellValue();
                String stringDate = row.getCell(8).getStringCellValue();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                sdf.setTimeZone(TimeZone.getTimeZone("GMT"));
                try {
                    java.util.Date date = sdf.parse(stringDate);
                    java.sql.Date addtime = new java.sql.Date(date.getTime());
                    cs.setCs_addtime(addtime);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                // 其他客户信息字段
                cs.setCs_id(id);
                cs.setCs_name(name);
                cs.setCs_sex(sex);
                cs.setCs_phone(phone);
                cs.setCs_email(email);
                cs.setCs_address(address);
                cs.setCs_kind(kind);
                cs.setCs_remark(remark);
//                cs.setCs_addtime(addtime);
                new DB().addCs(cs);
            }
            // 返回成功消息，并重定向到主页面
            response.sendRedirect("main.jsp");
        } else if (fileName.endsWith(".csv")) {
            // 解析 CSV 文件
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
            String line;
            CS cs = new CS();
            while ((line = reader.readLine()) != null) {
                String[] values = line.split(",");
                String id = values[0];
                String name = values[1];
                String sex = values[2];
                String phone = values[3];
                String email = values[4];
                String address = values[5];
                String kind = values[6];
                String remark = values[7];
                String  dateString = values[8];
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateFormat.setTimeZone(TimeZone.getTimeZone("GMT"));
                try {
                    java.util.Date date = dateFormat.parse(dateString);
                    java.sql.Date addtime = new java.sql.Date(date.getTime());
                    cs.setCs_addtime(addtime);
                } catch (ParseException e) {
                    throw new RuntimeException(e);
                }
                cs.setCs_id(id);
                cs.setCs_name(name);
                cs.setCs_sex(sex);
                cs.setCs_phone(phone);
                cs.setCs_email(email);
                cs.setCs_address(address);
                cs.setCs_kind(kind);
                cs.setCs_remark(remark);
                new DB().addCs(cs);
            }
            // 返回成功消息，并重定向到主页面
            response.sendRedirect("main.jsp?message=导入客户信息成功！");
        }

    }
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request,response);
    }
}
