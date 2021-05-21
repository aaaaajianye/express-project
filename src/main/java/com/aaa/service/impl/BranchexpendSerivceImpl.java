package com.aaa.service.impl;

import com.aaa.entity.Branchexpend;
import com.aaa.mapper.BranchexpendMapper;
import com.aaa.service.BranchexpendService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class BranchexpendSerivceImpl implements BranchexpendService {
    @Autowired
    private BranchexpendMapper branchexpendMapper;
    @Override
    public int insertBranchexpend(Branchexpend branchexpend) {
        return branchexpendMapper.insertBranchexpend(branchexpend);
    }
}
