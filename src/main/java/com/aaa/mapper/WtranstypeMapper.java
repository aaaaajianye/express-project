package com.aaa.mapper;

import com.aaa.entity.Wtranstype;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WtranstypeMapper extends MyMapper<Wtranstype> {
    //查询运输方式
    public List<Map> findTrans(Map<String, Object> map);
    //添加运输方式
    public int insertTrans(Wtranstype wtranstype);
    //删除
    public int delTrans(Wtranstype wtranstype);
}
