package com.wangkai.service.impl;

import com.wangkai.dao.IRoleDao;
import com.wangkai.dao.IUserDao;
import com.wangkai.pojo.Role;
import com.wangkai.pojo.SearchCondition;
import com.wangkai.pojo.User;
import com.wangkai.service.IRoleService;
import com.wangkai.service.IUserService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements IUserService {

    @Autowired
    private IUserDao userDao;

    @Autowired
    private IRoleService roleService;

    public void setUserDao(IUserDao userDao) {
        this.userDao = userDao;
    }

    public void setRoleService(IRoleService roleService) {
        this.roleService = roleService;
    }

    @Override
    public List<User> selectAll() {
        List<User> users = userDao.selectAll();
        return users;
    }

    @Override
    public User selectOne(Integer uid) {
        User user = userDao.selectOne(uid);
        return user;
    }

    @Override
    public int insertUser(User user) {
//        Map<String,Object> map = new HashMap<>();
//        map.put("username", user.getUsername());
//        map.put("birthday", user.getBirthday());
//        map.put("sex", user.getSex());
//        map.put("address", user.getAddress());
//        map.put("sal", user.getSal());
        String roleName = user.getRole().getRoleName();
        String roleDesc = user.getRole().getRoleDesc();
        Integer deptId = roleService.selectOne(roleName, roleDesc);
        user.setDeptId(deptId);

        int result = userDao.insertUser(user);
        return result;
    }

    @Override
    public int updateUser(User user) {
//        Map<String,Object> map = new HashMap<>();
//        map.put("username", user.getUsername());
//        map.put("birthday", user.getBirthday());
//        map.put("sex", user.getSex());
//        map.put("address", user.getAddress());
//        map.put("sal", user.getSal());
//        map.put("uid", user.getUid());
        String roleName = user.getRole().getRoleName();
        String roleDesc = user.getRole().getRoleDesc();
        Integer deptId = roleService.selectOne(roleName, roleDesc);
        user.setDeptId(deptId);

        int result = userDao.updateUser(user);
        return result;
    }

    @Override
    public int deleteUser(Integer uid) {
        int result = userDao.deleteUser(uid);
        return result;
    }

    @Override
    public List<User> selectByCondition(SearchCondition searchCondition) {
        List<User> users = userDao.selectByCondition(searchCondition);
        return users;
    }


}
