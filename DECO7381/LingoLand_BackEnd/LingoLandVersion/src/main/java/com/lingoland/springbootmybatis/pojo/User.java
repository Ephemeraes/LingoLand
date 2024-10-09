package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

@Data
public class User {

    private Integer id;

    private String name;

    private Integer level;

    private String password;

    private String parentControlPassword;

    private String studyLevel;

    private Integer avatar;
}
