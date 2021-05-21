package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Pushmoney;
import com.aaa.service.PushmoneyService;
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

//提成维护
@Controller
@RequestMapping("/admin/pushmoney")
public class pushmoneyController {
    @Autowired
    private PushmoneyService pushmoneyService;


    @RequestMapping("/pushmoneyselect")
    public String offerselect()
    {
        return "data/pushmoney/pushmoneyList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery){
        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> pushmonies = pushmoneyService.pushmoneyList();
        result.setData(pushmonies);
        return  result;
    }

    @RequestMapping("/inserturl")
    public String inserturl()
    {
        return "data/pushmoney/insert";
    }
    @RequestMapping("insertPushmoney")
    public String insertOffer(HttpServletRequest request, Pushmoney pushmoney){
        pushmoney.setBrarank(Integer.valueOf(request.getParameter("brarank")));
        pushmoney.setEnroll(Double.valueOf(request.getParameter("enroll")));
        pushmoney.setAddressee(Double.valueOf(request.getParameter("addressee")));
        pushmoney.setAddresser(Double.valueOf(request.getParameter("addresser")));
        pushmoney.setDao(Double.valueOf(request.getParameter("dao")));
        pushmoney.setPai(Double.valueOf(request.getParameter("pai")));
        pushmoney.setQian(Double.valueOf(request.getParameter("qian")));
        pushmoneyService.insertPushmoney(pushmoney);
        return "redirect:/admin/pushmoney/pushmoneyselect";
    }

    @RequestMapping("update")
    public String update(Model model, Integer pushid, Pushmoney pushmoney) {
        ModelAndView mav = new ModelAndView();
        pushmoney.setPushid(pushid);
        List<Pushmoney> pushmonies = pushmoneyService.updateSelect(pushmoney);
        model.addAttribute("pushmoney",pushmonies);
        return "data/pushmoney/update";
    }
    @ResponseBody
    @RequestMapping("updatedata")
    public String updatedata(Pushmoney pushmoney, HttpServletRequest request, HttpSession session){

        pushmoney.setPushid(Integer.valueOf(request.getParameter("pushid")));
        pushmoney.setBrarank(Integer.valueOf(request.getParameter("brarank")));
        pushmoney.setEnroll(Double.valueOf(request.getParameter("enroll")));
        pushmoney.setAddressee(Double.valueOf(request.getParameter("addressee")));
        pushmoney.setAddresser(Double.valueOf(request.getParameter("addresser")));
        pushmoney.setDao(Double.valueOf(request.getParameter("dao")));
        pushmoney.setPai(Double.valueOf(request.getParameter("pai")));
        pushmoney.setQian(Double.valueOf(request.getParameter("qian")));
        pushmoneyService.update(pushmoney);
        return "redirect:/admin/pushmoney/toselect";
    }

    @ResponseBody
    @RequestMapping("del")
    public  String del(Integer pushid, Pushmoney pushmoney){
        pushmoney.setPushid(pushid);
        pushmoneyService.del(pushmoney);
        return "redirect:/admin/pushmoney/toselect";
    }
}
