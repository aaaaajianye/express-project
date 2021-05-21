package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Witemtype;

import java.util.List;
import java.util.Map;

public interface WitemtypeService {
    //查询物品类型
    public List<Map> findItem(BaseQuery baseQuery, Witemtype witemtype);
    //添加物品类型
    public int insertItem(Witemtype witemtype);
    //删除
    public int delItem(Witemtype witemtype);
}
