package com.aaa.service.impl;

import com.aaa.entity.Branch;
import com.aaa.entity.TuserTwo;
import com.aaa.mapper.TuserMapperTwo;
import com.aaa.service.TuserSTwo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class TuserSimplTwo implements TuserSTwo {

    @Autowired
    private TuserMapperTwo tuserMapperTwo;


    @Override
    public List<Branch> tuserList(TuserTwo tuser) {
        return tuserMapperTwo.tuserList(tuser);
    }

}
