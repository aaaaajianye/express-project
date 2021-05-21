package com.aaa.mapper;

import com.aaa.entity.Wexpress;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface WexpressMapper extends MyMapper<Wexpress> {
     List<Map> findExpress(Map<String, Object> map);
     //根据运单id查询
    public List<Wexpress> selAll(Wexpress wexpress);
}
