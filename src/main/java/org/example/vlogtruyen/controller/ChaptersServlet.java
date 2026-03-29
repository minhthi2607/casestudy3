package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.dao.ChapterImagesDAO;
import org.example.vlogtruyen.dao.ChaptersDAO;
import org.example.vlogtruyen.dao.StoriesDAO;
import org.example.vlogtruyen.model.ChapterImages;
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
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.UUID;

@WebServlet(name = "chaptersServlet", urlPatterns = "/admin/stories/chapter")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 5,
        maxFileSize = 1024 * 1024 * 100,
        maxRequestSize = 1024 * 1024 * 1024
)
public class ChaptersServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StoriesDAO storiesDAO = new StoriesDAO();
    private ChaptersDAO chaptersDAO = new ChaptersDAO();
    private ChapterImagesDAO chapterImageDAO = new ChapterImagesDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        try {
            switch (action) {
                case "create":
                    showCreateForm(request, response);
                    break;
                case "delete":
                    removeChapter(request, response);
                    break;
                case "edit":
                    showEditForm(request, response);
                    break;
                case "deleteImage":
                    deleteChapterImage(request, response);
                    break;
                    case "view":
                        viewChapter(request, response);
                        break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }


    }

    private void viewChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException , SQLException{
        int id = Integer.parseInt(request.getParameter("id"));
        Chapters chapter = chaptersDAO.getChapterById(id);
        request.setAttribute("chapter", chapter);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/chapters/view.jsp");
        dispatcher.forward(request, response);
    }

    private void deleteChapterImage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        int chapter_id = Integer.parseInt(request.getParameter("chapter_id"));
        chapterImageDAO.deleteChapterImages(id);
        response.sendRedirect(request.getContextPath() + "/admin/stories/chapter?action=edit&id=" + chapter_id);

    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        Chapters chapter = chaptersDAO.getChapterById(id);
        request.setAttribute("chapter", chapter);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/chapters/edit.jsp");
        dispatcher.forward(request, response);

    }

    private void removeChapter(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {

        int id = Integer.parseInt(request.getParameter("id"));
        String storyId = request.getParameter("story_id");

        chaptersDAO.deleteChapters(id);

        response.sendRedirect(request.getContextPath() +
                "/admin/stories?action=view&id=" + storyId);
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String storyIdParam = request.getParameter("story_id");
        if (storyIdParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Missiong story_id");
            return;
        }
        int storyId = Integer.parseInt(storyIdParam);

        Stories story = null;
        try {
            story = storiesDAO.getStoryById(storyId);
            if (story == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Story not found");
                return;
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        request.setAttribute("story", story);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/admin/chapters/create.jsp");
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
                    insertChapter(request, response);
                    break;
                case "update_chapter":
                    updateChapter(request, response);
                    break;
                case "uploadSingle":
                    uploadSingleImage(request, response);
                    break;
                case "replaceImage":
                    replaceImage(request, response);
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private void updateChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        int storyId = Integer.parseInt(request.getParameter("story_id"));
        String name = request.getParameter("name");
        int chapterNumber = Integer.parseInt(request.getParameter("chapter_number"));
        Chapters chapter = new Chapters(id, storyId, name, chapterNumber);
        chaptersDAO.updateChapters(chapter);
        response.sendRedirect(request.getContextPath() + "/admin/stories?action=view&id=" + storyId);
    }

    private void insertChapter(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int storyId = Integer.parseInt(request.getParameter("story_id"));
        int chapterNumber = Integer.parseInt(request.getParameter("chapter_number"));
        String chapterName = request.getParameter("name");

        System.out.println("storyId = " + storyId);
        System.out.println("chapterNumber = " + chapterNumber);
        System.out.println("chapterName = " + chapterName);

        Chapters chapter = new Chapters(storyId, chapterName, chapterNumber);
        chaptersDAO.insertChapters(chapter);

        response.sendRedirect(request.getContextPath() + "/admin/stories?action=view&id=" + storyId);
    }


    private void uploadSingleImage(HttpServletRequest request, HttpServletResponse response)
            throws IOException, ServletException {

        try {
            int chapterId = Integer.parseInt(request.getParameter("chapter_id"));
            int order = Integer.parseInt(request.getParameter("image_order"));
            Part part = request.getPart("image");

            if (part == null || part.getSize() == 0) {
                response.setStatus(400);
                response.getWriter().write("No file");
                return;
            }

            String uploadBase = System.getenv("VLOGTRUYEN_UPLOAD_PATH");
            if (uploadBase == null || uploadBase.isEmpty()) {
                uploadBase = new File("").getAbsolutePath() + File.separator + "uploads";
            }

            String uploadDir = uploadBase + File.separator + "chapters" + File.separator + chapterId;
            File dir = new File(uploadDir);
            if (!dir.exists()) dir.mkdirs();

            String originalName = Paths.get(part.getSubmittedFileName())
                    .getFileName().toString();

            String fileName = UUID.randomUUID() + "_" + originalName;

            part.write(uploadDir + File.separator + fileName);

            String imagePath = "uploads/chapters/" + chapterId + "/" + fileName;
            ChapterImages img = new ChapterImages(chapterId, imagePath, order);
            chapterImageDAO.insertChapterImages(img);

            response.setContentType("application/json");
            response.getWriter().write("{\"status\":\"ok\",\"path\":\"" + imagePath + "\"}");

        } catch (Exception e) {
            response.setStatus(500);
            response.getWriter().write("{\"status\":\"error\"}");
        }
    }

    private void replaceImage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int imageId = Integer.parseInt(request.getParameter("image_id"));
        Part part = request.getPart("image");
        if (part == null || part.getSize() == 0) {
            response.setStatus(400);
            return;
        }
        ChapterImages oldImg = chapterImageDAO.getChapterImagesById(imageId);
        String uploadBase = System.getenv("VLOGTRUYEN_UPLOAD_PATH");
        if (uploadBase == null || uploadBase.isEmpty()) {
            uploadBase = new File("").getAbsolutePath() + File.separator + "uploads";
        }
        String uploadDir = uploadBase + File.separator + "chapters" + File.separator + oldImg.getChapterId();
        File dir = new File(uploadDir);
        if (!dir.exists()) dir.mkdirs();
        String newFileName = UUID.randomUUID() + "_" + part.getSubmittedFileName();
        part.write(uploadDir + File.separator + newFileName);
        String newPath = "uploads/chapters/" + oldImg.getChapterId() + "/" + newFileName;
        ChapterImages newImg = new ChapterImages();
        newImg.setId(imageId);
        newImg.setImage_url(newPath);
        boolean updated = chapterImageDAO.updateChapterImages(newImg);
        if (updated) {
            File oldFile = new File(uploadBase + File.separator + oldImg.getImage_url());
            if (oldFile.exists()) oldFile.delete();
        }
        response.setStatus(200);
    }

}
