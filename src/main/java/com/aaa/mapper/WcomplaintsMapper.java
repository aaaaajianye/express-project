package com.aaa.mapper;

import com.aaa.entity.Wcomplaints;

import com.aaa.entity.WstaffdetailsVO;
import com.aaa.entity.WvehicleVO;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WcomplaintsMapper extends MyMapper<Wcomplaints> {
    //所有记录
    List<Map> findAll(Map<String, Object> map);
    //总条数
    public int selectCount(Wcomplaints wcomplaints);

    //所有投诉记录
    List<Map> SelAll(Map<String, Object> map);
    //所有投诉记录总条数
    public int selCount(Wcomplaints wcomplaints);
    //根据登录账号查询用户姓名
    public String selTruename(WstaffdetailsVO wstaffdetailsVO);
    //根据真实姓名查询员工所属网点名称
    public String selBraname(WstaffdetailsVO wstaffdetailsVO);
    public List<WstaffdetailsVO> selBranameTwo(WstaffdetailsVO wstaffdetailsVO);
    //查询admin网点
    public String selAdmin(WstaffdetailsVO wstaffdetailsVO);
    //根据网点名称查询网点id
    public int selBraid(WvehicleVO wvehicleVO);

    //向支出表中添加罚款
    public int updateCom(Wcomplaints wcomplaints);
    //添加投诉信息
    public int insertCom(Wcomplaints wcomplaints);
    //判断该员工是否操作该运单
    public int selSame(Wcomplaints wcomplaints);

}
