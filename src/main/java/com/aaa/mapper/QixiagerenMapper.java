package com.aaa.mapper;

import com.aaa.entity.Branchexpend;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QixiagerenMapper extends MyMapper<Branchexpend> {


    Branchexpend selectgeren(String userName);
}
