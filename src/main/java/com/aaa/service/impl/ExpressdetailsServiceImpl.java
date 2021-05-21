package com.aaa.service.impl;

import com.aaa.entity.Expressdetails;
import com.aaa.mapper.ExpressdetailsMapper;
import com.aaa.service.ExpressdetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExpressdetailsServiceImpl implements ExpressdetailsService {

    @Autowired
    private ExpressdetailsMapper expressdetailsMapper;

    @Override
    public List<Expressdetails> updateList(Expressdetails expressdetails) {
        return expressdetailsMapper.updateList(expressdetails);
    }
}
