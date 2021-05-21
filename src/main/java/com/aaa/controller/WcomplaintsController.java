package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wcomplaints;
import com.aaa.entity.WstaffdetailsVO;
import com.aaa.service.WcomplaintsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
//员工投诉
@Controller
@RequestMapping("complaintsEdit")
public class WcomplaintsController {
    @Autowired
    private WcomplaintsService wcomplaintsService;
    @RequestMapping("toComplaintsUrl")
    public String toComplaints(){
        return "complaints_edit";
    }
    @RequestMapping("toAll")
    @ResponseBody
    public LayuiResult<Map> finAll(BaseQuery baseQuery, Wcomplaints wcomplaints){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> list =wcomplaintsService.findAll(baseQuery,wcomplaints);
        int count=wcomplaintsService.selectCount(wcomplaints);
        result.setData(list);
        result.setCount(count);
        return result;
    }
    @RequestMapping("add")
    public String toAdd(){

        return "complaintsInsert";
    }
    @RequestMapping("insert")
    @ResponseBody
    public Object toInsert(Wcomplaints wcomplaints,HttpServletRequest request){
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        wcomplaints.setComdate(nowTime);
        wcomplaints.setComfinemoney(Integer.valueOf(request.getParameter("comfinemoney")));
        wcomplaints.setCombranch(request.getParameter("braname"));
        wcomplaints.setComcontent(request.getParameter("comcontent"));
        wcomplaints.setComexpnum(request.getParameter("comexpnum"));
        wcomplaints.setComtuser(request.getParameter("truename"));
        int sames=wcomplaintsService.selSame(wcomplaints);
        if(sames!=0){
            int count=wcomplaintsService.updateCom(wcomplaints);
            int data=wcomplaintsService.insertCom(wcomplaints);
            return data;
        }else {
            sames=0;
            return  sames;
        }


    }
    @RequestMapping("toSelectUrl")
    public String toSelectUrl(){
        return "complaintsSelect";
    }
    @RequestMapping("toList")
    @ResponseBody
    public LayuiResult<Map> toList(BaseQuery baseQuery, Wcomplaints wcomplaints, HttpSession session, WstaffdetailsVO wstaffdetailsVO){
        LayuiResult<Map> result = new LayuiResult<Map>();

        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);

        //获取员工所属网点名称
        String braname =wcomplaintsService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        wcomplaints.setCombranch(braname);
        String admin="admin";
        wcomplaints.setHeiger(admin);
        wstaffdetailsVO.setHeiger(admin);
        String hname=wcomplaintsService.selAdmin(wstaffdetailsVO);
        wstaffdetailsVO.setHname(hname);
        wcomplaints.setHname(hname);

        List<Map> list =wcomplaintsService.SelAll(baseQuery,wcomplaints);
        int count=wcomplaintsService.selCount(wcomplaints);
        result.setData(list);
        result.setCount(count);
        return result;
    }
}
