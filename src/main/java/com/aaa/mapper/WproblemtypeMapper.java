package com.aaa.mapper;

import com.aaa.entity.Wproblemtype;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WproblemtypeMapper extends MyMapper<Wproblemtype> {
    //查询问题件类型
    public List<Map> findProblem(Map<String, Object> map);
    //添加问题件类型
    public int insertProblem(Wproblemtype wproblemtype);
    //删除
    public int delProblem(Wproblemtype wproblemtype);
}
