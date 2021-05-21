package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wpaymethod;
import com.aaa.mapper.WpaymethodMapper;
import com.aaa.service.WpaymethodService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class WpaymethodServiceImpl extends BaseService<Wpaymethod> implements WpaymethodService {
    @Resource
    private WpaymethodMapper wpaymethodMapper;

    @Override
    public List<Map> findPay(BaseQuery baseQuery, Wpaymethod wpaymethod) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return wpaymethodMapper.findPay(map);
    }

    @Override
    public int insertPay(Wpaymethod wpaymethod) {
        return wpaymethodMapper.insertPay(wpaymethod);
    }

    @Override
    public int delPay(Wpaymethod wpaymethod) {
        return wpaymethodMapper.delPay(wpaymethod);
    }
}
