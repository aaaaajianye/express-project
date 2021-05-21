package com.aaa.service.impl;

import com.aaa.entity.Branchexpend;
import com.aaa.mapper.QixiagerenMapper;
import com.aaa.service.QixiagerenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QixiagerenServiceImpl implements QixiagerenService {
    @Autowired
    QixiagerenMapper qixiagerenMapper;

    @Override
    public Branchexpend selectgeren(String userName) {
        return qixiagerenMapper.selectgeren(userName);
    }
}
