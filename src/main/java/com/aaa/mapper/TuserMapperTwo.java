package com.aaa.mapper;

import com.aaa.entity.Branch;
import com.aaa.entity.TuserTwo;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
@Mapper
public interface TuserMapperTwo extends MyMapper<TuserTwo> {
    //获取登录的账号的权限
    public List<Branch> tuserList(TuserTwo tuser);
}
