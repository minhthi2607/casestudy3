package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.dao.StoriesDAO;
import org.example.vlogtruyen.model.Stories;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "homeServlet", value = "")
public class HomeServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private StoriesDAO storiesDAO = new StoriesDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        List<Stories> stories = null;
        try {
            stories = storiesDAO.getAllStories();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        request.setAttribute("stories", stories);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }
}
