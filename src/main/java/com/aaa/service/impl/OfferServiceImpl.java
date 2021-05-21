package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Offer;
import com.aaa.mapper.OfferMapper;
import com.aaa.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
public class OfferServiceImpl implements OfferService {
    @Autowired
    private OfferMapper offerMapper;

    @Override
    public List<Map> offerList(BaseQuery baseQuery, Offer offer) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage()+1;
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("offersend",offer.getOffersend());
        map.put("offergoal",offer.getOffergoal());
        return offerMapper.offerList(map);
    }

    @Override
    public int selectCount(Offer offer) {
        return offerMapper.selectCount(offer);
    }

    @Override
    public List<Offer> updateSelect(Offer offer) {
        return offerMapper.updateSelect(offer);
    }

    @Override
    public int update(Offer offer) {
        return offerMapper.update(offer);
    }

    @Override
    public Integer insertSelete(Offer offer) {
        return offerMapper.insertSelete(offer);
    }

    @Override
    public int insertOffer(Offer offer) {
        return offerMapper.insertOffer(offer);
    }

    @Override
    public int del(Offer offer) {
        return offerMapper.del(offer);
    }

    @Override
    public int selone(Offer offer) {
        return offerMapper.selone(offer);
    }
}
