package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.User;
import org.example.vlogtruyen.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class UserDAO implements IUserDAO {

    private static final String INSERT_USER = "INSERT INTO users (username, password, role) VALUES (?, ?, ?)";
    private static final String GET_USER = "SELECT * FROM users WHERE id = ?";
    private static final String UPDATE_USER = "UPDATE users SET username = ?, password = ? WHERE id = ?";
    private static final String DELETE_USER = "DELETE FROM users WHERE id = ?";
    private static final String GET_ALL_USER = "SELECT * FROM users";
    private static final String GET_USER_BY_USERNAME = "SELECT * FROM users WHERE username = ?";

    public UserDAO() {
    }

    @Override
    public void insertUser(User user) throws SQLException {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_USER)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setInt(3, user.getRole());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public User getUser(int id) throws SQLException {
        User user = null;

        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_USER)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                String username = rs.getString("username");
                user = new User(username);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    @Override
    public boolean updateUser(User user) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_USER)) {
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            statement.setInt(3, user.getId());
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;

    }

    @Override
    public boolean deleteUser(int id) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_USER)) {
            statement.setInt(1, id);
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public List<User> getAllUsers() throws SQLException {
        List<User> users = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_ALL_USER)) {
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String username = rs.getString("username");
                users.add(new User(id, username));
            }

        } catch (SQLException e) {
            printSQLException(e);
        }
        return users;
    }

    public User findByUsername(String search) throws SQLException {
        User user = null;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_USER_BY_USERNAME)) {
            statement.setString(1, search);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {

                String username = rs.getString("username");
                String password = rs.getString("password");
                int role = rs.getInt("role");
                user = new User(username, password, role);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return user;
    }

    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
