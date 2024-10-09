package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.ChatBot;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ChatBotService {
    public List<ChatBot> getChatBot(int wordsId);
    public Integer setChatBot(ChatBot chatBot);
}
