package com.wangkai.pojo;

import lombok.Data;
import org.joda.time.DateTime;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
public class User {

    private Integer uid;
    private String username;
    private Date birthday;
    private String sex;
    private String address;
    private Double sal;
    private Integer deptId;
    private Role role;
}
