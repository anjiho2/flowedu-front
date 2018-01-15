<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String webRoot = request.getContextPath();
%>
<html ng-app="FloweudFrontApp">
<head>
    <title>플로우 교육</title>
    <%--<meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
    <meta charset="utf-8">

    <base href="/">

    <link href="<%=webRoot%>/resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link href="<%=webRoot%>/resources/bootstrap/css/prettify.css" rel="stylesheet">

    <link rel="stylesheet" href="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.css">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">

    <!-- Loading Flat UI -->
    <link href="<%=webRoot%>/resources/css/flat-ui.css" rel="stylesheet">
    <link href="<%=webRoot%>/resources/css/docs.css" rel="stylesheet">

    <link href="<%=webRoot%>/resources/css/nv.d3.min.css" rel="stylesheet">

    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"/>
</head>

<body>
<div class=''>
    플로우 교육 프론트 개발 페이지
    <%--<li><a href="<%=webRoot%>/login">로그인</a></li>--%>
    <%--<li><a href="<%=webRoot%>/userList">사용자 목록</a></li>--%>
    <%--<li><a href="<%=webRoot%>/product">스토 목록</a></li>--%>
    <%--<li><a href="<%=webRoot%>/todo">Todo List</a></li>--%>
    <%--<li><a href="/address">Address Book</a></li>--%>
    <%--<li><a href="/table">Dynamic Table</a></li>--%>
    <%--<li><a href="/tabs">Dynamic Tabs</a></li>--%>
    <%--<li><a href="/file">File Upload</a></li>--%>
    <%--<li><a href="/editor">Ace Editor</a></li>--%>
    <%--<li><a href="/restangular">Restangular</a></li>--%>
    <%--<li><a href="/d3">D3 Chart</a></li>--%>
    <%--<li><a href="/force">Force.com</a></li>--%>
    <%--<div class="filler"></div>--%>
    <%--<div class="gridModelStyle" data-ng-grid="gridOptions"></div>--%>

    <div ng-view></div>
</div>

<script src="<%=webRoot%>/resources/js/common/common.js"></script>

<script src="<%=webRoot%>/resources/js/jquery-1.8.3.min.js"></script>
<script src="<%=webRoot%>/resources/js/jquery-ui-1.10.3.custom.min.js"></script>
<script src="<%=webRoot%>/resources/js/jquery.ui.touch-punch.min.js"></script>
<script src="<%=webRoot%>/resources/js/bootstrap.min.js"></script>
<script src="<%=webRoot%>/resources/js/bootstrap-select.js"></script>
<script src="<%=webRoot%>/resources/js/bootstrap-switch.js"></script>
<script src="<%=webRoot%>/resources/js/flatui-checkbox.js"></script>
<script src="<%=webRoot%>/resources/js/flatui-radio.js"></script>
<script src="<%=webRoot%>/resources/js/jquery.tagsinput.js"></script>
<script src="<%=webRoot%>/resources/js/jquery.placeholder.js"></script>
<script src="<%=webRoot%>/resources/js/typeahead.js"></script>
<%--<script src="<%=webRoot%>/resources/bootstrap/js/google-code-prettify/prettify.js"></script>--%>
<script src="<%=webRoot%>/resources/js/application.js"></script>
<script src="<%=webRoot%>/resources/js/lib/angular/angular-file-upload-shim.min.js"></script>

<%--<script src="resources/js/lib/angular/angular.min.js"></script>--%>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular-route.min.js"></script>

<%--<script src="https://cdn.jsdelivr.net/angular.ngtable/1.0.0/ng-table.min.js.map"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/ng-table/1.0.0/ng-table.js"></script>--%>
<script src="https://unpkg.com/ng-table@2.0.2/bundles/ng-table.min.js"></script>

<script src="<%=webRoot%>/resources/js/lib/angular/ui-bootstrap-tpls-0.11.0.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/ace/1.1.3/ace.js"></script>
<script src="<%=webRoot%>/resources/js/lib/angular/ui-ace.min.js"></script>


<script src="<%=webRoot%>/resources/js/lib/angular/restangular.min.js"></script>


<script src="<%=webRoot%>/resources/js/services.js"></script>
<script src="<%=webRoot%>/resources/js/filters.js"></script>
<script src="<%=webRoot%>/resources/js/directives.js"></script>


<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/controller/todoController.js' />"></script>
<script src="<c:url value='/static/js/controller/addressController.js' />"></script>
<script src="<c:url value='/static/js/controller/tableController.js' />"></script>
<script src="<c:url value='/static/js/controller/tabsController.js' />"></script>
<script src="<c:url value='/static/js/controller/loginController.js' />"></script>
<script src="<c:url value='/static/js/controller/userController.js' />"></script>
<script src="<c:url value='/static/js/controller/userDetailController.js' />"></script>
<script src="<c:url value='/static/js/controller/itemController.js' />"></script>

</body>
</html>