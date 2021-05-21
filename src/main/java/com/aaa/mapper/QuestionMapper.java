package com.aaa.mapper;

import com.aaa.entity.Wquestion;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface QuestionMapper extends MyMapper<Wquestion> {
    //查询所有问题件
    List<Map> findQuestion(Map<String, Object> map);
    //总条数
    public int selQuestion(Wquestion wquestion);
    //根据运单id查询
    public List<Wquestion> selQuestiin(Wquestion wquestion);
    //修改运单状态
    public int updateQuestion(Wquestion wquestion);
    //查询已处理的问题单
    List<Map> questionManage(Map<String, Object> map);
    //已处理的问题单总条数
    public int selManage(Wquestion wquestion);
    //问题网点的罚款
    public int updateMoney(Wquestion wquestion);

}
