package org.example.vlogtruyen.dao;

import org.example.vlogtruyen.model.Stories;

import java.sql.SQLException;
import java.util.List;

public interface IStoriesDAO {
    public void insertStories(Stories stories) throws SQLException;

    public List<Stories> getAllStories() throws SQLException;

    public Stories getStoryById(int id) throws SQLException;

    public boolean updateStories(Stories stories) throws SQLException;

    public boolean deleteStories(int id) throws SQLException;

    public List<Stories> getStoriesByAuthor(String author) throws SQLException;

    public List<Stories> getStoriesByTitle(String title) throws SQLException;

}
