package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.Stories;
import org.example.vlogtruyen.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class StoriesDAO implements IStoriesDAO {

    private static final String INSERT_STORIES = "INSERT INTO stories (title, author, description, cover_image, status) VALUES (?, ?, ?, ?, ?)";
    private static final String GET_STORIES = "SELECT * FROM stories WHERE id = ?";
    private static final String UPDATE_STORIES = "UPDATE stories SET title = ?, author = ?, description = ?, cover_image = ?, status = ? WHERE id = ?";
    private static final String DELETE_STORIES = "DELETE FROM stories WHERE id = ?";
    private static final String GET_ALL_STORIES = "SELECT * FROM stories order by id desc";
    private static final String GET_STORIES_BY_AUTHOR = "SELECT * FROM stories WHERE author  Like ?";
    private static final String GET_STORIES_BY_TITLE = "SELECT * FROM stories WHERE title  Like ?";


    public StoriesDAO() {
    }

    @Override
    public void insertStories(Stories stories) throws SQLException {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_STORIES)) {
            statement.setString(1, stories.gettitle());
            statement.setString(2, stories.getAuthor());
            statement.setString(3, stories.getDescription());
            statement.setString(4, stories.getCover_image());
            statement.setString(5, stories.getStatus());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<Stories> getAllStories() throws SQLException {
        List<Stories> stories = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_ALL_STORIES)) {
            getStories(stories, statement);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return stories;

    }

    private void getStories(List<Stories> stories, PreparedStatement statement) throws SQLException {
        ResultSet rs = statement.executeQuery();
        while (rs.next()) {
            int id = rs.getInt("id");
            String title = rs.getString("title");
            String author = rs.getString("author");
            String description = rs.getString("description");
            String cover_image = rs.getString("cover_image");
            String status = rs.getString("status");
            stories.add(new Stories(id, title, author, description, cover_image, status));
        }
    }

    @Override
    public Stories getStoryById(int id) throws SQLException {
        Stories stories = null;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_STORIES)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                stories = new Stories(rs.getInt("id"), rs.getString("title"), rs.getString("author"), rs.getString("description"), rs.getString("cover_image"), rs.getString("status"));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return stories;
    }

    @Override
    public boolean updateStories(Stories stories) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_STORIES)) {
            statement.setString(1, stories.gettitle());
            statement.setString(2, stories.getAuthor());
            statement.setString(3, stories.getDescription());
            statement.setString(4, stories.getCover_image());
            statement.setString(5, stories.getStatus());
            statement.setInt(6, stories.getId());
            result = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public boolean deleteStories(int id) throws SQLException {
        boolean result = false;

        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_STORIES)) {
            statement.setInt(1, id);
            result = statement.executeUpdate() > 0;

        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public List<Stories> getStoriesByAuthor(String search) throws SQLException {
        List<Stories> stories = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_STORIES_BY_AUTHOR)) {
            statement.setString(1, "%" + search + "%");
            getStories(stories, statement);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return stories;
    }

    @Override
    public List<Stories> getStoriesByTitle(String search) throws SQLException {
        List<Stories> stories = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_STORIES_BY_TITLE)) {
            statement.setString(1, "%" + search + "%");
            getStories(stories, statement);
        } catch (SQLException e) {
            printSQLException(e);
        }
        return stories;
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
