package com.lingoland.springbootmybatis.service;

import com.lingoland.springbootmybatis.pojo.User;
import org.springframework.stereotype.Service;

public interface UserService {

    public User selectUserByName(String name);

    public Integer insertUser(User user);

    public User selectUserById(Integer id);

    public Integer updateUser(User user);
}
