package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.ChatBot;
import com.lingoland.springbootmybatis.pojo.Words;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ChatBotMapper {
    @Select("SELECT chat_id AS chatId, content, content_type AS contentType, create_time AS createTime FROM chat_bot WHERE words_id = #{wordsId}")
    public List<ChatBot> getChatBot(@Param("wordsId") int wordsId);

    @Insert("INSERT INTO chat_bot(content,content_type,create_Time,words_id) VALUES(#{content}, #{contentType},default,#{wordsId})")
    public Integer setChatBot(ChatBot chatBot);
}
