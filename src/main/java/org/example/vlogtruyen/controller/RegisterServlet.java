package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.model.User;
import org.example.vlogtruyen.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private UserService userService = new UserService();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Mật khẩu không khớp");
            request.getRequestDispatcher("index.jsp").forward(request, response);
            return;
        }

        try{
            User user = new User();
            user.setUsername(username);
            user.setPassword(password);
            userService.register(user);
            response.sendRedirect("index.jsp");
        }catch (Exception e){
            e.printStackTrace();
        }

    }

}
