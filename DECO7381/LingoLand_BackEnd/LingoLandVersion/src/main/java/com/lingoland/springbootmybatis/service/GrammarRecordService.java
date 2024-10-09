package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.GrammarRecord;
import org.apache.ibatis.annotations.Param;

import java.util.Date;
import java.util.List;

public interface GrammarRecordService {
    public Integer insertGrammarRecord(GrammarRecord grammarRecord);
    public GrammarRecord checkGrammarRecord (Integer userId, Integer questionId);
    public List<GrammarRecord> listGrammarRecordByUser (@Param("userId") Integer userId);
}
