package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.VocabularyBook;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface

VocabularyBookMapper {

    @Select("SELECT id, user_id as userId, word_id as wordId, study_level as studyLevel, create_time as createTime FROM vocabulary_book WHERE user_id = #{userId} AND word_id = #{wordId} AND study_level = #{studyLevel}")
    public VocabularyBook selectVocabularyBookByUserIdAndWordIdAndStudyLevel(VocabularyBook vocabularyBook);

    @Select("INSERT INTO vocabulary_book(user_id, word_id, study_level, create_time) VALUES(#{userId}, #{wordId}, #{studyLevel}, #{createTime})")
    public Integer insertVocabularyBook(VocabularyBook vocabularyBook);

    @Select("SELECT id, user_id as userId, word_id as wordId, study_level as studyLevel, create_time as createTime FROM vocabulary_book WHERE user_id = #{userId} ORDER BY create_time DESC")
public List<VocabularyBook> selectVocabularyBookByUserId(Integer userId);

    @Select("SELECT id, user_id as userId, word_id as wordId, study_level as studyLevel, create_time as createTime FROM vocabulary_book WHERE user_id = #{userId} AND study_level = #{studyLevel}")
    public List<VocabularyBook> selectVocabularyBookListByUserIdAndStudyLevel(Integer userId, String studyLevel);

    @Select("SELECT id, user_id as userId, word_id as wordId, study_level as studyLevel, create_time as createTime FROM vocabulary_book WHERE user_id = #{userId} ORDER BY create_time DESC LIMIT 1")
    public VocabularyBook selectLastVocabularyBookByUserId(Integer userId);

}
