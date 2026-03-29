package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.dao.ChaptersDAO;
import org.example.vlogtruyen.dao.StoriesDAO;
import org.example.vlogtruyen.model.Chapters;
import org.example.vlogtruyen.model.Stories;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "storiesServlet", value = "/admin/stories")
@MultipartConfig
public class StoriesServlet extends HttpServlet {

    private StoriesDAO storiesDAO = new StoriesDAO();
    private ChaptersDAO chaptersDAO = new ChaptersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "edit":
                    showEditForm(request, response);
                    break;
                case "delete":
                    deleteStory(request, response);
                    break;
                case "view":
                    viewStory(request, response);
                     break;
                default:
                    listStories(request, response);
                    break;
            }

        } catch (SQLException e) {
            throw new ServletException(e);
        }

    }

    private void viewStory(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException{
        int id = Integer.parseInt(request.getParameter("id"));
        Stories story = storiesDAO.getStoryById(id);
        List<Chapters> chapters = chaptersDAO.getChaptersByStoryId(id);
        request.setAttribute("story", story);
        request.setAttribute("chapters", chapters);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/stories/view.jsp");
        dispatcher.forward(request, response);
    }

    private void listStories(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        List<Stories> stories = storiesDAO.getAllStories();
        request.setAttribute("stories", stories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/stories/list.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Stories story = storiesDAO.getStoryById(id);
        request.setAttribute("story", story);
        RequestDispatcher dispatcher = request.getRequestDispatcher("stories/edit.jsp");
        dispatcher.forward(request, response);

    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }

        try {
            switch (action) {
                case "create":
                    insertStory(request, response);
                    break;
                case "update":

                    updateStory(request, response);
                    break;
                case "delete":
                    deleteStory(request, response);
                    break;
                default:
                    break;

            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    private void deleteStory(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        storiesDAO.deleteStories(id);
        response.sendRedirect(request.getContextPath() + "/admin/stories");
    }

    private void insertStory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        Result result = getResult(request);
        String fileName = "";
        if (result.filePart != null && result.filePart.getSize() > 0) {
            String originalFileName = Paths.get(result.filePart.getSubmittedFileName()).getFileName().toString();
            fileName = System.currentTimeMillis() + "_" + originalFileName;
            String uploadPath = System.getenv("VLOGTRUYEN_UPLOAD_PATH");
            if (uploadPath == null || uploadPath.isEmpty()) {
                uploadPath = new File("").getAbsolutePath() + File.separator + "uploads";
            }
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            result.filePart.write(uploadPath + File.separator + fileName);
        }
        String cover_image = fileName != null ? "uploads/" + fileName : null;
        Stories stories = new Stories(result.title, result.author, result.description, cover_image, result.status);
        storiesDAO.insertStories(stories);
        response.sendRedirect(request.getContextPath() + "/admin/stories");
    }
    private void updateStory(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Result result = getResult(request);
        String fileName;
        String cover_image;
        if (result.filePart != null && result.filePart.getSize() > 0) {
            String originalFileName = Paths.get(result.filePart.getSubmittedFileName()).getFileName().toString();
            fileName = System.currentTimeMillis() + "_" + originalFileName;

            String uploadPath = System.getenv("VLOGTRUYEN_UPLOAD_PATH");
            if (uploadPath == null || uploadPath.isEmpty()) {
                uploadPath = new File("").getAbsolutePath() + File.separator + "uploads";
            }
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) uploadDir.mkdirs();
            result.filePart.write(uploadPath + File.separator + fileName);

            cover_image = "uploads/" + fileName;
        } else {
            cover_image = request.getParameter("current_cover_image");
        }
        Stories stories = new Stories(id, result.title, result.author, result.description, cover_image, result.status);
        storiesDAO.updateStories(stories);
        response.sendRedirect(request.getContextPath() + "/admin/stories");
    }
    private static Result getResult(HttpServletRequest request) throws IOException, ServletException {
        String title = request.getParameter("title");
        String author = request.getParameter("author");
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        Part filePart = request.getPart("cover_image");
        String fileName = null;
        Result result = new Result(title, author, description, status, filePart);
        return result;
    }
    private static class Result {
        public final String title;
        public final String author;
        public final String description;
        public final String status;
        public final Part filePart;
        public Result(String title, String author, String description, String status, Part filePart) {
            this.title = title;
            this.author = author;
            this.description = description;
            this.status = status;
            this.filePart = filePart;
        }
    }


}
