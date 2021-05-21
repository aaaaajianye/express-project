package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

//公司账单查询
@Controller
@RequestMapping("gongsi")
public class GongsizhangdanController {
    @Autowired
    GongsizhangdanService gongsizhangdanService;
    @Autowired
    QixiazhangdanService qixiazhangdanService;
    @Autowired
    QixiagerenService qixiagerenService;
    @Autowired
    private BranchService branchService;
    @Autowired
    private TuserSTwo tuserSTwo;
    @RequestMapping("gongsimoney")
    public String Gongsi(Model model){
        //公司总收益
        int gongsizhong=gongsizhangdanService.zongmoney();
        double gongsizhong2=gongsizhong;

        //旗下公司总收益
        Branchexpend branchexpend=qixiazhangdanService.qixiamoney();
        double braexludan=branchexpend.getBraexludan();
        double braexaddress=branchexpend.getBraexaddress();
        double braexaddresser=branchexpend.getBraexaddresser();
        double bradaojian=branchexpend.getBradaojian();
        double braexdelivery=branchexpend.getBraexdelivery();
        double braexsign=branchexpend.getBraexsign();
        double brawentijian=branchexpend.getBrawentijian();
        double complaintsmoney=branchexpend.getComplaintsmoney();
        double qixiazong2=braexludan+braexaddress+braexaddresser+bradaojian+braexdelivery+braexsign;
        double gongsizhong3=gongsizhong2-qixiazong2;
        double zongpeifu=complaintsmoney+brawentijian;
        double qixiazong=braexludan+braexaddress+braexaddresser+bradaojian+braexdelivery+braexsign-brawentijian-complaintsmoney;
        //公司总收入
        model.addAttribute("zongshouyi",gongsizhong2);

        //公司净收益
        model.addAttribute("gongsizhong3",gongsizhong3);
        //旗下总收益
        model.addAttribute("qixiazong2",qixiazong2);
        //旗下问题赔偿
        model.addAttribute("zongpei",brawentijian);
        //旗下投诉赔付
        model.addAttribute("complaintsmoney",complaintsmoney);
        //旗下总赔付
        model.addAttribute("zongpeifu",zongpeifu);
        //旗下净收入
        model.addAttribute("qixiajing",qixiazong);
        //网点所有金额收益
        model.addAttribute("wangdanxinx",branchexpend);
        return "data/gongsizhangdan/gongsizhangdan";
    }
    //网点账单查询
    @RequestMapping("wangdianmoney")
    public String Wangdian(Model model, HttpSession session, TuserTwo tuserTwo){
        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);

        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
        if (brarank==1){
            List<Branch> wangdianxi = branchService.branchAll();
            model.addAttribute("wangdianxi",wangdianxi);
            return "data/gongsizhangdan/wangdianzhangdan";
        }else {
            Branchexpend branchexpend= qixiagerenService.selectgeren(userName);
            model.addAttribute("braexp",branchexpend);
            return "data/gongsizhangdan/wangdianzhangdan2";
        }

    }
    //网点订单查询
    @RequestMapping("wangdiandingdan")
    public String wangdiandingdan(Model model, HttpSession session, TuserTwo tuserTwo){
        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);
        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
        System.out.println(brarank+"----------------");
        if (brarank==1){
            List<Branch> wangdianxi = branchService.branchAll();
            model.addAttribute("wangdianxi",wangdianxi);
            return "data/gongsizhangdan/wangdiandingdan";
        }else {
            Branchexpend branchexpend= qixiagerenService.selectgeren(userName);
            model.addAttribute("braexp2",branchexpend);
            return "data/gongsizhangdan/wangdiandingdan2";
        }

    }

    @RequestMapping("wangzhang")
    @ResponseBody
    public Branchexpend selectqizhang(Branchexpend branchexpend){
        String braexname = branchexpend.getBraexname();
        Branchexpend branchexpend1= qixiazhangdanService.selectqizhang(braexname);
        System.out.println(branchexpend1+"----+++++++++++");
        return branchexpend1;
    }
}
