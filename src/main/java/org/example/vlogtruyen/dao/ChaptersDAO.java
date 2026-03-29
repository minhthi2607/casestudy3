package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.ChapterImages;
import org.example.vlogtruyen.model.Chapters;
import org.example.vlogtruyen.utils.DBConnection;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

public class ChaptersDAO implements IChaptersDAO {
    private static final String INSERT_CHAPTER = "INSERT INTO chapters (story_id, name, chapter_number) VALUES (?, ?, ?)";
    private static final String DELETE_CHAPTER = "DELETE FROM chapters WHERE id = ?";
    private static final String UPDATE_CHAPTER = "UPDATE chapters SET story_id = ?, name = ?, chapter_number = ? WHERE id = ?";
    private static final String GET_CHAPTERS_BY_STORY_ID = "SELECT * FROM chapters WHERE story_id = ? order by chapter_number desc";
    private static final String GET_CHAPTERS_BY_ID = "SELECT * FROM chapters WHERE id = ?";
    private static final String GET_CHAPTER_IMAGES_BY_CHAPTER_ID = "SELECT * FROM chapter_images WHERE chapter_id = ? order by image_order asc";
    private static final String GET_NEXT_CHAPTER = "SELECT * FROM chapters WHERE story_id = ? AND chapter_number > ? ORDER BY chapter_number ASC LIMIT 1";
    private static final String GET_PREV_CHAPTER = "SELECT * FROM chapters WHERE story_id = ? AND chapter_number < ? ORDER BY chapter_number DESC LIMIT 1";

    public ChaptersDAO() {
    }

    ;

    @Override
    public void insertChapters(Chapters chapters) throws SQLException {
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(INSERT_CHAPTER)) {
            statement.setInt(1, chapters.getStory_id());
            statement.setString(2, chapters.getName());
            statement.setInt(3, chapters.getChapter_number());
            statement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
        }
    }

    @Override
    public boolean updateChapters(Chapters chapters) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(UPDATE_CHAPTER)) {
            statement.setInt(1, chapters.getStory_id());
            statement.setString(2, chapters.getName());
            statement.setInt(3, chapters.getChapter_number());
            statement.setInt(4, chapters.getId());
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public boolean deleteChapters(int id) throws SQLException {
        boolean result = false;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(DELETE_CHAPTER)) {
            statement.setInt(1, id);
            result = statement.executeUpdate() > 0;
        } catch (SQLException e) {
            printSQLException(e);
        }
        return result;
    }

    @Override
    public List<Chapters> getChaptersByStoryId(int id_story) throws SQLException {
        List<Chapters> chapters = new ArrayList<>();
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statement = connection.prepareStatement(GET_CHAPTERS_BY_STORY_ID)) {
            statement.setInt(1, id_story);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                int story_id = rs.getInt("story_id");
                String name = rs.getString("name");
                int chapter_number = rs.getInt("chapter_number");
                LocalDateTime created_at = rs.getTimestamp("created_at").toLocalDateTime();
                chapters.add(new Chapters(id, story_id, name, chapter_number, created_at));

            }
        } catch (SQLException e) {
            printSQLException(e);
        }
        return chapters;
    }

    @Override
    public Chapters getChapterById(int id) throws SQLException {
        Chapters chapter = null;
        try (Connection connection = DBConnection.getConnection(); PreparedStatement statementChapter = connection.prepareStatement(GET_CHAPTERS_BY_ID)) {
            statementChapter.setInt(1, id);
            ResultSet rs = statementChapter.executeQuery();

            if (rs.next()) {
                chapter = new Chapters(
                        rs.getInt("id"),
                        rs.getInt("story_id"),
                        rs.getString("name"),
                        rs.getInt("chapter_number"),
                        rs.getTimestamp("created_at").toLocalDateTime());
            }
            if (chapter != null) {
                try (PreparedStatement statementChapterImages = connection.prepareStatement(GET_CHAPTER_IMAGES_BY_CHAPTER_ID)) {
                    statementChapterImages.setInt(1, id);
                    try (ResultSet rsChapterImages = statementChapterImages.executeQuery()) {
                        List<ChapterImages> images = new ArrayList<>();
                        while (rsChapterImages.next()) {
                            int id_chapter_images = rsChapterImages.getInt("id");
                            int id_chapter = rsChapterImages.getInt("chapter_id");
                            String image_url = rsChapterImages.getString("image_url");
                            int id_image_order = rsChapterImages.getInt("image_order");
                            images.add(new ChapterImages(id_chapter_images, id_chapter, image_url, id_image_order));
                        }
                        chapter.setImages(images);
                    }
                }
            }
        }
        return chapter;

    }

    @Override
    public Chapters getNextChapter(int currentChapterNumber, int storyId) throws SQLException {
        Chapters chapter = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_NEXT_CHAPTER)) {
            statement.setInt(1, storyId);
            statement.setInt(2, currentChapterNumber);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    chapter = new Chapters(
                            rs.getInt("id"),
                            rs.getInt("story_id"),
                            rs.getString("name"),
                            rs.getInt("chapter_number"),
                            rs.getTimestamp("created_at").toLocalDateTime());
                }
            }
        }
        return chapter;
    }

    @Override
    public Chapters getPreviousChapter(int currentChapterNumber, int storyId) throws SQLException {
        Chapters chapter = null;
        try (Connection connection = DBConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(GET_PREV_CHAPTER)) {
            statement.setInt(1, storyId);
            statement.setInt(2, currentChapterNumber);
            try (ResultSet rs = statement.executeQuery()) {
                if (rs.next()) {
                    chapter = new Chapters(
                            rs.getInt("id"),
                            rs.getInt("story_id"),
                            rs.getString("name"),
                            rs.getInt("chapter_number"),
                            rs.getTimestamp("created_at").toLocalDateTime());
                }
            }
        }
        return chapter;
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
