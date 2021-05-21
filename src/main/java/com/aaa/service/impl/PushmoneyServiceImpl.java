package com.aaa.service.impl;

import com.aaa.entity.Pushmoney;
import com.aaa.mapper.pushmoneyMapper;
import com.aaa.service.PushmoneyService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;
@Service
public class PushmoneyServiceImpl implements PushmoneyService {
    @Autowired
    private pushmoneyMapper pushmoneyMapper;


    @Override
    public List<Map> pushmoneyList() {
        return pushmoneyMapper.pushmoneyList();
    }

    @Override
    public int insertPushmoney(Pushmoney pushmoney) {
        return pushmoneyMapper.insertPushmoney(pushmoney);
    }

    @Override
    public List<Pushmoney> updateSelect(Pushmoney pushmoney) {
        return pushmoneyMapper.updateSelect(pushmoney);
    }

    @Override
    public int update(Pushmoney pushmoney) {
        return pushmoneyMapper.update(pushmoney);
    }

    @Override
    public int del(Pushmoney pushmoney) {
        return pushmoneyMapper.del(pushmoney);
    }

}
