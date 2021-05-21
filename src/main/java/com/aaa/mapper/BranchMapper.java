package com.aaa.mapper;

import com.aaa.entity.*;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;
@Mapper
public interface BranchMapper extends MyMapper<Branch> {
    //根据权限查到自己的下级
    public List<Map> branchBDList(Map<String, Object> map);
    //查询总条数
    public int selectBDCount(Branch branch);
    //根据权限查到自己的下级
    public List<Map> branchList(Map<String, Object> map);
    //查询总条数
    public int selectCount(Branch branch);

    //根据权限查到自己的下级
    public List<Map> branchListc(Map<String, Object> map);
    //查询总条数
    public int selectCountc(Branch branch);
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
