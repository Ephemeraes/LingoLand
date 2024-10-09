package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class ChatBot {
    private Integer chatId;
    private Integer wordsId;
    private String content;
    private Date createTime;
    private byte contentType;
}
