package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.entity.WvehicleVO;
import com.aaa.service.WvehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;


//车辆信息
@Controller
@RequestMapping("carEdit")
public class CarEditController {
    @Autowired
    private WvehicleService wvehicleService;

    @RequestMapping("carSelecturl")
    public String userSelecturl() {
        return "car_edit";
    }
    @RequestMapping("selCar")
    @ResponseBody
    public LayuiResult<Map> carEdit(BaseQuery baseQuery,WvehicleVO wvehicleVO,WstaffdetailsVO wstaffdetailsVO,HttpSession session){
        LayuiResult<Map> result = new LayuiResult<Map>();
        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);

        //获取员工所属网点名称
        String braname =wvehicleService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        wvehicleVO.setBraname(braname);
        String admin="admin";
        wvehicleVO.setHeiger(admin);
        wstaffdetailsVO.setHeiger(admin);
        String hname=wvehicleService.selAdmin(wstaffdetailsVO);
        wstaffdetailsVO.setHname(hname);
        wvehicleVO.setHname(hname);
        List<Map> allCar=wvehicleService.findCar(baseQuery,wvehicleVO);
        int carCount=wvehicleService.selectCount(wvehicleVO);
        result.setData(allCar);
        result.setCount(carCount);
        return result;
    }
    //添加
    @RequestMapping("add")

    public String insertCar(){

        return "carInsert";
    }
    @RequestMapping("selBraname")
    @ResponseBody
    public Object selBraname(WstaffdetailsVO wstaffdetailsVO,WvehicleVO wvehicleVO, HttpSession session){
        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);

        String braname =wvehicleService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        wvehicleVO.setBraname(braname);
        String admin="admin";
        wstaffdetailsVO.setHeiger(admin);
        String hname=wvehicleService.selAdmin(wstaffdetailsVO);
        wstaffdetailsVO.setHname(hname);
        wvehicleVO.setHname(hname);

        List<WstaffdetailsVO> list=wvehicleService.selBranameTwo(wstaffdetailsVO);

        return list;
    }
    @RequestMapping("selType")
    @ResponseBody
    public Object seltype(){
      List<WvehicleVO> list=wvehicleService.selType();

        return list;

    }
    @RequestMapping("toAdd")
    @ResponseBody
    public Object toAdd(WvehicleVO wvehicleVO, HttpServletRequest request){
       wvehicleVO.setBraid(Integer.valueOf(request.getParameter("braid")));

       wvehicleVO.setVehdirver(request.getParameter("vehdirver"));
       wvehicleVO.setVehphone(request.getParameter("vehphone"));
       wvehicleVO.setVehids(request.getParameter("vehids"));
       wvehicleVO.setVehnum(request.getParameter("vehnum"));
       wvehicleVO.setVehmodal(request.getParameter("vehmodal"));

       wvehicleVO.setVehilo(Integer.valueOf(request.getParameter("vehilo")));
       wvehicleVO.setVehtime(request.getParameter("vehtime"));
       wvehicleVO.setVehnode(request.getParameter("vehnode"));
       //状态
       wvehicleVO.setState(request.getParameter("vehstate"));
       wvehicleVO.setVehtunnage(Integer.valueOf(request.getParameter("vehtunnage")));
       wvehicleVO.setTypename(request.getParameter("typename"));
       wvehicleVO.setTransid(Integer.valueOf(request.getParameter("transid")));
       int carcount= wvehicleService.selCarsame(wvehicleVO);
       if(carcount==1){
           int data=carcount+1;
           return data;
       }else {
           int count= wvehicleService.insertCar(wvehicleVO);
           String data=String.valueOf(count);
           return data;
       }


    }
    //删除
    @RequestMapping("delCar")
    public String delCar(WvehicleVO wvehicleVO,Integer vehid){
        wvehicleVO.setVehid(vehid);
        wvehicleService.delCar(wvehicleVO);
        return "redirect:/carEdit/carSelecturl";
    }
    //查询
    @RequestMapping("selCarTwo")
    public String selCar(WvehicleVO wvehicleVO,Model model){
       List<WvehicleVO> list= wvehicleService.selCar(wvehicleVO);
       model.addAttribute("list",list);
        return "carUpdate";
    }
    //修改车辆信息
    @RequestMapping("updateCar")
    @ResponseBody
    public Object updateCar(WvehicleVO wvehicleVO,HttpServletRequest request){
        wvehicleVO.setVehid(Integer.valueOf(request.getParameter("vehid")));
        wvehicleVO.setVehdirver(request.getParameter("vehdirver"));
        wvehicleVO.setVehphone(request.getParameter("vehphone"));
        wvehicleVO.setVehids(request.getParameter("vehids"));
        wvehicleVO.setVehnum(request.getParameter("vehnum"));
        wvehicleVO.setVehmodal(request.getParameter("vehmodal"));
        wvehicleVO.setVehtunnage(Integer.valueOf(request.getParameter("vehtunnage")));
        wvehicleVO.setVehilo(Integer.valueOf(request.getParameter("vehilo")));
        wvehicleVO.setVehnode(request.getParameter("vehnode"));
        int count=wvehicleService.updateCar(wvehicleVO);
        String data=String.valueOf(count);

        return data;

    }
}
