package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Offer;

import java.util.List;
import java.util.Map;

public interface OfferService {
    public List<Map> offerList(BaseQuery baseQuery,Offer offer);
    //查询总条数
    public int selectCount(Offer offer);
    //根据id查询
    public List<Offer> updateSelect(Offer offer);
    //修改
    public int update(Offer offer);
    //唯一查询
    public Integer insertSelete(Offer offer);
    //添加
    public int insertOffer(Offer offer);
    //删除
    public  int del(Offer offer);
    //查询运输地是否唯一
    public int selone(Offer offer);
}
