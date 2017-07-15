<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%
            String app_path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + app_path + "/";
        %>
        <title>员工列表</title>
        <script type="text/javascript" src="${app_path}/static/js/jquery-1.12.4.min.js"></script>
        <link href="${app_path}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="${app_path}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    </head>
    <body>

    </body>
</html>
