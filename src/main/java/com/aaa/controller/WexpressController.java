package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wexpress;
import com.aaa.service.WexpressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;
//签收单查询
@Controller
@RequestMapping("expressSel")
public class WexpressController {
    @Autowired
    private WexpressService wexpressService;
    @RequestMapping("expressSelecturl")
    public String userSelecturl() {
        return "express_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findItem(BaseQuery baseQuery, Wexpress wexpress){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= wexpressService.findExpress(baseQuery,wexpress);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("sel")
    public String selExpid(Wexpress wexpress, Model model){
       List<Wexpress> list= wexpressService.selAll(wexpress);
       model.addAttribute("list",list);
        return "expressSelect";
    }
}
