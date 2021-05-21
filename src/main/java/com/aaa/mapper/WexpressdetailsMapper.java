package com.aaa.mapper;

import com.aaa.entity.Wexpressdetails;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WexpressdetailsMapper extends MyMapper<Wexpressdetails> {
    //根据订单编号或者姓名或者电话查询所有结果
    public List<Map> expressdetailsList(Map<String, Object> map);
    //查询总条数
    public int selectCount(Wexpressdetails wexpressdetails);

    //根据订单编号
    public List<Wexpressdetails> updateList(Wexpressdetails wexpressdetails);

    //查询网点负责人
    public List<Wexpressdetails> selBrancher(Wexpressdetails wexpressdetails);
}
