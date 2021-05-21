package com.aaa.controller;

import com.aaa.entity.BaseQuery;
import com.aaa.entity.LayuiResult;
import com.aaa.entity.Wproblemtype;
import com.aaa.service.WproblemtypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;
//问题件类型维护
@Controller
@RequestMapping("problemEdit")
public class WproblemtypeController {
    @Autowired
    private WproblemtypeService wproblemtypeService;
    @RequestMapping("problemSelecturl")
    public String userSelecturl() {
        return "problem_edit";
    }
    @RequestMapping("selAll")
    @ResponseBody
    public LayuiResult<Map> findPay(BaseQuery baseQuery, Wproblemtype wproblemtype){
        LayuiResult<Map> result = new LayuiResult<Map>();
        List<Map> allItem= wproblemtypeService.findProblem(baseQuery,wproblemtype);
        result.setData(allItem);
        return result;
    }
    @RequestMapping("add")
    public String add(){
        return "problemInsert";
    }
    @RequestMapping("addProblem")
    @ResponseBody
    public Object insert(Wproblemtype wproblemtype, HttpServletRequest request){
        wproblemtype.setProtype(request.getParameter("protype"));
        wproblemtype.setPronode(request.getParameter("pronode"));
        wproblemtype.setProtime(request.getParameter("protime"));
        int d=wproblemtypeService.insertProblem(wproblemtype);
        String data=String.valueOf(d);
        return data;
    }
    @RequestMapping("delProblem")
    public String delItem(Wproblemtype wproblemtype,Integer proid){
        wproblemtype.setProid(proid);
        wproblemtypeService.delProblem(wproblemtype);
        return "redirect:/problemEdit/problemSelecturl";
    }
}
