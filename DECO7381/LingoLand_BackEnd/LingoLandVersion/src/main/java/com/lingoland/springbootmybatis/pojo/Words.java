package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class Words {
    private Integer wordsId;
    private String oriWords;
    private String translatedWords;
    private Date createTime;
    private Integer userId;


    public String getOriWords() {
        return oriWords;
    }

    public void setOriWords(String oriWords) {
        this.oriWords = oriWords;
    }

    public String getTranslatedWords() {
        return translatedWords;
    }

    public void setTranslatedWords(String translatedWords) {
        this.translatedWords = translatedWords;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}
