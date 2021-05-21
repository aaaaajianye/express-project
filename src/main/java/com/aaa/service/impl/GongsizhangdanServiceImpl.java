package com.aaa.service.impl;

import com.aaa.mapper.GongsizhangdanMapper;
import com.aaa.service.GongsizhangdanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class GongsizhangdanServiceImpl implements GongsizhangdanService {
    @Autowired
    GongsizhangdanMapper gongsizhangdanMapper;
    @Override
    public int zongmoney() {

        return gongsizhangdanMapper.zongmoney();
    }
}
