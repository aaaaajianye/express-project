package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.OfferTypeService;
import com.aaa.service.TuserSTwo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

//运单类型价格维护
@Controller
@RequestMapping("/admin/offertype")
public class OfferTypeController {
    @Autowired
    private OfferTypeService offerTypeService;

    @Autowired
    private TuserSTwo tuserSTwo;

    @RequestMapping("offerselect")
    public String toselect() {
        return "data/offerType/offerList";
    }

    @RequestMapping("select")
    @ResponseBody
    public LayuiResult<Offertype> select(Model model, HttpSession session,TuserTwo tuserTwo) {
        LayuiResult<Offertype> result = new LayuiResult<Offertype>();

        List<Offertype> offers = offerTypeService.offerList();

        result.setData(offers);
        //result.setCount();
        return result;
    }

    @RequestMapping("update")
    public String update(Model model, Integer offtyid,Offertype offertype) {
        ModelAndView mav = new ModelAndView();
        offertype.setOfftyid(offtyid);
        List<Offertype> updateselect = offerTypeService.updateselect(offertype);
        model.addAttribute("updateselect",updateselect);
        return "data/offerType/update";
    }

    @ResponseBody
    @RequestMapping("updatedata")
    public String updatedata(Offertype offertype, HttpServletRequest request, HttpSession session){

        offertype.setOfftyid(Integer.valueOf(request.getParameter("offtyid")));
        offertype.setOfferprice(Integer.valueOf(request.getParameter("offerprice")));
        offertype.setOfferremark(request.getParameter("offerremark"));
        int update = offerTypeService.update(offertype);
        System.out.println("==========================================+++++++++++++++++++++++++++++==========="+update);
        return "redirect:/admin/offerType/offerselect";
    }
}
