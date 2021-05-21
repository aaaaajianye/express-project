package com.aaa.mapper;

import com.aaa.entity.Wrecord;
import com.aaa.util.MyMapper;

import java.util.List;
import java.util.Map;

public interface WrecordMapper extends MyMapper<Wrecord> {
    //添加记录
    public int insertRecord(Wrecord wrecord);
    //所有员工
    public List<Map> selAll(Map<String, Object> map);
    public int selectCount(Wrecord wrecord);
    //调入的员工
    public List<Wrecord> selFold(Wrecord wrecord);
    //调出的员工
    public List<Wrecord> selCallout(Wrecord wrecord);
}
