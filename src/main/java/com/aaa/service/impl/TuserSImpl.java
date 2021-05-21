package com.aaa.service.impl;

import com.aaa.entity.Tuser;
import com.aaa.mapper.TuserMapper;
import com.aaa.service.TuserS;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TuserSImpl implements TuserS {
    @Autowired
    private TuserMapper tuserMapper;

    @Override
    public Tuser selectall() {
        return tuserMapper.selectall();
    }

}
