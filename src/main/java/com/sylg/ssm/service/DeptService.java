package com.sylg.ssm.service;

import com.sylg.ssm.bean.Dept;
import com.sylg.ssm.bean.Employee;
import com.sylg.ssm.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Administrator on 2017/7/15.
 */
@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;

    public List<Dept> getDepts() {
        List<Dept> list = deptMapper.selectByExample(null);
        return list;
    }

}
