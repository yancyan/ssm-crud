package com.sylg.ssm.test;

import com.sylg.ssm.bean.Employee;
import com.sylg.ssm.dao.DeptMapper;
import com.sylg.ssm.dao.EmployeeMapper;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * Created by Administrator on 2017/7/13.
 *
 * 导入spring单元测试的模块, 可以自动注入我们需要的组件
 *  1， 导入springtest单元测试模块
 *  2， @ContextConfiguration指定spring配置文件的位置
 *  3，直接Autowired
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
    @Autowired
    DeptMapper deptMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Test
    public void test() throws Exception {
        /*创建IOC 容器*/
        /*ApplicationContext context = new ClassPathXmlApplicationContext("applicationContext.xml");
        DeptMapper deptMapper = context.getBean(DeptMapper.class);*/
        System.out.println(deptMapper);

        //Dept dept = deptMapper.selectByPrimaryKey(1);
        //Employee emp = employeeMapper.selectByPrimaryKey(1);
        //System.out.println(dept.toString());
        //System.out.println(emp.toString());

       // employeeMapper.insert(new Employee(null, "张da明", "男", "zhangxiaoming@qq.com", 1));

        //Employee em = employeeMapper.selectByPrimaryKeyWithDept(1);
       // System.out.println(em.toString());

        Employee emp = employeeMapper.selectByPrimaryKeyWithDept(1);
        System.out.println(emp.toString()+emp.getDept().getDeptId()+emp.getDept().getDeptName());
    }
}
