package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wrecord;
import com.aaa.mapper.WrecordMapper;
import com.aaa.service.WrecordService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WrecordServiceImpl extends BaseService<Wrecord> implements WrecordService {
    @Resource
    private WrecordMapper wrecordMapper;
    @Override
    public int insertRecord(Wrecord wrecord) {
        return wrecordMapper.insertRecord(wrecord);
    }

    @Override
    public List<Map> selAll(BaseQuery baseQuery, Wrecord wrecord) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("braname",wrecord.getBraname());
        return wrecordMapper.selAll(map);
    }

    @Override
    public int selectCount(Wrecord wrecord) {
        return wrecordMapper.selectCount(wrecord);
    }

    @Override
    public List<Wrecord> selFold(Wrecord wrecord) {
        return wrecordMapper.selFold(wrecord);
    }

    @Override
    public List<Wrecord> selCallout(Wrecord wrecord) {
        return wrecordMapper.selCallout(wrecord);
    }
}
