package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wquestion;
import com.aaa.service.QuestionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

//问题件处理
@Controller
@RequestMapping("questionEdit")
public class QuestionController {
    @Autowired
    private QuestionService questionService;
    @RequestMapping("questionurl")
    public String questionUrl(){
        return "question_edit";
    }
    @RequestMapping("manageUrl")
    public String successUrl(){
        return "manage_edit";
    }
    @RequestMapping("selectQuestion")
    @ResponseBody
    public LayuiResult<Map> selectQuestion(BaseQuery baseQuery, Wquestion wquestion){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> list=questionService.findQuestion(baseQuery,wquestion);
        int count= questionService.selQuestion(wquestion);
        result.setData(list);
        result.setCount(count);
        return result;
    }
    @RequestMapping("questionManage")
    @ResponseBody
    public LayuiResult<Map> questionManage(BaseQuery baseQuery, Wquestion wquestion){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> list=questionService.questionManage(baseQuery,wquestion);
        int count=questionService.selManage(wquestion);
        result.setData(list);
        result.setCount(count);
        return result;
    }
    @RequestMapping("selQuestion")
    public String selQuestion(Wquestion wquestion, Model model){
        List<Wquestion> list=questionService.selQuestiin(wquestion);
        model.addAttribute("list",list);
        return "questionSelect";
    }
    @RequestMapping("selManage")
    public String selManage(Wquestion wquestion, Model model){
        List<Wquestion> list=questionService.selQuestiin(wquestion);


        int offerprice=list.get(0).getOfferprice();
        if(offerprice>0){
            list.get(0).setPenfuprice(offerprice);
            model.addAttribute("list",list);
        }else {
            int expprice= list.get(0).getExpprice();
            int price=expprice*5;

            list.get(0).setPenfuprice(price);
            model.addAttribute("list",list);
        }
        return "questionManage";
    }
    @RequestMapping("updateQuestion")
    @ResponseBody
    public Object updateQuestion(HttpServletRequest request,Wquestion wquestion){
        wquestion.setExpid(Integer.valueOf(request.getParameter("expid")));
        wquestion.setBraexname(request.getParameter("braexname"));
        wquestion.setOfferprice(Integer.valueOf(request.getParameter("offerprice")));
        String managetime = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date());
        wquestion.setManagetime(managetime);
        questionService.updateMoney(wquestion);
        int quesstion=questionService.updateQuestion(wquestion);

        String data=String.valueOf(quesstion);
        return data;
    }
}
