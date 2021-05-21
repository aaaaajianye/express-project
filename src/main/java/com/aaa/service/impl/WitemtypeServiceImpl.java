package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Witemtype;
import com.aaa.mapper.WitemtypeMapper;
import com.aaa.service.WitemtypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WitemtypeServiceImpl extends BaseService<Witemtype> implements WitemtypeService {
    @Resource
    private WitemtypeMapper witemtypeMapper;


    @Override
    public List<Map> findItem(BaseQuery baseQuery,Witemtype witemtype) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return witemtypeMapper.findItem(map);
    }

    @Override
    public int insertItem(Witemtype witemtype) {
        return witemtypeMapper.insertItem(witemtype);
    }

    @Override
    public int delItem(Witemtype witemtype) {
        return witemtypeMapper.delItem(witemtype);
    }
}
