package com.lingoland.springbootmybatis.controller;

import com.lingoland.springbootmybatis.pojo.BadWords;
import com.lingoland.springbootmybatis.pojo.ChatBot;
import com.lingoland.springbootmybatis.pojo.Words;
import com.lingoland.springbootmybatis.service.ChatBotService;
import com.lingoland.springbootmybatis.service.Impl.ChatBotServiceImpl;
import com.lingoland.springbootmybatis.service.Impl.OCRServiceImpl;
import com.lingoland.springbootmybatis.service.OCRService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import net.sourceforge.tess4j.TesseractException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Api(tags = "ocr controller")
@RestController
@RequestMapping("/ocr")
public class OCRController {
    @Autowired
    OCRService ocr = new OCRServiceImpl();
    @Autowired
    ChatBotService chatBot = new ChatBotServiceImpl();

    @ApiOperation("uploadImage")
    @PostMapping("/uploadImage")
    public Map<String,String> ImagetoString(@RequestParam("file") MultipartFile file) throws TesseractException {
        File newFile = new File(System.getProperty("java.io.tmpdir") + "/" + file.getOriginalFilename());
        try {
            file.transferTo(newFile);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        String words = ocr.imageToString(newFile);
        boolean sensitive= ocr.sensitiveWords(words);
        String result = ocr.translatation("en","zh",words);
//        List<String> resultList = new ArrayList<>();
//        resultList.add(words);
//        resultList.add(result);
        Map<String,String> resMap = new HashMap<>();
        resMap.put("ori",words);
        resMap.put("des",result);
        resMap.put("sensitive",String.valueOf(sensitive));
        return resMap;
    }

    @ApiOperation("getAllResult")
    @GetMapping("/getAllResult")
    public List<Words> getAllResult(@RequestParam("userId") int userId){
        return ocr.getAllResult(userId);
    }

    @ApiOperation("insertWords")
    @PostMapping("/insertWords")
    public Integer insertWords(@RequestBody Words words){
        return ocr.insertWords(words);
    }

    @ApiOperation("getChatBot")
    @GetMapping("/getChatBot")
    public List<ChatBot> getChatBot(@RequestParam("wordsId") int wordsId){
        return chatBot.getChatBot(wordsId);
    }

    @ApiOperation("postChatBot")
    @PostMapping("/postChatBot")
    public Integer setChatBot(@RequestBody ChatBot chatBot1){
        return chatBot.setChatBot(chatBot1);
    }

    @ApiOperation("getAllBadWords")
    @GetMapping("/getAllBadWords")
    public List<BadWords> getAllBadwords(){
        return ocr.getAllBadWords();
    }
}
