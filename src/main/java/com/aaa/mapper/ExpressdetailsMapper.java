package com.aaa.mapper;

import com.aaa.entity.Expressdetails;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ExpressdetailsMapper extends MyMapper<Expressdetails> {



    //根据订单编号
    public List<Expressdetails> updateList(Expressdetails expressdetails);
}
