package com.aaa.service;

import com.aaa.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public interface BranchService {
    List<Map> branchBDList(BaseQuery baseQuery, Branch branch);
    //查询总条数
    public int selectBDCount(Branch branch);

    List<Map> branchListc(BaseQuery baseQuery, Branch branch);
    //查询总条数
    public int selectCountc(Branch branch);

    List<Map> branchList(BaseQuery baseQuery, Branch branch);
    //查询总条数
    public int selectCount(Branch branch);
    //提交添加网点
    public int insertBranch(Branch branch);
    //根据网点编号
    public List<Branch> updateList(Branch branch);
    //修改网点信息
    public int update(Branch branch);
    //点击删除
    public int del(Branch branch);
    //查询全部网点
    public List<Branch> branchAll();
    //查询自创的网点
    public List<Branch> branchMy(Branch branch);
    //根据braid查询braname
    public List<Branch> selbraname(Branch branch);
    //查询出网点的所有员工
    public List<TuserTwo> selTuser(Branch branch);
    //查询手机号
    public List<Staffdetails> selPhone(TuserTwo tuserTwo);
    //添加或者修改网点
    public int updateTuser(Branch branch);
    //查询点击这个网点的负责人
    public List<Branch> brapricipalList(Branch branch);
    //查询网点名字是否唯一
    public Integer branameone(Branch branch);
}
