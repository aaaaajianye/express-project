package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpress;

import java.util.List;
import java.util.Map;

public interface WexpressService {
    List<Map> findExpress(BaseQuery baseQuery, Wexpress wexpress);
    //根据运单id查询
    public List<Wexpress> selAll(Wexpress wexpress);
}
