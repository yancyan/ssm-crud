package com.sylg.ssm.service;

import com.sylg.ssm.bean.Employee;
import com.sylg.ssm.bean.Message;
import com.sylg.ssm.dao.EmployeeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

/**
 * Created by Administrator on 2017/7/15.
 */
@Service
public class EmployeeService {
    @Autowired
    private EmployeeMapper employeeMapper;


    public List<Employee> getAll(){
       return employeeMapper.selectByExampleWithDept(null);
    }

    public Message saveEmployee(Employee employee) {
        employeeMapper.insertSelective(employee);
        return Message.success();
    }
}
