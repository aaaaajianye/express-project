package com.aaa.mapper;

import com.aaa.entity.Wexpresstype;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WexpresstypeMapper extends MyMapper<Wexpresstype> {
    //查询快递类型
    public List<Map> findItem(Map<String, Object> map);
    //添加快递类型
    public int insertItem(Wexpresstype wexpresstype);
    //删除
    public int delItem(Wexpresstype wexpresstype);
}
