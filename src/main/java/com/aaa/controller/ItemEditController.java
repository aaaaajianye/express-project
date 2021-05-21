package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Witemtype;
import com.aaa.service.WitemtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

//物品类型
@Controller
@RequestMapping("itemEdit")
public class ItemEditController {
    @Autowired
    private WitemtypeService witemtypeService;
    @RequestMapping("itemSelecturl")
    public String userSelecturl() {
        return "item_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findItem(BaseQuery baseQuery,Witemtype witemtype){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= witemtypeService.findItem(baseQuery,witemtype);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("add")
    public String add(){
        return "itemInsert";
    }
    @RequestMapping("addItem")
    @ResponseBody
    public Object insert(Witemtype witemtype, HttpServletRequest request){
        witemtype.setItemtype(request.getParameter("itemtype"));
        witemtype.setItemtime(request.getParameter("itemtime"));
        int d=witemtypeService.insertItem(witemtype);
        String data=String.valueOf(d);
        return data;
    }
    @RequestMapping("delItem")
    public String delItem(Witemtype witemtype,Integer itemid){
        witemtype.setItemid(itemid);
        witemtypeService.delItem(witemtype);
        return "redirect:/itemEdit/itemSelecturl";
    }
}
