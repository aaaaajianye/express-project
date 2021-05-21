package com.aaa.controller;

import com.aaa.entity.*;
import com.aaa.service.BranchService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//网点审核
@Controller
@RequestMapping("/admin/principal")
public class PrincipalController {
    @Autowired
    private BranchService branchService;

    @RequestMapping("/principalselect")
    public String offerselect()
    {
        return "data/principal/PrincipalList";
    }

    @RequestMapping("/select")
    @ResponseBody
    public LayuiResult<Map> select(BaseQuery baseQuery, Branch branch){

        LayuiResult<Map> result=new LayuiResult<Map>();
        List<Map> maps = branchService.branchBDList(baseQuery,branch);
        int i = branchService.selectBDCount(branch);
        System.out.println(i+"=====================----+++++++====="+maps+"-----------0qwewqerwe-----"+branch);
        result.setData(maps);
        result.setCount(i);
        return  result;
    }
    @RequestMapping("/principalsel")
    public String offersel(Model model,String bracode,Branch branch,HttpSession session)
    {
        branch.setBracode(bracode);
        List<TuserTwo> tuserTwos = branchService.selTuser(branch);
        model.addAttribute("tuserTwos",tuserTwos);
        model.addAttribute("bracode",bracode);
        return "data/principal/Principal";
    }

    @RequestMapping("instuser")
    public String instuser(HttpServletRequest request,Branch branch,TuserTwo TuserTwo){
        TuserTwo.setTruename(request.getParameter("typetext"));
        List<Staffdetails> staffdetails = branchService.selPhone(TuserTwo);
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        System.out.println(staffdetails.get(0).getStaphone()+"==========889898-----------");
        branch.setBraprincipal(request.getParameter("typetext"));
        branch.setBracode(request.getParameter("bracode"));
        branch.setBraphone(staffdetails.get(0).getStaphone());
        branchService.updateTuser(branch);
        return "redirect:/admin/principal/principalselect";
    }
}
