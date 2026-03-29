package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.User;

import java.sql.SQLException;
import java.util.List;

public interface IUserDAO {

    public void insertUser(User user) throws SQLException;

    public User getUser(int id) throws SQLException;

    public boolean updateUser(User user) throws SQLException;

    public boolean deleteUser(int id) throws SQLException;

    public List<User> getAllUsers() throws SQLException;
}
