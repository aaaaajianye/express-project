package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wproblemtype;
import com.aaa.mapper.WproblemtypeMapper;
import com.aaa.service.WproblemtypeService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WproblemtypeServiceImpl extends BaseService<Wproblemtype> implements WproblemtypeService {
    @Resource
    private WproblemtypeMapper wproblemtypeMapper;

    @Override
    public List<Map> findProblem(BaseQuery baseQuery, Wproblemtype wproblemtype) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return wproblemtypeMapper.findProblem(map);
    }

    @Override
    public int insertProblem(Wproblemtype wproblemtype) {
        return wproblemtypeMapper.insertProblem(wproblemtype);
    }

    @Override
    public int delProblem(Wproblemtype wproblemtype) {
        return wproblemtypeMapper.delProblem(wproblemtype);
    }
}
