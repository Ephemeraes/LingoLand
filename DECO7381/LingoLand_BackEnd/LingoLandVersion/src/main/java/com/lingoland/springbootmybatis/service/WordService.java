package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.Word;
import org.springframework.stereotype.Service;
import java.util.List;

public interface WordService {

    public Word findByWord(String word);

    public List<Word> findByTrans(String trans);

    public List<Word> getDictionary();

    public Word findById(String table, Integer id);

    public List<Word> findWordLimit(String table, Integer pageNum, Integer pageSize);
}
