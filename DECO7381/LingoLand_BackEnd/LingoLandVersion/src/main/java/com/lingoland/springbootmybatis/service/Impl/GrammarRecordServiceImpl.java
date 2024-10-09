package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.GrammarRecordMapper;
import com.lingoland.springbootmybatis.pojo.GrammarRecord;
import com.lingoland.springbootmybatis.service.GrammarRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GrammarRecordServiceImpl implements GrammarRecordService {
    @Autowired
    private GrammarRecordMapper grammarRecordMapper;

    @Override
    public Integer insertGrammarRecord(GrammarRecord grammarRecord) {
        return grammarRecordMapper.insertGrammarRecord(grammarRecord);
    }

    @Override
    public GrammarRecord checkGrammarRecord(Integer userId, Integer questionId) {
        return grammarRecordMapper.checkGrammarRecord(userId, questionId);
    }

    @Override
    public List<GrammarRecord> listGrammarRecordByUser (Integer userId) {
        return grammarRecordMapper.listGrammarRecordByUser(userId);
    }
}
