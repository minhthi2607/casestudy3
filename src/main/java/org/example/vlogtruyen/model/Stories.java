package org.example.vlogtruyen.model;

import java.time.LocalDateTime;

public class Stories {
    private int id;
    private String title;
    private String author;
    private String description;
    private String cover_image;
    private String status;
    private LocalDateTime created_at;

    public Stories() {
    }

    public Stories(int id, String title, String author, String description, String cover_image, String status) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.description = description;
        this.cover_image = cover_image;
        this.status = status;
    }

    public Stories(String title, String author, String description, String cover_image, String status) {
        this.title = title;
        this.author = author;
        this.description = description;
        this.cover_image = cover_image;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String gettitle() {
        return title;
    }

    public void settitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCover_image() {
        return cover_image;
    }

    public void setCover_image(String cover_image) {
        this.cover_image = cover_image;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }
}
