package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpresstype;

import java.util.List;
import java.util.Map;

public interface WexpresstypeService {
    //查询快递类型
    public List<Map> findItem(BaseQuery baseQuery, Wexpresstype wexpresstype);
    //添加快递类型
    public int insertItem(Wexpresstype wexpresstype);
    //删除
    public int delItem(Wexpresstype wexpresstype);
}
