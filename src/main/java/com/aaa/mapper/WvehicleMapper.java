package com.aaa.mapper;

import com.aaa.entity.WstaffdetailsVO;
import com.aaa.entity.WvehicleVO;
import com.aaa.util.MyMapper;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface WvehicleMapper extends MyMapper<WvehicleVO> {
    //所有员工
    List<Map> findCar(Map<String, Object> map);
    //总条数
    public int selectCount(WvehicleVO wvehicleVO);
    //根据登录账号查询用户姓名
    public String selTruename(WstaffdetailsVO wstaffdetailsVO);
    //根据真实姓名查询员工所属网点名称
    public String selBraname(WstaffdetailsVO wstaffdetailsVO);
    public List<WstaffdetailsVO> selBranameTwo(WstaffdetailsVO wstaffdetailsVO);
    //查询admin网点
    public String selAdmin(WstaffdetailsVO wstaffdetailsVO);
    //根据网点名称查询网点id
    public int selBraid(WvehicleVO wvehicleVO);
    //添加车辆信息
    public int insertCar(WvehicleVO wvehicleVO);
    //删除车辆
    public int delCar(WvehicleVO wvehicleVO);
    //根据id查询车辆信息
    public List<WvehicleVO> selCar(WvehicleVO wvehicleVO);
    //根据id修改车辆信息
    public int updateCar(WvehicleVO wvehicleVO);
    //查询车辆类型
    public List<WvehicleVO> selType();
    //判断车牌相同
    public int selCarsame(WvehicleVO wvehicleVO);
}
