package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.Word;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface WordMapper {

    @Select("SELECT * FROM JuniorData WHERE word = #{word} UNION ALL SELECT * FROM MiddleData WHERE word = #{word} UNION ALL SELECT * FROM SeniorData WHERE word = #{word}")
    public Word findByWord(String word);

    @Select("SELECT * FROM JuniorData WHERE trans LIKE CONCAT('%', #{trans}, '%') UNION ALL SELECT * FROM MiddleData WHERE trans LIKE CONCAT('%', #{trans}, '%') UNION ALL SELECT * FROM SeniorData WHERE trans LIKE CONCAT('%', #{trans}, '%')")
    public List<Word> findByTrans(String trans);

    @Select("SELECT * FROM JuniorData UNION ALL SELECT * FROM MiddleData UNION ALL SELECT * FROM SeniorData")
    public List<Word> getDictionary();

    @Select("SELECT * FROM ${table} WHERE id = #{id}")
public Word findById(@Param("table")String table,  @Param("id")Integer id);
    @Select("SELECT * FROM ${table} ORDER BY id LIMIT #{pageNum}, #{pageSize}")
    public List<Word> findWordLimit(@Param("table") String table, @Param("pageNum") Integer pageNum, @Param("pageSize") Integer pageSize);
}
