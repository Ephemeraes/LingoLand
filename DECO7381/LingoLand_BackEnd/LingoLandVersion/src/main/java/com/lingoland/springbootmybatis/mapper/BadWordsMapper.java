package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.BadWords;
import com.lingoland.springbootmybatis.pojo.Words;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface BadWordsMapper {
    @Select("SELECT words AS words FROM badwords")
    public List<BadWords> getAllByBadWords();

//    @Insert("INSERT INTO words(ori_words,translated_words,user_id,create_time) VALUES(#{oriWords}, #{translatedWords}, #{userId},default)")
//    public Integer insertWords(Words words);



}
