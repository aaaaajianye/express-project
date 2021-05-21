package com.aaa.mapper;

import com.aaa.entity.Witemtype;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WitemtypeMapper extends MyMapper<Witemtype> {
    //查询物品类型
    public List<Map> findItem(Map<String, Object> map);
    //添加物品类型
    public int insertItem(Witemtype witemtype);
    //删除
    public int delItem(Witemtype witemtype);
}
