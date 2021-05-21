package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.Express;
import com.aaa.entity.LayuiResult;
import com.aaa.service.ExpressService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//运单
@Controller
@RequestMapping("/admin/express")
public class ExpressController {
    @Autowired
    private ExpressService expressService;

    @RequestMapping("/expressselect")
    public String offerselect()
    {
        return "data/express/expressList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Express express){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = expressService.expressList(baseQuery, express);
        int i = expressService.selectCount(express);
        System.out.println(i+"=====================----+++++++====="+maps);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }

    @RequestMapping("update")
    public String update(Model model, String expnum, Express express) {
        ModelAndView mav = new ModelAndView();
        express.setExpnum(expnum);
        List<Express> expresses = expressService.updateSelect(express);
        model.addAttribute("expresses",expresses);
        return "data/express/update";
    }
    @ResponseBody
    @RequestMapping("updatedata")
    public String updatedata(Express express, HttpServletRequest request, HttpSession session){

        express.setExpnum(request.getParameter("expnum"));
        express.setRecipient(request.getParameter("recipient"));
        express.setRecphone(request.getParameter("recphone"));
        express.setRecprovince(request.getParameter("provid"));
        express.setReccity(request.getParameter("cityid"));
        express.setReccounty(request.getParameter("areaid"));
        express.setRecdetailaddress(request.getParameter("recdetailaddress"));
        expressService.update(express);
        return "redirect:/admin/express/expressselect";
    }
}
