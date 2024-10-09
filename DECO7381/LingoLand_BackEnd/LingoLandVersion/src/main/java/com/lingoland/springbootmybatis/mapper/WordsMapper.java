package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.Grammar;
import com.lingoland.springbootmybatis.pojo.UserLoginLog;
import com.lingoland.springbootmybatis.pojo.VocabularyBook;
import com.lingoland.springbootmybatis.pojo.Words;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface WordsMapper {
    @Select("SELECT words_id AS wordsId, ori_words AS oriWords, translated_words AS translatedWords, create_time AS createTime, user_id AS userId FROM words WHERE User_id = #{userId}")
    public List<Words> getAllByUser(@Param("userId") int userId);

    @Insert("INSERT INTO words(ori_words,translated_words,user_id,create_time) VALUES(#{oriWords}, #{translatedWords}, #{userId},default)")
    public Integer insertWords(Words words);


}
