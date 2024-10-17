package com.example.badwords.model;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity // Marks this class as a JPA entity, meaning it is mapped to a database table
@Table(name = "bad_words") // Specifies the database table name
public class BadWord {

    // Use @Id to designate the primary key
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Defines the primary key generation strategy (auto-increment)
    @Column(name = "Bad_words_id") // Maps this field to the "Bad_words_id" column in the database
    private int badWordsId; // Renamed for proper Java naming conventions

    @Column(name = "word", nullable = false) // Maps this field to the "word" column, making it non-nullable
    private String word;

    @Column(name = "user_id", nullable = false) // Maps this field to the "user_id" column, making it non-nullable
    private int userId;

    @Column(name = "create_time", nullable = false) // Maps this field to the "create_time" column, making it non-nullable
    private LocalDateTime createTime;

    // Default constructor required by JPA
    public BadWord() {}

    // Constructor to initialise the word and userId, createTime is set automatically
    public BadWord(String word, int userId) {
        this.word = word;
        this.userId = userId;
        this.createTime = LocalDateTime.now();
    }

    // Getter and setter for badWordsId
    public int getBadWordsId() {
        return badWordsId;
    }

    public void setBadWordsId(int badWordsId) {
        this.badWordsId = badWordsId;
    }

    // Getter and setter for word
    public String getWord() {
        return word;
    }

    public void setWord(String word) {
        this.word = word;
    }

    // Getter and setter for userId
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    // Getter and setter for createTime
    public LocalDateTime getCreateTime() {
        return createTime;
    }

    public void setCreateTime(LocalDateTime createTime) {
        this.createTime = createTime;
    }
}
