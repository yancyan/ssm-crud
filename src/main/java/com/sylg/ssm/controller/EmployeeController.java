package com.sylg.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sylg.ssm.bean.Employee;
import com.sylg.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by Administrator on 2017/7/15.
 *  处理员工增删改查
 */
@Controller
public class EmployeeController {
    @Autowired
    private EmployeeService employeeService;

    /**
     * 查询员工数据（分页查询）
     * 引入pageHelper分页插件
     */
    @RequestMapping("/emps")
    public String getEmps(@RequestParam(value = "pgn", defaultValue ="1")Integer pgn, Model model){
        // 在查询之前只需要调用，传入页码，以及每页的大小
        PageHelper.startPage(pgn, 5);
        // startPage后面紧跟的这个查询就是一个分页查询
        List<Employee> emps = employeeService.getAll();
        /*  使用pageInfo包装查询后的结果，只需要将pageInfo交给页面就行了。
            封装了详细的分页信息,包括有我们查询出来的数据，-->>> 5 :传入连续显示的页数 */
        PageInfo page = new PageInfo(emps, 5);
        model.addAttribute("pageInfo", page);
        return "list";
    }
}
