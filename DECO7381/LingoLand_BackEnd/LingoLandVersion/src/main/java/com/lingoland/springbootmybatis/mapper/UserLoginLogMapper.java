package com.lingoland.springbootmybatis.mapper;

import com.lingoland.springbootmybatis.pojo.UserLoginLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface UserLoginLogMapper {

    @Select("SELECT COUNT(*) FROM users_login_log WHERE user_id = #{userId} AND study_level = #{studyLevel} AND login_time = #{loginTime}")
    public Integer selectUserLoginLogCount(UserLoginLog userLoginLog);

    @Insert("INSERT INTO users_login_log(user_id, study_level, login_time) VALUES(#{userId}, #{studyLevel}, #{loginTime})")
    public Integer insertUserLoginLog(UserLoginLog userLoginLog);

    @Select("SELECT * FROM users_login_log WHERE user_id = #{userId} AND study_level = #{studyLevel}")
    public List<UserLoginLog> selectUserLoginLogListByUserIdAndStudyLevel(@Param("userId") Integer userId, @Param("studyLevel") String studyLevel);


    @Select("SELECT COUNT(*) FROM users_login_log WHERE user_id = #{userId}")
    public Integer selecTotaltUserLoginLogCount(Integer userId);
}
