package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpressdetails;


import java.util.List;
import java.util.Map;

public interface WexpressdetailsService {
    //根据订单编号或者姓名或者电话查询所有结果
    public List<Map> expressdetailsList(BaseQuery baseQuery, Wexpressdetails wexpressdetails);
    //查询总条数
    public int selectCount(Wexpressdetails wexpressdetails);

    //根据订单编号
    public List<Wexpressdetails> updateList(Wexpressdetails wexpressdetails);
    //查询网点负责人
    public List<Wexpressdetails> selBrancher(Wexpressdetails wexpressdetails);
}
