package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wtranstype;
import com.aaa.service.WtranstypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
//运输方式
@Controller
@RequestMapping("transEdit")
public class WtranstypeController {
    @Autowired
    private WtranstypeService wtranstypeService;
    @RequestMapping("transSelecturl")
    public String userSelecturl() {
        return "trans_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findPay(BaseQuery baseQuery, Wtranstype wtranstype){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= wtranstypeService.findTrans(baseQuery,wtranstype);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("add")
    public String add(){
        return "transInsert";
    }
    @RequestMapping("addTrans")
    @ResponseBody
    public Object insert( Wtranstype wtranstype, HttpServletRequest request){
        wtranstype.setTranstype(request.getParameter("transtype"));
        wtranstype.setTranstime(request.getParameter("transtime"));
        int d=wtranstypeService.insertTrans(wtranstype);
        String data=String.valueOf(d);
        return data;
    }
    @RequestMapping("delTrans")
    public String delItem(Wtranstype wtranstype,Integer transid){
        wtranstype.setTransid(transid);
        wtranstypeService.delTrans(wtranstype);
        return "redirect:/transEdit/transSelecturl";
    }
}
