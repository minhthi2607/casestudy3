package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.dao.ChaptersDAO;
import org.example.vlogtruyen.dao.StoriesDAO;
import org.example.vlogtruyen.model.Chapters;
import org.example.vlogtruyen.model.Stories;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/story-detail")
public class StoryDetail extends HttpServlet {

    private StoriesDAO storiesDAO = new StoriesDAO();
    private ChaptersDAO chapterDAO = new ChaptersDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }
        try {
            Stories story = storiesDAO.getStoryById(id);
            if (story == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND);
                return;
            }
            List<Chapters> chapters = chapterDAO.getChaptersByStoryId(id);
            request.setAttribute("chapters", chapters);
            request.setAttribute("story", story);
            request.getRequestDispatcher("/home/story-detail.jsp").forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
