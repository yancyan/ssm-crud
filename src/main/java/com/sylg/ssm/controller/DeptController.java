package com.sylg.ssm.controller;

import com.sylg.ssm.bean.Dept;
import com.sylg.ssm.bean.Message;
import com.sylg.ssm.service.DeptService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * Created by yancyan on 2017/7/18.
 */
@Controller
public class DeptController {
    @Autowired
    DeptService deptService;

    /**
     * 返回所有的部门信息
     */
    @RequestMapping("/depts.do")
    @ResponseBody
    public Message getDepts(){
        //查出的所有部门信息
        List<Dept> list = deptService.getDepts();
        return Message.success().add("depts", list);
    }
}
