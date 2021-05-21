package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wexpressdetails;
import com.aaa.service.WexpressdetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;
import java.util.Map;
//运单类型维护
@Controller
@RequestMapping("expressdetailsEdit")
public class WexpressdetailsController {
    @Autowired
    private WexpressdetailsService wexpressdetailsService;
    @RequestMapping("selExpressdetailsUrl")
    public String offerselect()
    {
        return "expressdetails_edit";
    }

    @RequestMapping("selExpressdetails")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Wexpressdetails wexpressdetails){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = wexpressdetailsService.expressdetailsList(baseQuery, wexpressdetails);
        int i = wexpressdetailsService.selectCount(wexpressdetails);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }

    @RequestMapping("update")
    public String update(Model model, String expnum,Wexpressdetails wexpressdetails) {
        ModelAndView mav = new ModelAndView();
        wexpressdetails.setExpnum(expnum);
        List<Wexpressdetails> explist = wexpressdetailsService.updateList(wexpressdetails);
        model.addAttribute("explist",explist);
        return "expressdetailsSelect";
    }
    @RequestMapping("selBranch")
    public String selBranch(Model model,Wexpressdetails wexpressdetails,String braname){
        wexpressdetails.setBraname(braname);
        List<Wexpressdetails> details1s=wexpressdetailsService.selBrancher(wexpressdetails);
        model.addAttribute("details1s",details1s);
        return  "branchSelect";
    }
}
