package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpresstype;
import com.aaa.mapper.WexpresstypeMapper;
import com.aaa.service.WexpresstypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WexpresstypeServiceImpl extends BaseService<Wexpresstype> implements WexpresstypeService{
    @Resource
    private WexpresstypeMapper wexpresstypeMapper;
    @Override
    public List<Map> findItem(BaseQuery baseQuery, Wexpresstype wexpresstype) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return wexpresstypeMapper.findItem(map);
    }

    @Override
    public int insertItem(Wexpresstype wexpresstype) {
        return wexpresstypeMapper.insertItem(wexpresstype);
    }

    @Override
    public int delItem(Wexpresstype wexpresstype) {
        return wexpresstypeMapper.delItem(wexpresstype);
    }
}
