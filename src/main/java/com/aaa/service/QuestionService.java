package com.aaa.service;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Wquestion;

import java.util.List;
import java.util.Map;

public interface QuestionService {
    //查询所有问题件
    List<Map> findQuestion(BaseQuery baseQuery, Wquestion wquestion);
    //总条数
    public int selQuestion(Wquestion wquestion);
    //根据运单id查询
    public List<Wquestion> selQuestiin(Wquestion wquestion);
    //修改运单状态
    public int updateQuestion(Wquestion wquestion);
    //查询已处理的问题单
    List<Map> questionManage(BaseQuery baseQuery, Wquestion wquestion);
    //已处理的问题单总条数
    public int selManage(Wquestion wquestion);
    //问题网点的罚款
    public int updateMoney(Wquestion wquestion);
}
