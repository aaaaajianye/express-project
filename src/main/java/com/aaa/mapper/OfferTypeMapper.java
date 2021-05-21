package com.aaa.mapper;

import com.aaa.entity.Offertype;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface OfferTypeMapper extends MyMapper<Offertype> {
    //查询所有类型报价
    public List<Offertype> offerList();
    //查询修改信息
    public List<Offertype> updateselect(Offertype offertype);
    //修改信息
    public int update(Offertype offertype);

}
