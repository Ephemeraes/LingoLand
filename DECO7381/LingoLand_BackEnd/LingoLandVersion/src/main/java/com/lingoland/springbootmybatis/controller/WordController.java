package com.lingoland.springbootmybatis.controller;

import com.lingoland.springbootmybatis.common.AjaxResult;
import com.lingoland.springbootmybatis.service.WordService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@Api(tags = "dictionary")
@RestController
@RequestMapping("/word")
public class WordController {
    @Autowired
    private WordService wordService;

    @ApiOperation("search word by dictionary")
    @GetMapping("/findByWord")
    public AjaxResult findByWord(String word) {
        return AjaxResult.success(wordService.findByWord(word));
    }

    @ApiOperation("search trans by dictionary")
    @GetMapping("/findByTrans")
    public AjaxResult findByTrans(String trans) {
        return AjaxResult.success(wordService.findByTrans(trans));
    }

    @ApiOperation("get dictionary")
    @GetMapping("/dictionary")
    public AjaxResult getDictionary() {
        return AjaxResult.success(wordService.getDictionary());
    }
}
