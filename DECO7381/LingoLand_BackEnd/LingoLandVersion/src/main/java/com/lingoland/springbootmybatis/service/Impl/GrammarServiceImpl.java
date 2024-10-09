package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.GrammarMapper;
import com.lingoland.springbootmybatis.pojo.Grammar;
import com.lingoland.springbootmybatis.service.GrammarService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GrammarServiceImpl implements GrammarService {
    @Autowired
    private GrammarMapper grammarMapper;
    @Override
    public List<Grammar> findGrammarLimit(Integer pageNum, Integer pageSize){
        return grammarMapper.findGrammarLimit(pageNum, pageSize);
    }
}
