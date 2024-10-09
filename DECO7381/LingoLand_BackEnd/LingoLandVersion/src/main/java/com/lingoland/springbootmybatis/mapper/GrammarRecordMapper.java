package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.GrammarRecord;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

public interface GrammarRecordMapper {
    @Insert("INSERT INTO grammar_record(user_id, question_id, finish_date) VALUES(#{userId}, #{questionId}, #{finishTime})")
    public Integer insertGrammarRecord(GrammarRecord grammarRecord);

    @Select("SELECT * FROM grammar_record WHERE user_id = #{userId} and question_id = #{question_id}")
    public GrammarRecord checkGrammarRecord (@Param("userId") Integer userId, @Param("questionId") Integer questionId);

    @Select("SELECT user_id as userId, question_id as questionId, finish_date as finishTime FROM grammar_record WHERE user_id = #{userId}")
    public List<GrammarRecord> listGrammarRecordByUser (@Param("userId") Integer userId);
}
