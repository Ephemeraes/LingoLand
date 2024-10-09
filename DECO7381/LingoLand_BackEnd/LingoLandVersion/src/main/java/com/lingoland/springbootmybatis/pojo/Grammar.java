package com.lingoland.springbootmybatis.pojo;

import lombok.Data;

@Data
public class Grammar {
    Integer id;
    String question;
    String optionA;
    String optionB;
    String optionC;
    Character answer;
    String explanation;
}
