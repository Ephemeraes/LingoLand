package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.VocabularyBookMapper;
import com.lingoland.springbootmybatis.pojo.VocabularyBook;
import com.lingoland.springbootmybatis.service.VocabularyBookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**

 * @date 2024/9/11
 */
@Service
public class VocabularyBookServiceImpl implements VocabularyBookService {

    @Autowired
    private VocabularyBookMapper vocabularybookMapper;

    @Override
    public VocabularyBook selectVocabularyBookByUserIdAndWordIdAndStudyLevel(VocabularyBook vocabularyBook) {
        return vocabularybookMapper.selectVocabularyBookByUserIdAndWordIdAndStudyLevel(vocabularyBook);
    }

    @Override
    public Integer insertVocabularyBook(VocabularyBook vocabularyBook) {
        return vocabularybookMapper.insertVocabularyBook(vocabularyBook);
    }

    @Override
    public List<VocabularyBook> selectVocabularyListByUserId(Integer userId) {
        return vocabularybookMapper.selectVocabularyBookByUserId(userId);
    }

    @Override
    public List<VocabularyBook> selectVocabularyBookListByUserIdAndStudyLevel(Integer userId, String studyLevel) {
        return vocabularybookMapper.selectVocabularyBookListByUserIdAndStudyLevel(userId, studyLevel);
    }

    @Override
    public VocabularyBook selectLastVocabularyBookByUserId(Integer userId) {
        return vocabularybookMapper.selectLastVocabularyBookByUserId(userId);
    }

}
