package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wpaymethod;

import java.util.List;
import java.util.Map;

public interface WpaymethodService {
    //查询支付类型
    public List<Map> findPay(BaseQuery baseQuery, Wpaymethod wpaymethod);
    //添加支付类型
    public int insertPay(Wpaymethod wpaymethod);
    //删除
    public int delPay(Wpaymethod wpaymethod);
}
