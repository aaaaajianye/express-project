package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wexpresstype;
import com.aaa.service.WexpresstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
//类型维护Controller
@Controller
@RequestMapping("expEdit")
public class ExpressEditController {
    @Autowired
    private WexpresstypeService wexpresstypeService;
    @RequestMapping("expSelecturl")
    public String userSelecturl() {
        return "exp_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findItem(BaseQuery baseQuery, Wexpresstype wexpresstype){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= wexpresstypeService.findItem(baseQuery,wexpresstype);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("add")
    public String add(){
        return "expInsert";
    }
    @RequestMapping("addItem")
    @ResponseBody
    public Object insert(Wexpresstype wexpresstype, HttpServletRequest request){
        wexpresstype.setExptype(request.getParameter("exptype"));
        wexpresstype.setExptime(request.getParameter("exptime"));
        int d=wexpresstypeService.insertItem(wexpresstype);
        String data=String.valueOf(d);
        return data;
    }
    @RequestMapping("delItem")
    public String delItem(Wexpresstype wexpresstype,Integer exptypeid){
        wexpresstype.setExptypeid(exptypeid);
        wexpresstypeService.delItem(wexpresstype);
        return "redirect:/expEdit/expSelecturl";
    }
}
