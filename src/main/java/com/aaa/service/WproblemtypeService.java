package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wproblemtype;

import java.util.List;
import java.util.Map;

public interface WproblemtypeService {
    //查询问题件类型
    public List<Map> findProblem(BaseQuery baseQuery, Wproblemtype wproblemtype);
    //添加问题件类型
    public int insertProblem(Wproblemtype wproblemtype);
    //删除
    public int delProblem(Wproblemtype wproblemtype);
}
