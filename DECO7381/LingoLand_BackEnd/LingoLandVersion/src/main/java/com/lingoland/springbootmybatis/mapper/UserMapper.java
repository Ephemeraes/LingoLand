package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.User;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

public interface UserMapper {

    @Select("SELECT id, name, level, password, parent_control_password as parentControlPassword, study_level as studyLevel, avatar FROM users WHERE name = #{name}")
    public User selectUserByName(String name);

    @Insert("INSERT INTO users(name, level, password, parent_control_password, study_level, avatar) VALUES(#{name}, #{level}, #{password}, #{parentControlPassword}, #{studyLevel}, #{avatar})")
    public Integer insertUser(User user);

    @Select("SELECT id, name, level, password, parent_control_password as parentControlPassword, study_level as studyLevel, avatar FROM users WHERE id = #{id}")
    public User selectUserById(Integer id);

    @Update("UPDATE users SET name = #{name}, level = #{level}, password = #{password}, parent_control_password = #{parentControlPassword}, study_level = #{studyLevel}, avatar = #{avatar} WHERE id = #{id}")
    public Integer updateUser(User user);
}
