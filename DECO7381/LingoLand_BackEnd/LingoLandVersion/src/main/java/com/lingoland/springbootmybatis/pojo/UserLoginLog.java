package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class UserLoginLog {

    private Integer id;

    private Integer userId;

    private String studyLevel;

    private String loginTime;
}
