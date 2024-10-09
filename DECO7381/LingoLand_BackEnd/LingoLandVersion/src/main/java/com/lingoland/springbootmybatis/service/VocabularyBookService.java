package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.VocabularyBook;
import org.springframework.stereotype.Service;

import java.util.List;

public interface VocabularyBookService {

    public VocabularyBook selectVocabularyBookByUserIdAndWordIdAndStudyLevel(VocabularyBook vocabularyBook);

    public Integer insertVocabularyBook(VocabularyBook vocabularyBook);
    List<VocabularyBook> selectVocabularyListByUserId(Integer userId);

    List<VocabularyBook> selectVocabularyBookListByUserIdAndStudyLevel(Integer userId, String studyLevel);

    VocabularyBook selectLastVocabularyBookByUserId(Integer userId);
}
