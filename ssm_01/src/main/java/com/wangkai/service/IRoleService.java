package com.wangkai.service;

import com.wangkai.pojo.Role;

import java.util.List;

public interface IRoleService {

    public List<Role> selectAll();

    public Integer selectOne(String roleName,String roleDesc);
}
