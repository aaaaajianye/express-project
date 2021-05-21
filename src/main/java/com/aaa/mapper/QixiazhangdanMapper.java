package com.aaa.mapper;

import com.aaa.entity.Branchexpend;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QixiazhangdanMapper extends MyMapper<Branchexpend> {
    Branchexpend qixiamoney();

    Branchexpend selectqizhang(String braexname);
}
