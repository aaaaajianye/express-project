package com.aaa.service;

import com.aaa.entity.Offertype;

import java.util.List;

public interface OfferTypeService {
    //查询所有类型报价
    public List<Offertype> offerList();
    //修改信息
    public int update(Offertype offertype);
    //查询修改信息
    public List<Offertype> updateselect(Offertype offertype);
}
