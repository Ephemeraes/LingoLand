package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class GrammarRecord {
    Integer userId;
    Integer questionId;
    Date finishTime;
}
