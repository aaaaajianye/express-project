package com.aaa.mapper;

import com.aaa.entity.Tuser;
import com.aaa.util.MyMapper;

public interface TuserMapper extends MyMapper<Tuser> {
    Tuser selectall();

}