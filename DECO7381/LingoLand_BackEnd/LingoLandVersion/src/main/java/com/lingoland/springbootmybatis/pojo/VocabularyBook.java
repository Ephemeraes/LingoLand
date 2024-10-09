package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

import java.util.Date;


@Data
public class VocabularyBook {

    private Integer id;

    private Integer userId;

    private Integer wordId;

    private String studyLevel;

    private Date createTime;
}
