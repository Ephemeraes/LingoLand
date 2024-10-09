package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.Grammar;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface GrammarMapper {
    @Select("SELECT id, question_text AS question, option_a AS optionA, option_b AS optionB, option_c AS optionC, correct_answer AS answer, explanation FROM grammarquestions order by id LIMIT #{pageNum}, #{pageSize}")
    public List<Grammar> findGrammarLimit(@Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);
}