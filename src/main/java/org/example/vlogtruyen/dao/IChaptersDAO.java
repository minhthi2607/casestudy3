package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.Chapters;

import java.sql.SQLException;
import java.util.List;

public interface IChaptersDAO {
    public void insertChapters(Chapters chapters) throws SQLException;

    public boolean updateChapters(Chapters chapters) throws SQLException;

    public boolean deleteChapters(int id) throws SQLException;

    List<Chapters> getChaptersByStoryId(int id_story) throws SQLException;

    Chapters getChapterById(int id) throws SQLException;

    Chapters getNextChapter(int currentChapterNumber, int storyId) throws SQLException;

    Chapters getPreviousChapter(int currentChapterNumber, int storyId) throws SQLException;
}
