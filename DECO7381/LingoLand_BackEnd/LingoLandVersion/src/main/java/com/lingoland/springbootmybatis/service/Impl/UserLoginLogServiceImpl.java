package com.lingoland.springbootmybatis.service.Impl;

import com.lingoland.springbootmybatis.mapper.UserLoginLogMapper;
import com.lingoland.springbootmybatis.pojo.UserLoginLog;
import com.lingoland.springbootmybatis.service.UserLoginLogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserLoginLogServiceImpl implements UserLoginLogService {

    @Autowired
    private UserLoginLogMapper userLoginLogMapper;

    @Override
    public Integer selectUserLoginLogCount(UserLoginLog userLoginLog) {
        return userLoginLogMapper.selectUserLoginLogCount(userLoginLog);
    }

    @Override
    public Integer insertUserLoginLog(UserLoginLog userLoginLog) {
        return userLoginLogMapper.insertUserLoginLog(userLoginLog);
    }

    @Override
    public List<UserLoginLog> selectUserLoginLogListByUserIdAndStudyLevel(Integer userId, String studyLevel) {
        return userLoginLogMapper.selectUserLoginLogListByUserIdAndStudyLevel(userId, studyLevel);
    }

    @Override
    public Integer selecTotaltUserLoginLogCount(Integer userId) {
        return userLoginLogMapper.selecTotaltUserLoginLogCount(userId);
    }

}
