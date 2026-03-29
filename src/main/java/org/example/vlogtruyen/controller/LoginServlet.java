package org.example.vlogtruyen.controller;

import org.example.vlogtruyen.model.User;
import org.example.vlogtruyen.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private UserService userService = new UserService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        try{
            User user = userService.login(username, password);
            if(user != null){

                if(user.getRole() == 1){
                    request.getSession().setAttribute("admin", user);
                    response.sendRedirect(request.getContextPath() + "/admin");
                }else{
                    HttpSession session = request.getSession();
                    session.setAttribute("user", user);
                    response.sendRedirect(request.getContextPath() + "/");
                }
            }else{
                request.setAttribute("error", "Sai tài khoản hoặc mật khẩu");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
