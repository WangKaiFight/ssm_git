package com.wangkai.dao;

import com.wangkai.pojo.Role;

import java.util.List;

public interface IRoleDao {

    public List<Role> selectAll();

    public Integer selectOne(String roleName,String roleDesc);
}
