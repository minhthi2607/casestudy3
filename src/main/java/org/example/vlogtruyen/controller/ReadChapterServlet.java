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
import java.util.List;

@WebServlet("/read-chapter")
public class ReadChapterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private ChaptersDAO chaptersDAO = new ChaptersDAO();
    private StoriesDAO storiesDAO = new StoriesDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            int chapterId = Integer.parseInt(request.getParameter("id"));
            Chapters chapter = chaptersDAO.getChapterById(chapterId);
            if (chapter == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Chương không tồn tại");
                return;
            }

            Stories story = storiesDAO.getStoryById(chapter.getStory_id());
            List<Chapters> chapterList = chaptersDAO.getChaptersByStoryId(chapter.getStory_id());
            Chapters nextChapter = chaptersDAO.getNextChapter(chapter.getChapter_number(), chapter.getStory_id());
            Chapters prevChapter = chaptersDAO.getPreviousChapter(chapter.getChapter_number(), chapter.getStory_id());

            request.setAttribute("chapter", chapter);
            request.setAttribute("story", story);
            request.setAttribute("chapterList", chapterList);
            request.setAttribute("nextChapter", nextChapter);
            request.setAttribute("prevChapter", prevChapter);

            request.getRequestDispatcher("/home/read-chapter.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID chương không hợp lệ");
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
