package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wrecord;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.service.TuserTwoService;
import com.aaa.service.WrecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//员工调岗维护
@Controller
@RequestMapping("recordEdit")
public class WrecordController {
    @Autowired
    private WrecordService wrecordService;
    @Autowired
    private TuserTwoService tuserTwoService;
    @RequestMapping("selUrl")
    public String selUrl(){
        return "record_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> selAll(Wrecord wrecord, BaseQuery baseQuery, HttpSession session, WstaffdetailsVO wstaffdetailsVO){
        LayuiResult<Map> result = new LayuiResult<Map>();
        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);
        //获取员工姓名
        String truename=tuserTwoService.selTruename(wstaffdetailsVO);
        wstaffdetailsVO.setTname(truename);
        //获取员工所属网点名称
        String braname =tuserTwoService.selBraname(wstaffdetailsVO);
        wrecord.setBraname(braname);
       List<Map>  list= wrecordService.selAll(baseQuery,wrecord);
       int count= wrecordService.selectCount(wrecord);
       result.setData(list);
       result.setCount(count);
       return result;
    }
    //调入员工
    @RequestMapping("selFold")
    public Object selFold(Wrecord wrecord){
        List<Wrecord> fold= wrecordService.selFold(wrecord);
        return fold;
    }
}
