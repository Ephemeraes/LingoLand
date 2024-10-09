// The package and import statements necessary for the implementation
package com.lingoland.springbootmybatis.service.Impl;
// Implementing the OCRService interface
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.cloud.translate.Translate;
import com.google.cloud.translate.TranslateOptions;
import com.google.cloud.translate.Translation;
import com.lingoland.springbootmybatis.mapper.UserLoginLogMapper;
import com.lingoland.springbootmybatis.mapper.WordsMapper;
import com.lingoland.springbootmybatis.pojo.Words;
import com.lingoland.springbootmybatis.service.OCRService;
import net.sourceforge.tess4j.Tesseract;
import net.sourceforge.tess4j.TesseractException;
import org.bytedeco.opencv.presets.opencv_core;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

// Method to convert an image file to a String using Tesseract OCR
@Service
public class OCRServiceImpl implements OCRService {
    @Autowired
    private WordsMapper wordsMapper;
    //private OCRService ocrService;
    // Method to translate text from one language to another using Google Cloud Translation API
    @Override
    public String imageToString(File file) throws TesseractException {
        Tesseract tesseract = new Tesseract();
        tesseract.setDatapath("D:/OCR/tessdata");
        String result = tesseract.doOCR(file);
        //System.out.println(result);
        return result;
    }
    // Loop through each line of the text and translate it
    @Override
    public String translatation(String ori, String des, String words){
        String ApiKey = "AIzaSyANkdvMqU6oKRonlJroyrzVne8l7YHHMzA"; // API key for Google Cloud Translation service
        String[] split = words.split("\n"); // Split the text into lines based on newline characters
        Translate translate = TranslateOptions.newBuilder().setApiKey(ApiKey).build().getService(); // Initialize the translation service
        String result = ""; // Initialize a string to store the translated text
        // Loop through each line of the text and translate it
        for(String text:split){
            Translation trans = translate.translate(text, Translate.TranslateOption.sourceLanguage(ori), // Specify the source language
                    Translate.TranslateOption.targetLanguage(des));
            result += trans.getTranslatedText() + "\n";
        }
        return result;
    }

    @Override
    public boolean sensitiveWords(String word){
        ObjectMapper mapper = new ObjectMapper();
        List<String> badWords = new ArrayList<>();
        try {
            badWords = (List<String>) mapper.readValue(new File("C:\\DECO7381\\LingoLand_BackEnd\\badword_chatbot\\src\\badwords\\words.json"), Map.class).get("bad");
        } catch (IOException e){
            return false;
        }
        word = word.toLowerCase();
        for(String i:badWords){
            i = i.toLowerCase();
            if (word.contains(i)){
                return true;
            }
        }
        return false;

    }

    @Override
    public List<Words> getAllResult(int userId){
        return wordsMapper.getAllByUser(userId);
    }

    @Override
    public Integer insertWords(Words words){
        return wordsMapper.insertWords(words);
    }
}
