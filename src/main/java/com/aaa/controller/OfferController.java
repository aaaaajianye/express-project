package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Offer;
import com.aaa.service.OfferService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;
//运单报价维护
@Controller
@RequestMapping("/admin/offer")
public class OfferController {
    @Autowired
    private OfferService offerService;

    @RequestMapping("/offerselect")
    public String offerselect()
    {
        return "data/offer/offerList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Offer offer){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = offerService.offerList(baseQuery, offer);
        int i = offerService.selectCount(offer);
        System.out.println(i+"=====================----+++++++====="+maps);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }
    @RequestMapping("/inserturl")
    public String inserturl()
    {
        return "data/offer/insert";
    }
    @RequestMapping("insertOffer")
    @ResponseBody
    public Object insertOffer(HttpServletRequest request,Offer offer){
        offer.setOffersend(request.getParameter("offersend"));
        offer.setOffergoal(request.getParameter("offergoal"));

        offer.setOfferprice(Double.valueOf(request.getParameter("offerprice")));
        offer.setOfferprice2(Double.valueOf(request.getParameter("offerprice2")));
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        offer.setOffertime(nowTime);
        offer.setCustrank(Integer.valueOf(request.getParameter("custrank")));
        offer.setOfferday(Integer.valueOf(request.getParameter("offerday")));
        offer.setTransid(Integer.valueOf(request.getParameter("transid")));
        Integer data = offerService.insertSelete(offer);
        System.out.println(request.getParameter("offersend"));
        System.out.println(request.getParameter("offergoal"));
        System.out.println(request.getParameter("transid"));
        System.out.println(data+"----------===============++++++++++++++++++++===============");
        if (data==0){
            offerService.insertOffer(offer);
        }

        return data;   //"redirect:/admin/offer/offerselect"
    }

    @ResponseBody
    @RequestMapping("del")
    public  String del(Integer offerid, Offer offer){
        offer.setOfferid(offerid);
        offerService.del(offer);
        return "redirect:/admin/offer/offerselect";
    }

    @RequestMapping("update")
    public String update(Model model, Integer offerid, Offer offer) {
        ModelAndView mav = new ModelAndView();
        offer.setOfferid(offerid);
        List<Offer> offers = offerService.updateSelect(offer);
        model.addAttribute("offers",offers);
        return "data/offer/update";
    }
    @ResponseBody
    @RequestMapping("updatedata")
    public String updatedata(Offer offer, HttpServletRequest request, HttpSession session){

       offer.setOfferid(Integer.valueOf(request.getParameter("offerid")));
        offer.setOfferprice(Double.valueOf(request.getParameter("offerprice")));
        offer.setOfferprice2(Double.valueOf(request.getParameter("offerprice2")));
        offerService.update(offer);
        return "redirect:/admin/offer/toselect";
    }
}
