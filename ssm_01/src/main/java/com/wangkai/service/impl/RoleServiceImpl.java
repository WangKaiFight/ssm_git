package com.wangkai.service.impl;

import com.wangkai.dao.IRoleDao;
import com.wangkai.pojo.Role;
import com.wangkai.service.IRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    public void setRoleDao(IRoleDao roleDao) {
        this.roleDao = roleDao;
    }

    @Override
    public List<Role> selectAll() {
        List<Role> roles = roleDao.selectAll();
        return roles;
    }

    @Override
    public Integer selectOne(String roleName,String roleDesc) {
        Integer deptId = roleDao.selectOne(roleName, roleDesc);
        return deptId;
    }
}
