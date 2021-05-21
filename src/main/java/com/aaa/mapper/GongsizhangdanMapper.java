package com.aaa.mapper;

import com.aaa.entity.Express;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface GongsizhangdanMapper extends MyMapper<Express> {

    int zongmoney();


}
