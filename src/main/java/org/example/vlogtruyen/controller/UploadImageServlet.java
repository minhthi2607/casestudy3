package org.example.vlogtruyen.controller;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.UUID;

@WebServlet("/upload-image")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int chapterId = Integer.parseInt(request.getParameter("chapter_id"));
            Part part = request.getPart("image");

            if (part == null || part.getSize() == 0) {
                response.getWriter().write("No file");
                return;
            }

            String uploadDir = getServletContext().getRealPath("")
                    + File.separator + "uploads"
                    + File.separator + chapterId;

            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String fileName = UUID.randomUUID() + "_" +
                    Paths.get(part.getSubmittedFileName()).getFileName().toString();

            part.write(uploadDir + File.separator + fileName);

            response.getWriter().write("OK");

        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("FAIL");
        }
    }
}