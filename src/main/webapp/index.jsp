<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>员工列表</title>
    <%
        pageContext.setAttribute("path", request.getContextPath());
        /*application.setAttribute("path", request.getContextPath());*/
    %>
    <script type="text/javascript" src="${path }/static/js/jquery-1.12.4.min.js"></script>
    <link href="${path }/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${path }/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--搭建显示页面呢--%>
<div class="container">
    <%--标题行--%>
    <div class="row">
        <div class="col-md-12">
            <h2>SSM_CURD数据库信息分页查询后台系统</h2>
        </div>
    </div>
    <%--按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-primary">新增</button>
            <button class="btn btn-danger">删除</button>
        </div>
    </div>
    <%--显示数据表格--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>编号#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>deptName</th>
                    <th>操作</th>
                </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--显示--%>
    <div class="row">
        <%--显示分页信息--%>
        <div class="col-md-6"></div>
        <%--显示分页条  hasPreviousPage:当前页有没有前一页 --%>
        <div class="col-md-6"></div>
    </div>
</div>
<script type="text/javascript">
    //1, 页面加载完成以后，直接发送ajax请求，请求分页数据。
    $(function () {
        $.ajax({
            url: "${page}/emps.do",
            data: "pgn=1",
            type: "get",
            success:function (result) {
                build_emps_table(result);
            }
        });
    });
    /*表格内容动态控制 json数据源解析*/
    function build_emps_table(result) {
        var emps = result.extend.pageInfo.list;
        $.each(emps, function (index, item) {
            //alert(item.empName);
            var empIdTD = $("<td></td>").append(item.empId);
            var empNameTD = $("<td></td>").append(item.empName);
            var genderTD = $("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTD = $("<td></td>").append(item.email);
            var deptNameTD = $("<td></td>").append(item.dept.deptName);
            /**
             * 添加button按钮
             *
             * <button class="btn btn-primary btn-default btn-sm">
             <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
             编辑
             </button>

             <button class="btn btn-danger btn-default btn-sm">
             <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>
             删除
             </button>
             * */

            var editBtn = $("<button></button>").addClass("btn btn-primary btn-default btn-sm")
                .append(
                    $("<span></span>").addClass("glyphicon glyphicon-pencil")
                )
                .append("编辑");
            var deleteBtn = $("<button></button>").addClass("btn btn-danger btn-default btn-sm")
                .append(
                    $("<span></span>").addClass("glyphicon glyphicon-trash")
                )
                .append("删除");

            /*编辑和删除按钮放到一个单元格中*/
            var Btn = $("<td></td>").append(editBtn).append(deleteBtn);
            $("<tr></tr>").append(empIdTD)
                .append(empNameTD)
                .append(genderTD)
                .append(emailTD)
                .append(deptNameTD)
                //.append(editBtn).append(deleteBtn)
                .append(Btn)
                .appendTo("#emps_table tbody")
        })
    }

</script>
</body>
</html>




















