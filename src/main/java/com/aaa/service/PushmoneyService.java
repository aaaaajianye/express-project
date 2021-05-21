package com.aaa.service;

import com.aaa.entity.Pushmoney;

import java.util.List;
import java.util.Map;

public interface PushmoneyService {
    //查询等级权限
    public List<Map> pushmoneyList();

    //添加
    public int insertPushmoney(Pushmoney pushmoney);

    //根据id查询
    public List<Pushmoney> updateSelect(Pushmoney pushmoney);

    //修改
    public int update(Pushmoney pushmoney);

    //删除
    public int del(Pushmoney pushmoney);
}
