package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.WordMapper;
import com.lingoland.springbootmybatis.pojo.Word;
import com.lingoland.springbootmybatis.service.WordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WordServiceImpl implements WordService{

    @Autowired
    private WordMapper wordMapper;

    public Word findByWord(String word) {
        return wordMapper.findByWord(word);
    }

    public List<Word> findByTrans(String trans) {
        return wordMapper.findByTrans(trans);
    }

    public List<Word> getDictionary() {
        return wordMapper.getDictionary();
    }

    @Override
    public Word findById(String table, Integer id) {
        return wordMapper.findById(table, id);
    }

    @Override
    public List<Word> findWordLimit(String table, Integer pageNum, Integer pageSize) {
        return wordMapper.findWordLimit(table, pageNum, pageSize);
    }
}
