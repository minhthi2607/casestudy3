package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.ChapterImages;
import org.example.vlogtruyen.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ChapterImagesDAO implements IChapterImagesDAO {

    private static final String INSERT_CHAPTER_IMAGE =
            "INSERT INTO chapter_images (chapter_id, image_url, image_order) VALUES (?, ? , ?)";
    private static final String DELETE_CHAPTER_IMAGE = "DELETE FROM chapter_images WHERE id = ?";
    private static final String GET_ALL_CHAPTER_IMAGE = "SELECT * FROM chapter_images WHERE chapter_id = ?";
    private static final String UPDATE_CHAPTER_IMAGE = "UPDATE chapter_images SET image_url = ? WHERE id = ?";
    private static final String GET_CHAPTER_IMAGE_BY_ID = "SELECT * FROM chapter_images WHERE id = ?";

    public ChapterImagesDAO() {
    };

    @Override
    public void insertChapterImages(ChapterImages chapterImages) throws SQLException {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_CHAPTER_IMAGE)) {
            statement.setInt(1, chapterImages.getChapterId());
            statement.setString(2, chapterImages.getImage_url());
            statement.setInt(3, chapterImages.getImage_order());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public List<ChapterImages> getAllChapterImages(int chapter_id) throws SQLException {
        List<ChapterImages> chapterImagesList = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_ALL_CHAPTER_IMAGE)) {
            statement.setInt(1, chapter_id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int id_chapter = rs.getInt("chapter_id");
                String image_url = rs.getString("image_url");
                int image_order = rs.getInt("image_order");
                chapterImagesList.add(new ChapterImages(id, id_chapter, image_url, image_order));
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return chapterImagesList;
    }

    @Override
    public boolean updateChapterImages(ChapterImages chapterImages) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CHAPTER_IMAGE)) {
            statement.setString(1, chapterImages.getImage_url());
            statement.setInt(2, chapterImages.getId());
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;

    }

    @Override
    public boolean deleteChapterImages(int id) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CHAPTER_IMAGE)) {
            statement.setInt(1, id);
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
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

    @Override
    public ChapterImages getChapterImagesById(int id) throws SQLException {
        ChapterImages chapterImages = null;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_CHAPTER_IMAGE_BY_ID)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                int id_chapter = rs.getInt("chapter_id");
                String image_url = rs.getString("image_url");
                int image_order = rs.getInt("image_order");
                chapterImages = new ChapterImages(id, id_chapter, image_url, image_order);
            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return chapterImages;
    }
}
