package com.aaa.mapper;

import com.aaa.entity.Trole;
import com.aaa.util.MyMapper;

import java.util.List;

public interface TroleMapper extends MyMapper<Trole> {

    List<Trole> selectRolesByUserId(Integer userid);

}