package com.wangkai.service;

import com.wangkai.pojo.SearchCondition;
import com.wangkai.pojo.User;

import java.util.List;

public interface IUserService {

    public List<User> selectAll();

    public User selectOne(Integer uid);

    public int insertUser(User user);

    public int updateUser(User user);

    public int deleteUser(Integer uid);

    public List<User> selectByCondition(SearchCondition searchCondition);
}
