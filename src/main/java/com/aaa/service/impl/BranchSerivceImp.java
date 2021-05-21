package com.aaa.service.impl;

import com.aaa.entity.*;
import com.aaa.mapper.BranchMapper;
import com.aaa.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BranchSerivceImp implements BranchService {
    @Autowired
    private BranchMapper branchMapper;
    @Override
    public List<Map> branchBDList(BaseQuery baseQuery,Branch branch) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("bracode",branch.getBracode());
        return branchMapper.branchBDList(map);
    }

    @Override
    public int selectBDCount(Branch branch) {
        return branchMapper.selectBDCount(branch);
    }

    @Override
    public List<Map> branchListc(BaseQuery baseQuery, Branch branch) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("brarank", branch.getBrarank());
        map.put("braname",branch.getBraname());
        return branchMapper.branchListc(map);
    }

    @Override
    public int selectCountc(Branch branch) {
        return branchMapper.selectCountc(branch);
    }


    @Override
    public List<Map> branchList(BaseQuery baseQuery,Branch branch) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();
        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        map.put("brarank", branch.getBrarank());
        map.put("braname",branch.getBraname());
        return branchMapper.branchList(map);
    }

    @Override
    public int selectCount(Branch branch) {
        return branchMapper.selectCount(branch);
    }



    @Override
    public int insertBranch(Branch branch) {
        return branchMapper.insertBranch(branch);
    }

    @Override
    public List<Branch> updateList(Branch branch) {
        return branchMapper.updateList(branch);
    }

    @Override
    public int update(Branch branch) {
        return branchMapper.update(branch);
    }

    @Override
    public int del(Branch branch) {
        return branchMapper.del(branch);
    }

    @Override
    public List<Branch> branchAll() {
        return branchMapper.branchAll();
    }

    @Override
    public List<Branch> branchMy(Branch branch) {
        return branchMapper.branchMy(branch);
    }

    @Override
    public List<Branch> selbraname(Branch branch) {
        return branchMapper.selbraname(branch);
    }

    @Override
    public List<TuserTwo> selTuser(Branch branch) {
        return branchMapper.selTuser(branch);
    }

    @Override
    public List<Staffdetails> selPhone(TuserTwo tuserTwo) {
        return branchMapper.selPhone(tuserTwo);
    }

    @Override
    public int updateTuser(Branch branch) {
        return branchMapper.updateTuser(branch);
    }

    @Override
    public List<Branch> brapricipalList(Branch branch) {
        return branchMapper.brapricipalList(branch);
    }

    @Override
    public Integer branameone(Branch branch) {
        return branchMapper.branameone(branch);
    }
}
