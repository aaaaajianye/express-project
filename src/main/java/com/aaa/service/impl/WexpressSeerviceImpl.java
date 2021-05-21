package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpress;
import com.aaa.mapper.WexpressMapper;
import com.aaa.service.WexpressService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WexpressSeerviceImpl extends BaseService<Wexpress> implements WexpressService {
    @Resource
    private WexpressMapper wexpressMapper;


    @Override
    public List<Map> findExpress(BaseQuery baseQuery, Wexpress wexpress) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);

        map.put("expnum",wexpress.getExpnum());
        return wexpressMapper.findExpress(map);
    }

    @Override
    public List<Wexpress> selAll(Wexpress wexpress) {
        return wexpressMapper.selAll(wexpress);
    }
}
