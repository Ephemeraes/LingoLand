package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.ChatBotMapper;
import com.lingoland.springbootmybatis.pojo.ChatBot;
import com.lingoland.springbootmybatis.service.ChatBotService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatBotServiceImpl implements ChatBotService {
    @Autowired
    private ChatBotMapper chatBotMapper;
    @Override
    public List<ChatBot> getChatBot(int wordsId){
        return chatBotMapper.getChatBot(wordsId);
    }
    @Override
    public Integer setChatBot(ChatBot chatBot){
        return chatBotMapper.setChatBot(chatBot);
    }
}
