package com.aaa.service;

import com.aaa.entity.Expressdetails;

import java.util.List;

public interface ExpressdetailsService {
    //根据订单编号
    public List<Expressdetails> updateList(Expressdetails expressdetails);
}
