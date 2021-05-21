package com.aaa.service.impl;

import com.aaa.entity.Branchexpend;
import com.aaa.mapper.QixiazhangdanMapper;
import com.aaa.service.QixiazhangdanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class QixiazhangdanServiceImpl implements QixiazhangdanService {
    @Autowired
    QixiazhangdanMapper qixaizhangdanMapper;
    @Override
    public Branchexpend qixiamoney() {
       return   qixaizhangdanMapper.qixiamoney();
    }

    @Override
    public Branchexpend selectqizhang(String braexname) {
        return qixaizhangdanMapper.selectqizhang(braexname);
    }
}
