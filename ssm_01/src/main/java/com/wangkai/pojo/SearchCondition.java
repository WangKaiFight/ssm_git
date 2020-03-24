package com.wangkai.pojo;

import lombok.Data;

import java.util.Date;

@Data
public class SearchCondition {

    private String username;
    private String startday;
    private String endday;
    private String roleName;
    private String roleDesc;
}
