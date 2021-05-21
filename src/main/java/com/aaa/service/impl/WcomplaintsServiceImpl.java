package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wcomplaints;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.entity.WvehicleVO;
import com.aaa.mapper.WcomplaintsMapper;
import com.aaa.service.WcomplaintsService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class WcomplaintsServiceImpl extends BaseService<Wcomplaints> implements WcomplaintsService {
    @Resource
    private WcomplaintsMapper wcomplaintsMapper;

    @Override
    public List<Map> findAll(BaseQuery baseQuery, Wcomplaints wcomplaints) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        return wcomplaintsMapper.findAll(map);
    }

    @Override
    public int selectCount(Wcomplaints wcomplaints) {
        return wcomplaintsMapper.selectCount(wcomplaints);
    }

    @Override
    public List<Map> SelAll(BaseQuery baseQuery, Wcomplaints wcomplaints) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        //模糊查询字段
        map.put("comexpnum",wcomplaints.getComexpnum());
        map.put("hname",wcomplaints.getHname());
        map.put("combranch",wcomplaints.getCombranch());
        return wcomplaintsMapper.SelAll(map);
    }

    @Override
    public int selCount(Wcomplaints wcomplaints) {
        return wcomplaintsMapper.selCount(wcomplaints);
    }

    @Override
    public String selTruename(WstaffdetailsVO wstaffdetailsVO) {
        return wcomplaintsMapper.selTruename(wstaffdetailsVO);
    }

    @Override
    public String selBraname(WstaffdetailsVO wstaffdetailsVO) {
        return wcomplaintsMapper.selBraname(wstaffdetailsVO);
    }

    @Override
    public List<WstaffdetailsVO> selBranameTwo(WstaffdetailsVO wstaffdetailsVO) {
        return wcomplaintsMapper.selBranameTwo(wstaffdetailsVO);
    }

    @Override
    public String selAdmin(WstaffdetailsVO wstaffdetailsVO) {
        return wcomplaintsMapper.selAdmin(wstaffdetailsVO);
    }

    @Override
    public int selBraid(WvehicleVO wvehicleVO) {
        return wcomplaintsMapper.selBraid(wvehicleVO);
    }






    @Override
    public int updateCom(Wcomplaints wcomplaints) {
        return wcomplaintsMapper.updateCom(wcomplaints);
    }

    @Override
    public int insertCom(Wcomplaints wcomplaints) {
        return wcomplaintsMapper.insertCom(wcomplaints);
    }

    @Override
    public int selSame(Wcomplaints wcomplaints) {
        return wcomplaintsMapper.selSame(wcomplaints);
    }
}
