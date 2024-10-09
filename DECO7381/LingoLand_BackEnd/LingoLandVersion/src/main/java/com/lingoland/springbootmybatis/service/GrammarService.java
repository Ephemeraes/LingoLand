package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.Grammar;
import org.springframework.stereotype.Service;

import java.util.List;

public interface GrammarService {
    public List<Grammar> findGrammarLimit(Integer pageNum, Integer pageSize);
}
