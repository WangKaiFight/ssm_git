package com.wangkai.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wangkai.pojo.Role;
import com.wangkai.pojo.SearchCondition;
import com.wangkai.pojo.User;
import com.wangkai.service.IRoleService;
import com.wangkai.service.IUserService;
import org.joda.time.DateTime;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public void setRoleService(IRoleService roleService) {
        this.roleService = roleService;
    }

    @RequestMapping("/selectAll")
    public String selectAll(Model model, @RequestParam(required = false,defaultValue = "1",value = "page") Integer page,
                            @RequestParam(required = false,defaultValue = "5") Integer currentPageNum){

        PageHelper.startPage(page,currentPageNum);

        List<User> users = userService.selectAll();

        PageInfo pageInfo = new PageInfo(users,5);

        List<Role> roles = roleService.selectAll();

        model.addAttribute("roles",roles );
        model.addAttribute("users",users );
        model.addAttribute("pageInfo", pageInfo);

        return "users";
    }

    @RequestMapping("/selectOne")
    public String selectOne(Model model,String uid,@RequestParam(required = false,defaultValue = "1",value = "page") Integer page,
                            @RequestParam(required = false,defaultValue = "5") Integer currentPageNum){

        PageHelper.startPage(page,currentPageNum);

        User user = userService.selectOne(Integer.parseInt(uid));

        List<User> users = new ArrayList<>();
        users.add(user);

        PageInfo pageInfo = new PageInfo(users,5);
        List<Role> roles = roleService.selectAll();

        model.addAttribute("roles",roles );
        model.addAttribute("user",user );
        model.addAttribute("pageInfo", pageInfo);

        return "users";
    }

    @RequestMapping("/insertUserForm")
    public String insertUserForm(Model model){
        List<Role> roles = roleService.selectAll();

        model.addAttribute("roles",roles );

        return "insertUser";
    }

    @RequestMapping("/insertUser")
    public String insertUser(User user){
        int result = userService.insertUser(user);
        if (result > 0){
            return "redirect:/user/selectAll";
        }
        return null;
    }

    @RequestMapping("/updateUserForm")
    public String updateUserForm(Integer uid,Model model){
        User user = userService.selectOne(uid);
        List<Role> roles = roleService.selectAll();

        model.addAttribute("roles",roles );
        model.addAttribute("user", user);
        return "updateUser";
    }

    @RequestMapping("/updateUser")
    public String updateUser(User user){
        int result = userService.updateUser(user);
        if (result > 0){
            return "redirect:/user/selectAll";
        }
        return null;
    }

    @RequestMapping("/deleteUser")
    public String deleteUser(Integer uid){
        int result = userService.deleteUser(uid);
        if (result > 0){
            return "redirect:/user/selectAll";
        }
        return null;
    }


    @RequestMapping("/selectByCondition")
    public String selectByCondition(SearchCondition searchCondition,Model model){


        List<User> users = userService.selectByCondition(searchCondition);

        List<Role> roles = roleService.selectAll();

        model.addAttribute("roles",roles );
        model.addAttribute("users",users );
        model.addAttribute("sc", searchCondition);
        model.addAttribute("length", users.size());

        return "usersBySearch";
    }
}
