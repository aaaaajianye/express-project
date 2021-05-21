package com.aaa.service;

import com.aaa.entity.Wbranch;

import java.util.List;

public interface WrelieveService {
    //查询所有网点
    public List<Wbranch> findAll(Wbranch wbranch);
    //查询所有网点
    public List<Wbranch> findAllBra();
    //修改员工所属网点
    public int updateBranch(Wbranch wbranch);
    //查询网点负责人
    public String selBrapin(Wbranch wbranch);
}
