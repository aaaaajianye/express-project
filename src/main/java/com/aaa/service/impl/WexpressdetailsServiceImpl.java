package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wexpressdetails;
import com.aaa.mapper.WexpressdetailsMapper;
import com.aaa.service.WexpressdetailsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WexpressdetailsServiceImpl extends BaseService<Wexpressdetails> implements WexpressdetailsService {
    @Resource
    private WexpressdetailsMapper wexpressdetailsMapper;
    @Override
    public List<Map> expressdetailsList(BaseQuery baseQuery, Wexpressdetails wexpressdetails) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("expnum", wexpressdetails.getExpnum());
        map.put("recipient", wexpressdetails.getRecipient());
        map.put("recphone", wexpressdetails.getRecphone());
        return wexpressdetailsMapper.expressdetailsList(map);
    }

    @Override
    public int selectCount(Wexpressdetails wexpressdetails) {
        return wexpressdetailsMapper.selectCount(wexpressdetails);
    }

    @Override
    public List<Wexpressdetails> updateList(Wexpressdetails wexpressdetails) {
        return wexpressdetailsMapper.updateList(wexpressdetails);
    }

    @Override
    public List<Wexpressdetails> selBrancher(Wexpressdetails wexpressdetails) {
        return wexpressdetailsMapper.selBrancher(wexpressdetails);
    }
}
