package org.example.vlogtruyen.model;

public class ChapterImages {
    private int id;
    private int chapterId;
    private String image_url;
    private int image_order;

    public ChapterImages(){};

    public ChapterImages(int chapterId, String image_url, int image_order) {
        this.chapterId = chapterId;
        this.image_url = image_url;
        this.image_order = image_order;
    }

    public ChapterImages(int chapterId, String image_url) {
        this.chapterId = chapterId;
        this.image_url = image_url;
    }

    public ChapterImages(int id, int chapterId, String image_url, int image_order) {
        this.id = id;
        this.chapterId = chapterId;
        this.image_url = image_url;
        this.image_order = image_order;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getChapterId() {
        return chapterId;
    }

    public void setChapterId(int chapterId) {
        this.chapterId = chapterId;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public int getImage_order() {
        return image_order;
    }

    public void setImage_order(int image_order) {
        this.image_order = image_order;
    }
}
