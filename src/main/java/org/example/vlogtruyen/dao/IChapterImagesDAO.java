package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.ChapterImages;

import java.sql.SQLException;
import java.util.List;

public interface IChapterImagesDAO {
    public void insertChapterImages(ChapterImages chapterImages) throws SQLException;

    public List<ChapterImages> getAllChapterImages(int chapter_id) throws SQLException;

    public boolean updateChapterImages(ChapterImages chapterImages) throws SQLException;

    public boolean deleteChapterImages(int id) throws SQLException;

    public ChapterImages getChapterImagesById(int id) throws SQLException;


}
