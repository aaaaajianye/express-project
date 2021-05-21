package com.aaa.mapper;


import com.aaa.entity.Wpaymethod;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface WpaymethodMapper extends MyMapper<Wpaymethod> {
    //查询支付类型
    public List<Map> findPay(Map<String, Object> map);
    //添加支付类型
    public int insertPay(Wpaymethod wpaymethod);
    //删除
    public int delPay(Wpaymethod wpaymethod);
}
