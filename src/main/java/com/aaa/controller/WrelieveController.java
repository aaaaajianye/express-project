package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.WrecordService;
import com.aaa.service.WrelieveService;
import com.aaa.service.WvehicleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
//网点员工维护
@Controller
@RequestMapping("relieveEdit")
public class WrelieveController {
    @Autowired
    private WrelieveService wrelieveService;
    @Autowired
    private WvehicleService wvehicleService;
    @Autowired
    private WrecordService wrecordService;
    @RequestMapping("relieveUrl")
    public String selUrl(){
        return "relieve_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public Object relieve(Wbranch wbranch,WstaffdetailsVO wstaffdetailsVO,HttpSession session){
        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);
        //获取员工所属网点名称
        String braname =wvehicleService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        wbranch.setBraname(braname);
        String admin="admin";
        wstaffdetailsVO.setHeiger(admin);
        String hname=wvehicleService.selAdmin(wstaffdetailsVO);
        wbranch.setHname(hname);

        List<Wbranch> braList=wrelieveService.findAll(wbranch);
        return braList;
    }
    @RequestMapping("findAllBra")
    @ResponseBody
    public Object findAllBra(Wbranch wbranch){
        List<Wbranch> braList=wrelieveService.findAllBra();
        return braList;
    }
    @RequestMapping("updateBranch")
    @ResponseBody
    public Object updateBranch(Wbranch wbranch,Wrecord wrecord,Integer braid,Integer staid){
        wbranch.setBraid(braid);
        wbranch.setStaid(staid);
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        wrecord.setShijian(nowTime);
        int data=wrelieveService.updateBranch(wbranch);
        wrecordService.insertRecord(wrecord);
        return data;
    }
    @RequestMapping("selBrapin")
    @ResponseBody
    public Object selBrapin(Wbranch wbranch,String braname,String truename){
        wbranch.setBraname(braname);
        String brapin=wrelieveService.selBrapin(wbranch);
        if(truename.equals(brapin)){
            int data=1;
            return data;
        }else {
            int data=2;
            return data;
        }

    }

}
