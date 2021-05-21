package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wpaymethod;
import com.aaa.service.WpaymethodService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
//快递类型维护
@Controller
@RequestMapping("payEdit")
public class WpaymethodController {
    @Autowired
    private WpaymethodService wpaymethodService;
    @RequestMapping("paySelecturl")
    public String userSelecturl() {
        return "pay_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findPay(BaseQuery baseQuery, Wpaymethod wpaymethod){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= wpaymethodService.findPay(baseQuery,wpaymethod);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("add")
    public String add(){
        return "payInsert";
    }
    @RequestMapping("addPay")
    @ResponseBody
    public Object insert(Wpaymethod wpaymethod, HttpServletRequest request){
        wpaymethod.setPaytype(request.getParameter("paytype"));
        wpaymethod.setPaynode(request.getParameter("paynode"));
        wpaymethod.setPaytime(request.getParameter("paytime"));
        int d=wpaymethodService.insertPay(wpaymethod);
        String data=String.valueOf(d);
        return data;
    }
    @RequestMapping("delPay")
    public String delItem(Wpaymethod wpaymethod,Integer payid){
        wpaymethod.setPayid(payid);
        wpaymethodService.delPay(wpaymethod);
        return "redirect:/payEdit/paySelecturl";
    }
}
