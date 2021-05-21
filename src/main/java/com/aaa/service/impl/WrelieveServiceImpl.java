package com.aaa.service.impl;

import com.aaa.entity.Wbranch;
import com.aaa.mapper.WrelieveMapper;
import com.aaa.service.WrelieveService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

@Service
@Transactional
public class WrelieveServiceImpl extends BaseService<Wbranch> implements WrelieveService {
    @Resource
    private WrelieveMapper wrelieveMapper;

    @Override
    public List<Wbranch> findAll(Wbranch wbranch) {
        return wrelieveMapper.findAll(wbranch);
    }

    @Override
    public List<Wbranch> findAllBra() {
        return wrelieveMapper.findAllBra();
    }

    @Override
    public int updateBranch(Wbranch wbranch) {
        return wrelieveMapper.updateBranch(wbranch);
    }

    @Override
    public String selBrapin(Wbranch wbranch) {
        return wrelieveMapper.selBrapin(wbranch);
    }


}
