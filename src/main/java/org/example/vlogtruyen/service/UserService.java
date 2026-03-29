package org.example.vlogtruyen.service;

import org.example.vlogtruyen.dao.UserDAO;
import org.example.vlogtruyen.model.User;
import org.mindrot.jbcrypt.BCrypt;

import java.sql.SQLException;

public class UserService {
   private  UserDAO userDAO = new UserDAO();

    public void register(User user) throws SQLException {

        String hashedPassword = BCrypt.hashpw(user.getPassword(), BCrypt.gensalt());
        user.setPassword(hashedPassword);
        user.setRole(2);
        userDAO.insertUser(user);
    }

    public User login(String username, String password) throws SQLException {
        User user = userDAO.findByUsername(username);
        if (user != null && BCrypt.checkpw(password, user.getPassword())) {
            return user;
        }
        return null;
    }

}
