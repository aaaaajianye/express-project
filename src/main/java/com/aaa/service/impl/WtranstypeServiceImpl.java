package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wtranstype;
import com.aaa.mapper.WtranstypeMapper;
import com.aaa.service.WtranstypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WtranstypeServiceImpl extends BaseService<Wtranstype> implements WtranstypeService {
    @Resource
    private WtranstypeMapper wtranstypeMapper;

    @Override
    public List<Map> findTrans(BaseQuery baseQuery, Wtranstype wtranstype) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return wtranstypeMapper.findTrans(map);
    }

    @Override
    public int insertTrans(Wtranstype wtranstype) {
        return wtranstypeMapper.insertTrans(wtranstype);
    }

    @Override
    public int delTrans(Wtranstype wtranstype) {
        return wtranstypeMapper.delTrans(wtranstype);
    }
}
