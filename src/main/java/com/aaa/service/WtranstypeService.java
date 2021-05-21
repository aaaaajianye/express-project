package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wtranstype;

import java.util.List;
import java.util.Map;

public interface WtranstypeService {
    //查询运输方式
    public List<Map> findTrans(BaseQuery baseQuery, Wtranstype wtranstype);
    //添加运输方式
    public int insertTrans(Wtranstype wtranstype);
    //删除
    public int delTrans(Wtranstype wtranstype);
}
