package com.aaa.service.impl;

import com.aaa.entity.Offertype;
import com.aaa.mapper.OfferTypeMapper;
import com.aaa.service.OfferTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OfferTypeServiceImpl implements OfferTypeService {
    @Autowired
    private OfferTypeMapper offerTypeMapper;
    @Override
    public List<Offertype> offerList() {
        return offerTypeMapper.offerList();
    }


    @Override
    public int update(Offertype offertype) {
        return offerTypeMapper.update(offertype);
    }

    @Override
    public List<Offertype> updateselect(Offertype offertype) {
        return offerTypeMapper.updateselect(offertype);
    }

}
