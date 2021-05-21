package com.aaa.mapper;

import com.aaa.entity.Wbranch;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WrelieveMapper extends MyMapper<Wbranch> {
    //查询所有网点
    public List<Wbranch> findAll(Wbranch wbranch);
    //查询所有网点
    public List<Wbranch> findAllBra();
//修改员工所属网点
    public int updateBranch(Wbranch wbranch);
    //查询网点负责人
    public String selBrapin(Wbranch wbranch);
}
