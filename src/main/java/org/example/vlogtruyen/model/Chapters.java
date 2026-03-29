package org.example.vlogtruyen.model;

import java.time.LocalDateTime;
import java.util.List;

public class Chapters {
    private int id;
    private int story_id;
    private String name;
    private int chapter_number;
    private LocalDateTime created_at;
    private List<ChapterImages> images;
    public Chapters() {

    }
    //get chapter
    public Chapters(int id, int story_id, String name, int chapter_number, LocalDateTime created_at) {
        this.id = id;
        this.story_id = story_id;
        this.name = name;
        this.chapter_number = chapter_number;
        this.created_at = created_at;
    }
    //update chapter
    public Chapters(int id, int story_id, String name, int chapter_number) {
        this.id = id;
        this.story_id = story_id;
        this.name = name;
        this.chapter_number = chapter_number;
    }

    //create chapter
    public Chapters(int story_id, String name, int chapter_number) {
        this.story_id = story_id;
        this.name = name;
        this.chapter_number = chapter_number;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getStory_id() {
        return story_id;
    }

    public void setStory_id(int story_id) {
        this.story_id = story_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getChapter_number() {
        return chapter_number;
    }

    public void setChapter_number(int chapter_number) {
        this.chapter_number = chapter_number;
    }

    public LocalDateTime getCreated_at() {
        return created_at;
    }

    public void setCreated_at(LocalDateTime created_at) {
        this.created_at = created_at;
    }

    public List<ChapterImages> getImages() {
        return images;
    }

    public void setImages(List<ChapterImages> images) {
        this.images = images;
    }

    @Override
    public String toString() {
        return "Chapters{" +
                "id=" + id +
                ", story_id=" + story_id +
                ", name='" + name + '\'' +
                ", chapter_number=" + chapter_number +
                ", created_at=" + created_at +
                ", images=" + images +
                '}';
    }
}
