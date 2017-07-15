package com.sylg.ssm.service;

import com.sylg.ssm.dao.DeptMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/7/15.
 */
@Service
public class DeptService {
    @Autowired
    private DeptMapper deptMapper;


}
