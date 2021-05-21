package com.aaa.service;

import com.aaa.entity.Branch;
import com.aaa.entity.TuserTwo;

import java.util.List;

public interface TuserSTwo {
    //获取登录的账号的权限
    public List<Branch> tuserList(TuserTwo tuser);

}
