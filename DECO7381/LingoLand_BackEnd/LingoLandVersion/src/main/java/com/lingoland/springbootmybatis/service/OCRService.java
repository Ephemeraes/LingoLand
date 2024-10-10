package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.BadWords;
import com.lingoland.springbootmybatis.pojo.Words;
import net.sourceforge.tess4j.TesseractException;

import java.io.File;
import java.util.List;

public interface OCRService {
    public String imageToString(File file) throws TesseractException;
    public String translatation(String ori, String des, String words);
    public boolean sensitiveWords(String word);
    public List<Words> getAllResult(int userId);
    public Integer insertWords(Words words);
    public List<BadWords> getAllBadWords();
}
