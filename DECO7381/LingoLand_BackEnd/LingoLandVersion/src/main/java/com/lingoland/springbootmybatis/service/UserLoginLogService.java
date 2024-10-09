package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.UserLoginLog;
import org.springframework.stereotype.Service;

import java.util.List;

public interface UserLoginLogService {

    public Integer selectUserLoginLogCount(UserLoginLog userLoginLog);

    public Integer insertUserLoginLog(UserLoginLog userLoginLog);

    public List<UserLoginLog> selectUserLoginLogListByUserIdAndStudyLevel(Integer userId, String studyLevel);

    public Integer selecTotaltUserLoginLogCount(Integer userId);
}
