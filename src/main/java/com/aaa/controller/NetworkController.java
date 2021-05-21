package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.BranchSQService;
import com.aaa.service.BranchService;
import com.aaa.service.BranchexpendService;
import com.aaa.service.TuserSTwo;
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
//账号权限管理
@Controller
@RequestMapping("/admin/network")
public class NetworkController {
    @Autowired
    private BranchService branchService;
    @Autowired
    private TuserSTwo tuserSTwo;
    @Autowired
    private BranchexpendService branchexpendService;
    @Autowired
    private BranchSQService branchSQService;

    @RequestMapping("toselect")
    public String toselect( Model model, HttpSession session, TuserTwo tuserTwo) {
        String userName = session.getAttribute("userName").toString();//获取账号
        if(userName.equals("admin")){
            model.addAttribute("brarank",0);
        }else{
            tuserTwo.setUsername(userName);
            List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
            Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
            model.addAttribute("brarank",brarank);
        }
        return "data/network/networkList";
    }
    @RequestMapping("select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Model model, HttpSession session, TuserTwo tuserTwo, Branch branch) {
        LayuiResult<Map> result = new LayuiResult<Map>();
        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);
        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
        if(userName.equals("admin")){
            branch.setBrarank(0);
            branch.setBraname("admin");
            List<Map> branches = branchService.branchList(baseQuery, branch);
            System.out.println("看这里" + branches);
            int i = branchService.selectCount(branch);
            result.setData(branches);
            result.setCount(i);
            //session.setAttribute("brarank",0);
            model.addAttribute("brarank",0);
            return result;
        }else if (brarank==1){
            String braname = tusers.get(0).getBraname();
            branch.setBrarank(brarank);
            branch.setBraname(braname);
            List<Map> branches = branchService.branchList(baseQuery, branch);
            System.out.println("看这里" + branches);
            int i = branchService.selectCount(branch);
            System.out.println(branches);
            result.setData(branches);
            result.setCount(i);
            //session.setAttribute("brarank",brarank);
            model.addAttribute("brarank",brarank);
            return result;
        }else {
            String braname = tusers.get(0).getBraname();
            branch.setBrarank(brarank);
            branch.setBraname(braname);
            List<Map> branches = branchService.branchListc(baseQuery, branch);
            System.out.println("看这里" + branches);
            int i = branchService.selectCountc(branch);
            System.out.println(branches);
            result.setData(branches);
            result.setCount(i);
            //session.setAttribute("brarank",brarank);
            model.addAttribute("brarank",brarank);
            return result;
        }
    }
    @RequestMapping("selbranch")
    @ResponseBody
    public Object selbranch(Branch branch,HttpSession session,TuserTwo tuserTwo,Model model){
        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);
        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
        String braname = tusers.get(0).getBraname();
        if(userName.equals("admin")){
            branch.setBrarank(0);
            branch.setBraname("admin");
            List<Branch> branches1 = branchService.branchAll();
            System.out.println("qwerqwe========qwer=qwer=qwe=r=qwer=qwer=qw=er"+branches1.get(0).getBraname()+branches1.get(0).getBrarank());
            return branches1;
        }else if(brarank==1){
            branch.setBrarank(brarank);
            branch.setBraname(braname);
            List<Branch> branches1 = branchService.branchMy(branch);
            //session.setAttribute("branches1",branches1);
            System.out.println("qwerqwe========qwer=qwer=qwe=r=qwer=qwer=qw=er"+branches1.get(0).getBraname()+branches1.get(0).getBrarank());
            return branches1;
        }else if (brarank>1){
            //写这里
            tuserTwo.setUsername(userName);
            List<Branch> branches1 = tuserSTwo.tuserList(tuserTwo);
            return branches1;
        }
        return null;
    }



    @ResponseBody
    @RequestMapping("insertbranch")
    public String insertbranch(Branch branch,BranchSQ branchSQ, HttpServletRequest request, HttpSession session, TuserTwo tuserTwo,Branchexpend branchexpend) {

        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);
        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        Integer brarank = Integer.valueOf(tusers.get(0).getBrarank()).intValue();//权限等级数字
        if (userName.equals("admin")){

            int i = (int)(Math.random()*900 + 100);
             String myStr = Integer.toString(i);
             System.out.println(myStr);
            branch.setBracode("2021"+myStr);
            branch.setBraname(request.getParameter("braname"));
            PinyinUtils pinyinUtils=new PinyinUtils();
            String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(request.getParameter("braname"));
            branch.setBranameEnglish(firstPinYinHeadChar);
            branch.setBraprovince(request.getParameter("provid"));
            branch.setBraid(Integer.valueOf(request.getParameter("typebraid")));
            List<Branch> selbraname = branchService.selbraname(branch);
            branch.setBrarank(selbraname.get(0).getBrarank());
            branch.setBrasuoshu(selbraname.get(0).getBraname());
            branch.setBracity(request.getParameter("cityid"));
            branch.setBracounty(request.getParameter("areaid"));
            branch.setBraaddress(request.getParameter("braaddress"));
            System.out.println("insertbranch1=======值"+selbraname.get(0).getBraname());
            System.out.println("insertbranch1=======值"+selbraname.get(0).getBraname());
            branch.setBraremark(request.getParameter("braremark"));
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            branch.setBratime(nowTime);
            branchService.insertBranch(branch);
            branchexpend.setBraexname(request.getParameter("braname"));
            branchexpendService.insertBranchexpend(branchexpend);
            System.out.println(branch);
        }else if(brarank==1) {
            int i = (int)(Math.random()*900 + 100);
            String myStr = Integer.toString(i);
            System.out.println(myStr);
            branch.setBracode("2021"+myStr);
            branch.setBraname(request.getParameter("braname"));
            PinyinUtils pinyinUtils=new PinyinUtils();
            String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(request.getParameter("braname"));
            branch.setBranameEnglish(firstPinYinHeadChar);
            branch.setBraprovince(request.getParameter("provid"));
            branch.setBraid(Integer.valueOf(request.getParameter("typebraid")));
            List<Branch> selbraname = branchService.selbraname(branch);
            branch.setBrarank(selbraname.get(0).getBrarank());
            branch.setBrasuoshu(selbraname.get(0).getBraname());
            System.out.println("insertbranch2=======值"+selbraname.get(0).getBraname());
            System.out.println("insertbranch2=======值"+selbraname.get(0).getBrarank());
            branch.setBracity(request.getParameter("cityid"));
            branch.setBracounty(request.getParameter("areaid"));
            branch.setBraaddress(request.getParameter("braaddress"));
            branch.setBraremark(request.getParameter("braremark"));
            String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
            branch.setBratime(nowTime);
            branchService.insertBranch(branch);
            branchexpend.setBraexname(request.getParameter("braname"));
            branchexpendService.insertBranchexpend(branchexpend);
            System.out.println(branch);
        }
        return "redirect:/admin/network/toselect";
    }

    @ResponseBody
    @RequestMapping("insertbranchSQ")
    public String insertbranchSQ(Branch branch,BranchSQ branchSQ, HttpServletRequest request, HttpSession session, TuserTwo tuserTwo,Branchexpend branchexpend) {
        int i = (int)(Math.random()*900 + 100);
        String myStr = Integer.toString(i);
        System.out.println(myStr);
        branchSQ.setBracode("2021"+myStr);
        branchSQ.setBraname(request.getParameter("braname"));
        PinyinUtils pinyinUtils=new PinyinUtils();
        String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(request.getParameter("braname"));
        branchSQ.setBranameEnglish(firstPinYinHeadChar);
        branchSQ.setBraprovince(request.getParameter("provid"));
        branch.setBraid(Integer.valueOf(request.getParameter("typebraid")));
        List<Branch> selbraname = branchService.selbraname(branch);
        branchSQ.setBrarank(selbraname.get(0).getBrarank());
        branchSQ.setBrasuoshu(selbraname.get(0).getBraname());
        System.out.println("=======值"+selbraname.get(0).getBraname());
        System.out.println("=======值"+selbraname.get(0).getBrarank());
        branchSQ.setBracity(request.getParameter("cityid"));
        branchSQ.setBracounty(request.getParameter("areaid"));
        branchSQ.setBraaddress(request.getParameter("braaddress"));
        branchSQ.setBraremark(request.getParameter("braremark"));
        String nowTime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        branchSQ.setBratime(nowTime);
        branchSQ.setState(1);
        branchSQService.insertBranchSQ(branchSQ);
        branchexpend.setBraexname(request.getParameter("braname"));
        branchexpendService.insertBranchexpend(branchexpend);
        System.out.println(branch);
        return "redirect:/admin/network/toselect";
    }

        @RequestMapping("update")
    public String update(Model model, String bracode, Branch branch,HttpSession session,TuserTwo tuserTwo) {
        ModelAndView mav = new ModelAndView();
        branch.setBracode(bracode);
        List<Branch> branches = branchService.updateList(branch);
        List<TuserTwo> tuserTwos = branchService.selTuser(branch);
            List<Branch> braprincipal = branchService.brapricipalList(branch);
            String braprincipal1 = braprincipal.get(0).getBraprincipal();
            model.addAttribute("braprincipal1",braprincipal1);
            System.out.println(braprincipal1+"======================================================165151611516sdsdc=========");
        model.addAttribute("tuserTwos",tuserTwos);
        model.addAttribute("bracode",bracode);
        model.addAttribute("branches",branches);
        return "data/network/update";
    }
    @ResponseBody
    @RequestMapping("updatedata")
    public String updatedata(Branch branch, HttpServletRequest request, HttpSession session){
        branch.setBracode(request.getParameter("bracode"));
        branch.setBraname(request.getParameter("braname"));
        PinyinUtils pinyinUtils=new PinyinUtils();
        String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(request.getParameter("braname"));

        branch.setBranameEnglish(firstPinYinHeadChar);
        branch.setBraaddress(request.getParameter("braaddress"));
        branch.setBraprincipal(request.getParameter("typetext"));
        branch.setBraphone(request.getParameter("braphone"));
        branch.setBraremark(request.getParameter("braremark"));
        branchService.update(branch);
        return "redirect:/admin/network/toselect";
    }

    @ResponseBody
    @RequestMapping("del")
    public  String del(String bracode, Branch branch){
        branch.setBracode(bracode);
        branchService.del(branch);
        return "redirect:/admin/network/toselect";
    }

    @RequestMapping("branchSQurl")
    public String branchSQurl() {
        return "data/network/BranchSQList";
    }

    @RequestMapping("branchSQselect")
    @ResponseBody
    public LayuiResult<Map> branchSQselect(BaseQuery baseQuery, Model model, HttpSession session,BranchSQ branchSQ){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> maps = branchSQService.branchSQList(baseQuery, branchSQ);
        int i = branchSQService.selectCount(branchSQ);
        result.setData(maps);
        result.setCount(i);
        return result;
    }

    @RequestMapping("updatepass")
    @ResponseBody
    public String updatepass(HttpServletRequest request, HttpSession session,BranchSQ branchSQ,String bracode,Branch branch){
        branchSQ.setBracode(bracode);
        int updatepass = branchSQService.updatepass(branchSQ);
        if (updatepass>0){
            List<BranchSQ> updatesel = branchSQService.updatesel(branchSQ);
            System.out.println("updatesel=========="+updatesel.get(0).getBraname());
            branch.setBracode(updatesel.get(0).getBracode());
            branch.setBraname(updatesel.get(0).getBraname());
            PinyinUtils pinyinUtils=new PinyinUtils();
            String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(updatesel.get(0).getBraname());
            branch.setBranameEnglish(firstPinYinHeadChar);
            branch.setBraprovince(updatesel.get(0).getBraprovince());
            branch.setBracity(updatesel.get(0).getBracity());
            branch.setBracounty(updatesel.get(0).getBracounty());
            branch.setBraaddress(updatesel.get(0).getBraaddress());
            branch.setBrasuoshu(updatesel.get(0).getBrasuoshu());
            branch.setBrarank(updatesel.get(0).getBrarank());
            branch.setBraprincipal(updatesel.get(0).getBraprincipal());
            branch.setBraphone(updatesel.get(0).getBraphone());
            branch.setBraremark(updatesel.get(0).getBraremark());
            branch.setBratime(updatesel.get(0).getBratime());
            branchService.insertBranch(branch);
        }
        return "redirect:/admin/network/branchSQurl";
    }

    @ResponseBody
    @RequestMapping("updateturn")
    public  Object updateturn(HttpServletRequest request,HttpSession session,BranchSQ branchSQ,String bracode){
        branchSQ.setBracode(request.getParameter("bracode"));
        branchSQ.setReason(request.getParameter("reason"));
        int date=branchSQService.updateturn(branchSQ);

        return date;
    }

    @ResponseBody
    @RequestMapping("branameone")
    public  Object branameone(HttpServletRequest request,HttpSession session,Branch branch,String bracode){
        branch.setBraname(request.getParameter("braname"));
        Integer date = branchService.branameone(branch);
        System.out.println(date+"!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
        return date;
    }
    

    //=======================审核结果==============================
    @RequestMapping("branchJGurl")
    public String branchJGurl() {
        return "data/network/BranchJGList";
    }

    @RequestMapping("branchJGselect")
    @ResponseBody
    public LayuiResult<Map> branchJGselect(BaseQuery baseQuery, Model model,TuserTwo tuserTwo, HttpSession session,BranchSQ branchSQ){
        LayuiResult<Map> result = new LayuiResult<Map>();
        String userName = session.getAttribute("userName").toString();//获取账号
        tuserTwo.setUsername(userName);
        List<Branch> tusers = tuserSTwo.tuserList(tuserTwo);
        String braname = tusers.get(0).getBraname();
        branchSQ.setBrasuoshu(braname);
        List<Map> maps = branchSQService.branchJGList(baseQuery, branchSQ);
        int i = branchSQService.selectCountJG(branchSQ);
        result.setData(maps);
        result.setCount(i);
        return result;
    }
    @RequestMapping("updateSQList")
    public String updateSQList(Model model, String bracode, BranchSQ branchSQ) {
        ModelAndView mav = new ModelAndView();
        branchSQ.setBracode(bracode);
        List<BranchSQ> branchSQS = branchSQService.updateSQList(branchSQ);
        System.out.println("错误========="+branchSQS.get(0).getBraname());
        model.addAttribute("branchSQS",branchSQS);
        return "data/network/updateSQ";
    }
    @ResponseBody
    @RequestMapping("updateSQdate")
    public String updateSQ(BranchSQ branchSQ, HttpServletRequest request, HttpSession session){
        branchSQ.setBracode(request.getParameter("bracode"));
        branchSQ.setBraname(request.getParameter("braname"));
        PinyinUtils pinyinUtils=new PinyinUtils();
        String firstPinYinHeadChar = pinyinUtils.getFirstPinYinHeadChar(request.getParameter("braname"));
        branchSQ.setBranameEnglish(firstPinYinHeadChar);
        branchSQ.setBraaddress(request.getParameter("braaddress"));
        branchSQ.setBraprincipal(request.getParameter("braprincipal"));
        branchSQ.setBraphone(request.getParameter("braphone"));
        branchSQ.setBraremark(request.getParameter("braremark"));
        branchSQService.updateSQ(branchSQ);
        return "redirect:/admin/network/branchJGurl";
    }

    @ResponseBody
    @RequestMapping("delSQ")
    public  String delSQ(String bracode, BranchSQ branchSQ){
        branchSQ.setBracode(bracode);
        branchSQService.delSQ(branchSQ);
        return "redirect:/admin/network/branchJGurl";
    }

}
