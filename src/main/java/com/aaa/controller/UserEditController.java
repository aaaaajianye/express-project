package com.aaa.controller;


import com.aaa.entity.*;
import com.aaa.service.TuserTwoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;

//员工的维护
@Controller
@RequestMapping("userEdit")
public class UserEditController {
    @Autowired
    private TuserTwoService tuserTwoService;

    @RequestMapping("userSelecturl")
    public String userSelecturl() {
        return "user_edit";
    }

    @RequestMapping("userSelect")
    @ResponseBody
    public LayuiResult<Map> userEdit(Integer braid,BaseQuery baseQuery, WstaffdetailsVO wstaffdetailsVO,HttpSession session) {

        LayuiResult<Map> result = new LayuiResult<Map>();

        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);
        //获取员工姓名
        String truename=tuserTwoService.selTruename(wstaffdetailsVO);
        wstaffdetailsVO.setTname(truename);
        //获取员工所属网点名称
        String braname =tuserTwoService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        String admin="admin";
        wstaffdetailsVO.setHeiger(admin);
        String hname=tuserTwoService.selAdmin(wstaffdetailsVO);
        wstaffdetailsVO.setHname(hname);

        wstaffdetailsVO.setBraid(braid);

        List<Map> userTwo = tuserTwoService.findUser(baseQuery, wstaffdetailsVO);
        int count = tuserTwoService.selectCount(wstaffdetailsVO);
        result.setData(userTwo);
        result.setCount(count);
        return result;
    }

    @RequestMapping("tolist")
    public String aaa(WstaffdetailsVO wstaffdetailsVO,HttpSession session,Model model) {


        return "userInsert";
    }
    @RequestMapping("selBra")
    @ResponseBody
    public Object selBra(WstaffdetailsVO wstaffdetailsVO,HttpSession session){
        //获取登录账号
        String username=session.getAttribute("userName").toString();
        wstaffdetailsVO.setUsername(username);

        //获取员工所属网点名称
        String braname =tuserTwoService.selBraname(wstaffdetailsVO);
        wstaffdetailsVO.setBraname(braname);
        String admin="admin";
        wstaffdetailsVO.setHeiger(admin);
        String hname=tuserTwoService.selAdmin(wstaffdetailsVO);
        wstaffdetailsVO.setHname(hname);
        //获取员工所属网点名称
        List<WstaffdetailsVO> list=tuserTwoService.selBranameTwo(wstaffdetailsVO);
        return list;
    }

    @RequestMapping("toInsert")
    @ResponseBody
    public Object insertUser(WstaffdetailsVO wstaffdetailsVO, HttpServletRequest request) {
        wstaffdetailsVO.setBraid(Integer.valueOf(request.getParameter("braid")));
        wstaffdetailsVO.setStaaddress(request.getParameter("staaddress"));
        wstaffdetailsVO.setTruename(request.getParameter("truename"));
        wstaffdetailsVO.setStaidcard(request.getParameter("staidcard"));
        wstaffdetailsVO.setStaphone(request.getParameter("staphone"));
       String idcard= request.getParameter("staidcard");
       String password=idcard.substring(12,18);
       wstaffdetailsVO.setPassword(password);
        //判断员工不一致
        int countUser=tuserTwoService.selUsername(wstaffdetailsVO);
        int countIdcard=tuserTwoService.selIdcard(wstaffdetailsVO);
        if(countIdcard==1){
            int data=countIdcard+2;
            return data;
        }
        if(countUser==1){
            int data=countUser+1;

            return data;
        }else {

            //员工账号密码
            tuserTwoService.useresInsertTwo(wstaffdetailsVO);
            //用户id
            int id= tuserTwoService.userId(wstaffdetailsVO);
            wstaffdetailsVO.setId(id);
            //添加员工详情
            int count=tuserTwoService.useresInsert(wstaffdetailsVO);
            String data=String.valueOf(count);
            return data;
        }





    }
    @RequestMapping("del")
    @ResponseBody
    public String del(WstaffdetailsVO wstaffdetailsVO,Integer id){
        wstaffdetailsVO.setId(id);
        tuserTwoService.delUser(wstaffdetailsVO);
        tuserTwoService.delUserTwo(wstaffdetailsVO);
        return "redirect:/userEdit/userSelecturl";
    }
    @RequestMapping("seluser")
    public String seluser(WstaffdetailsVO wstaffdetailsVO,Model model){
        List<WstaffdetailsVO> list=tuserTwoService.selUser(wstaffdetailsVO);
        model.addAttribute("list",list);
        return "userUpdate";
    }
    @RequestMapping("edit")
    @ResponseBody
    public Object edit(WstaffdetailsVO wstaffdetailsVO,HttpServletRequest request){
        wstaffdetailsVO.setId(Integer.valueOf(request.getParameter("id")));
        wstaffdetailsVO.setTruename(request.getParameter("truename"));
        wstaffdetailsVO.setUsername(request.getParameter("username"));
        wstaffdetailsVO.setStaphone(request.getParameter("staphone"));
        wstaffdetailsVO.setStaaddress(request.getParameter("staaddress"));
        wstaffdetailsVO.setPassword(request.getParameter("password"));
        wstaffdetailsVO.setStaidcard(request.getParameter("staidcard"));

        tuserTwoService.editUser(wstaffdetailsVO);
        int a=tuserTwoService.editUserTwo(wstaffdetailsVO);
        String data=String.valueOf(a);
        return data;
    }
    //根据网点id查询所有所属员工
    @RequestMapping("seluserBraid")
    @ResponseBody
    public Object seluserBraid(WstaffdetailsVO wstaffdetailsVO,Integer braid){
        wstaffdetailsVO.setBraid(braid);
        List<WstaffdetailsVO> users= tuserTwoService.seluserBraid(wstaffdetailsVO);

        return users;
    }
}
