package com.aaa.service.impl;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wquestion;
import com.aaa.mapper.QuestionMapper;
import com.aaa.service.QuestionService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Service
@Transactional
public class QuestionServiceImpl extends  BaseService<Wquestion> implements QuestionService {
    @Resource
    private QuestionMapper questionMapper;
    @Override
    public List<Map> findQuestion(BaseQuery baseQuery, Wquestion wquestion) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        //模糊查询的字段
        map.put("expnum",wquestion.getExpnum());
        return questionMapper.findQuestion(map);
    }

    @Override
    public int selQuestion( Wquestion wquestion) {
        return questionMapper.selQuestion(wquestion);
    }

    @Override
    public List<Wquestion> selQuestiin(Wquestion wquestion) {
        return questionMapper.selQuestiin(wquestion);
    }

    @Override
    public int updateQuestion(Wquestion wquestion) {
        return questionMapper.updateQuestion(wquestion);
    }

    @Override
    public List<Map> questionManage(BaseQuery baseQuery, Wquestion wquestion) {
        int begin=baseQuery.getLimit()*(baseQuery.getPage()-1);
        int end=baseQuery.getLimit()*baseQuery.getPage();

        Map<String,Object> map=new HashMap<String,Object>();
        map.put("begin", begin);
        map.put("end", end);
        //模糊查询的字段
        map.put("expnum",wquestion.getExpnum());
        return questionMapper.questionManage(map);
    }

    @Override
    public int selManage(Wquestion wquestion) {
        return questionMapper.selManage(wquestion);
    }

    @Override
    public int updateMoney(Wquestion wquestion) {
        return questionMapper.updateMoney(wquestion);
    }
}
