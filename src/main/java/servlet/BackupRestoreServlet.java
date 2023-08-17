package servlet;

import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class BackupRestoreServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action != null && action.equals("backup")) {
            // 执行备份操作
            performBackup(response);
        }
        if (action != null && action.equals("import")) {
            // 执行导入操作
            performImport(request);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    private void performBackup(HttpServletResponse response) throws IOException {
        String dbName = "customer";
        String dbUser = "root";
        String dbPass = "root";

        response.setContentType("application/octet-stream");
        response.setHeader("Content-Disposition", "attachment;filename=backup.sql");

        try (OutputStream out = response.getOutputStream()) {
            Process process = Runtime.getRuntime().exec("C:/Program Files/MySQL/MySQL Server 8.0/bin/mysqldump -u " + dbUser + " -p" + dbPass + " " + dbName);
            InputStream inputStream = process.getInputStream();

            int bytesRead;
            byte[] buffer = new byte[4096];

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                out.write(buffer, 0, bytesRead);
            }

            inputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void performImport(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("backupFile"); // Assuming the file is uploaded via a form with a file input named "backupFile"
        InputStream fileStream = filePart.getInputStream();

        // Replace the following variables with your database credentials
        String dbName = "customer";
        String dbUser = "root";
        String dbPass = "root";

        try {
            // Restore the database using the input stream containing the backup file
            Process process = Runtime.getRuntime().exec("C:/Program Files/MySQL/MySQL Server 8.0/bin/mysql -u " + dbUser + " -p" + dbPass + " " + dbName);
            OutputStream outputStream = process.getOutputStream();

            int bytesRead;
            byte[] buffer = new byte[4096];

            while ((bytesRead = fileStream.read(buffer)) != -1) {
                outputStream.write(buffer, 0, bytesRead);
            }

            outputStream.close();
            fileStream.close();


        } catch (IOException e) {
            e.printStackTrace();

        }
    }
}