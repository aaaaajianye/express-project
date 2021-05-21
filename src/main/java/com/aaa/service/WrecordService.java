package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wrecord;

import java.util.List;
import java.util.Map;

public interface WrecordService {
    //添加记录
    public int insertRecord(Wrecord wrecord);
    //所有员工
    public List<Map> selAll(BaseQuery baseQuery, Wrecord wrecord);
    public int selectCount(Wrecord wrecord);

    //调入的员工
    public List<Wrecord> selFold(Wrecord wrecord);
    //调出的员工
    public List<Wrecord> selCallout(Wrecord wrecord);
}
