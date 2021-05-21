package com.aaa.mapper;

import com.aaa.entity.Offer;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface OfferMapper extends MyMapper<Offer> {

    public List<Map> offerList(Map<String, Object> map);
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
