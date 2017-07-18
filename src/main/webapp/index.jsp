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
            <button class="btn btn-primary" id="emp_add_model">新增</button>
            <button class="btn btn-danger" id="emp_delete_model">删除</button>
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
        <div class="col-md-6" id="page_info"></div>
        <%--显示分页条  hasPreviousPage:当前页有没有前一页 --%>
        <div class="col-md-6" id="page_nav"></div>
    </div>
</div>

<!-- 员工添加模态框（Modal） -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" 20. aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">新增员工</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label for="empName_add_input" class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="empName" id="empName_add_input" placeholder="请输入名字">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">gender</label>
                        <div class="col-sm-10">
                            <label class="checkbox-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked> 男
                            </label>
                            <label class="checkbox-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="email_add_input" placeholder="请输入姓">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">deptName</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="dId"></select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->


    <script type="text/javascript">

        function to_page(pgn) {
            $.ajax({
                url: "${path}/emps.do",
                data: "pgn=" + pgn,
                type: "GET",
                success: function (result) {
                    //console.log(result);
                    //1、解析并显示员工数据
                    build_emps_table(result);
                    //2、解析并显示分页信息
                    build_page_info(result);
                    //3、解析显示分页条数据
                    build_page_nav(result);
                }
            });
        }
        //1, 页面加载完成以后，直接发送ajax请求，请求分页数据。
        $(function () {
            to_page(1);
        });
        /*表格内容动态控制 json数据源解析*/
        function build_emps_table(result) {
            $("#emps_table tbody").empty();

            var emps = result.extend.pageInfo.list;
            $.each(emps, function (index, item) {
                //alert(item.empName);
                var empIdTD = $("<td></td>").append(item.empId);
                var empNameTD = $("<td></td>").append(item.empName);
                var genderTD = $("<td></td>").append(item.gender == "M" ? "男" : "女");
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
        /*解析显示分页信息*/
        function build_page_info(result) {
            var pageInfomation = result.extend.pageInfo;
            $("#page_info").empty();
            $("#page_info").append("当前" + pageInfomation.pageNum + "页,总" +
                pageInfomation.pages + "页,总" + pageInfomation.total + "条记录");
            //totalRecord = result.extend.pageInfo.total;
            //currentPage = result.extend.pageInfo.pageNum;

        }
        /*解析显示分页条*/
        function build_page_nav(result) {
            $("#page_nav").empty();
            var ul = $("<ul></ul>").addClass("pagination");

            /*==============================构建元素=====================*/
            var firstPageLi = $("<li></li>").append(
                $("<a></a>").append("首页").attr("href", "#")
            );
            var prePageLi = $("<li></li>").append($("<a></a>").append("&laquo;"));
            if (result.extend.pageInfo.hasPreviousPage == false) {
                firstPageLi.addClass("disabled");
                prePageLi.addClass("disabled");
            } else {
                //为元素添加点击翻页的事件
                firstPageLi.click(function () {
                    to_page(1);
                });
                prePageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum - 1);
                });
            }
            //添加首页和前一页 的提示
            ul.append(firstPageLi).append(prePageLi);


            //1,2，3遍历给ul中添加页码提示
            $.each(result.extend.pageInfo.navigatepageNums, function (index, item) {

                var numLi = $("<li></li>").append($("<a></a>").append(item));
                /*上一页和首页的点击事件*/
                if (result.extend.pageInfo.pageNum == item) {
                    numLi.addClass("active");
                }
                numLi.click(function () {
                    to_page(item);
                });
                ul.append(numLi);
            });


            var lastPageLi = $("<li></li>").append(
                $("<a></a>").append("末页").attr("href", "#")
            );
            var nextPageLi = $("<li></li>").append($("<a></a>").append("&raquo;"));
            /* 下一页和末页的点击事件*/
            if (result.extend.pageInfo.hasNextPage == false) {
                nextPageLi.addClass("disabled");
                lastPageLi.addClass("disabled");
            } else {
                nextPageLi.click(function () {
                    to_page(result.extend.pageInfo.pageNum + 1);
                });
                lastPageLi.click(function () {
                    to_page(result.extend.pageInfo.pages);
                });
            }

            //添加下一页和末页 的提示
            ul.append(nextPageLi).append(lastPageLi);
            /* ===================================================*/

            //把ul加入到nav
            var navEle = $("<nav></nav>").append(ul);
            navEle.appendTo("#page_nav");

        }
        //按钮单击事件 弹出模态框
        $("#emp_add_model").click(function () {
            getDepts();
            $("#empAddModal").modal({
                backdrop: "static"
            })
        })
        /*查询所有的部门信息并显示在下拉列表中*/
        function getDepts() {
            $.ajax({
                url:"${path}/depts.do",
                type:"get",
                success:function (result) {
                   // console.log(result)；部门信息显示在下拉列表中
                    //$("#empAddModal select").append("")
                    $.each(result.extend.depts,function(){
                        var optionEle = $("<option></option>").append(this.deptName).attr("value",this.deptId);
                        optionEle.appendTo("#empAddModal select");
                    });
                }
            })
        }

    </script>
</body>
</html>




















