package com.aaa.service.impl;


import com.aaa.entity.BaseQuery;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.mapper.TuserTwoMapper;
import com.aaa.service.TuserTwoService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
@Transactional
public class TuserTwoServiceImpl extends BaseService<WstaffdetailsVO> implements TuserTwoService {
    @Resource
    private TuserTwoMapper tuserTwoMapper;

    @Override
    public List<Map> findUser(BaseQuery baseQuery, WstaffdetailsVO wstaffdetailsVO) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        //模糊查询的字段
        map.put("truename",wstaffdetailsVO.getTruename());
        map.put("braname",wstaffdetailsVO.getBraname());
        map.put("heiger",wstaffdetailsVO.getHeiger());
        map.put("hname",wstaffdetailsVO.getHname());
        map.put("braid",wstaffdetailsVO.getBraid());
        map.put("tname",wstaffdetailsVO.getTname());
        return  tuserTwoMapper.findUser(map);
    }

    @Override
    public int selectCount(WstaffdetailsVO wstaffdetailsVO) {

        return tuserTwoMapper.selectCount(wstaffdetailsVO);
    }

    @Override
    public String selTruename(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selTruename(wstaffdetailsVO);
    }

    @Override
    public String selBraname(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selBraname(wstaffdetailsVO);
    }

    @Override
    public List<WstaffdetailsVO> selBranameTwo(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selBranameTwo(wstaffdetailsVO);
    }

    @Override
    public String selAdmin(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selAdmin(wstaffdetailsVO);
    }

    @Override
    public int useresInsert(WstaffdetailsVO WstaffdetailsVO) {
        return tuserTwoMapper.useresInsert(WstaffdetailsVO);
    }

    @Override
    public int useresInsertTwo(WstaffdetailsVO WstaffdetailsVO) {
        return tuserTwoMapper.useresInsertTwo(WstaffdetailsVO);
    }

    @Override
    public int userId(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.userId(wstaffdetailsVO);
    }

    @Override
    public int branchId(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.branchId(wstaffdetailsVO);
    }

    @Override
    public int delUser(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.delUser(wstaffdetailsVO);
    }

    @Override
    public int delUserTwo(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.delUserTwo(wstaffdetailsVO);
    }

    @Override
    public int editUser(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.editUser(wstaffdetailsVO);
    }

    @Override
    public int editUserTwo(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.editUserTwo(wstaffdetailsVO);
    }

    @Override
    public List<WstaffdetailsVO> selUser(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selUser(wstaffdetailsVO);
    }

    @Override
    public int selUsername(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selUsername(wstaffdetailsVO);
    }

    @Override
    public List<WstaffdetailsVO> seluserBraid(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.seluserBraid(wstaffdetailsVO);
    }

    @Override
    public int selIdcard(WstaffdetailsVO wstaffdetailsVO) {
        return tuserTwoMapper.selIdcard(wstaffdetailsVO);
    }
}
