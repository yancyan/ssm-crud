# ssm-crud
###校验
重要数据：前端校验，后端校验和数据库校验同时约束，前端校验可以绕过。
jquery前端校验、ajax校验、后端校验(JSR303)
    jquery前端校验： 改变输入框颜色，并在下方提示校验信息。
    
    
校验过程：前端执行的安全性不够，
    前端控制执行的校验：在模态框中保存时进行jquery前段规则校验，对用户名进行数据库校验（发送ajax请求，校验数据库）和后端规则校验。
    后端控制执行的校验：JSR303校验，数据库约束校验。
            ----> 内容更改进行数据库校验，然后提交保存进行前端规则校验。
            ----> 规则校验同步到后端，提交empName时，后端进行规则校验。
            ----> JSR303校验
    
    
- bootstrap 做前端界面
- pageHelper 做分页
- Mybatis Generator 使用maven插件自动生成dao层以下相关代码
- rest uri 
{
    uri：
   /emp.do/{id} GET查询员工
   /emp.do      POST保存员工
   /emp.do/{id} PUT修改员工
   /emp.do/{id} DELETE删除员工
}


----->>> 查询tomcat的request的源码，查看参数解析部分，org.apache.catalina.connector.Request--parseParameters() (3111);
ajax发送put请求的问题：
    put请求，请求体中的数据，request.getparameter() 拿不到
    tomcat不封装put请求体中的数据为map， 只有且仅有post形式才封装为map
    
    springmvc提供 org.springframework.web.filter.HttpPutFormContentFilter
