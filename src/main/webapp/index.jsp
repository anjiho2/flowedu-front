<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <base href="/flowedu/">
    <title>플로우교육</title>
    <style>
        .username.ng-valid {
            background-color: lightgreen;
        }
        .username.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .username.ng-dirty.ng-invalid-minlength {
            background-color: yellow;
        }

        .email.ng-valid {
            background-color: lightgreen;
        }
        .email.ng-dirty.ng-invalid-required {
            background-color: red;
        }
        .email.ng-dirty.ng-invalid-email {
            background-color: yellow;
        }

    </style>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.4/angular.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.18/angular-route.js"></script>
    <script src="static/js/services.js"></script>
    <script src="static/js/filters.js"></script>
    <script src="static/js/directives.js"></script>
</head>
<body ng-app="myApp" class="ng-cloak">
<div class="generic-container" ng-controller="UserController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">로그인</span></div>
        <div class="formcontainer">
            <form name="myForm" class="form-horizontal">
                <span ng-show="!ctrl.loginMode" ng-bind="ctrl.studentId"></span>
                <span ng-show="!ctrl.loginMode" ng-bind="studentName"></span>
                <input type="text" name="login_id" ng-show="ctrl.loginMode" ng-model="loginId">
                <input type="text" name="login_pass" ng-show="ctrl.loginMode" ng-model="password">
                <span ng-show="!ctrl.loginMode" ng-bind="ctrl.student_id"></span>
                <button ng-show="ctrl.loginMode" ng-click="ctrl.loginUser()">로그인</button>
                <button ng-show="!ctrl.loginMode" ng-click="logout()">로그아웃</button>
                <br>
                <button ng-click="getUser()">사용자정보 가져오기</button>
                <span ng-bind="userInfo.student_id"></span>
                <span ng-bind="ctrl.userInfo.student_name"></span>
                <span ng-bind="ctrl.userInfo.school_name"></span>
                <select ng-show="ctrl.userInfo != null" ng-model="ctrl.userInfo.school_type">
                    <option value="">선택하세요</option>
                    <option value="elem_list">초</option>
                    <option value="midd_list">중</option>
                    <option value="high_list">고</option>
                </select>
                <span ng-if="ctrl.userInfo.student_gender == 'MALE'">남</span>
                <span ng-if="ctrl.userInfo.student_gender == 'FEMALE'">여</span>
                <%--<div class="row">--%>
                    <%--<div class="form-group col-md-12">--%>
                        <%--<label class="col-md-2 control-lable" for="file">Name</label>--%>
                        <%--<div class="col-md-7">--%>
                            <%--&lt;%&ndash;<input type="text" ng-model="ctrl.student_id"/>&ndash;%&gt;--%>
                            <%--<input type="text" ng-model="ctrl.user.username" name="uname" class="username form-control input-sm" placeholder="Enter your name" required ng-minlength="3"/>--%>
                            <%--<div class="has-error" ng-show="myForm.$dirty">--%>
                                <%--<span ng-show="myForm.uname.$error.required">This is a required field</span>--%>
                                <%--<span ng-show="myForm.uname.$error.minlength">Minimum length required is 3</span>--%>
                                <%--<span ng-show="myForm.uname.$invalid">This field is invalid </span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>


                <%--<div class="row">--%>
                    <%--<div class="form-group col-md-12">--%>
                        <%--<label class="col-md-2 control-lable" for="file">Address</label>--%>
                        <%--<div class="col-md-7">--%>
                            <%--<input type="text" ng-model="ctrl.user.address" class="form-control input-sm" placeholder="Enter your Address. [This field is validation free]"/>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="row">--%>
                    <%--<div class="form-group col-md-12">--%>
                        <%--<label class="col-md-2 control-lable" for="file">Email</label>--%>
                        <%--<div class="col-md-7">--%>
                            <%--<input type="email" ng-model="ctrl.user.email" name="email" class="email form-control input-sm" placeholder="Enter your Email" required/>--%>
                            <%--<div class="has-error" ng-show="myForm.$dirty">--%>
                                <%--<span ng-show="myForm.email.$error.required">This is a required field</span>--%>
                                <%--<span ng-show="myForm.email.$invalid">This field is invalid </span>--%>
                            <%--</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</div>--%>

                <%--<div class="row">--%>
                    <%--<div class="form-actions floatRight">--%>
                        <%--<input type="submit"  value="{{!ctrl.user.id ? 'Add' : 'Update'}}" class="btn btn-primary btn-sm" ng-disabled="myForm.$invalid">--%>
                        <%--<button type="button" ng-click="ctrl.reset()" class="btn btn-warning btn-sm" ng-disabled="myForm.$pristine">Reset Form</button>--%>
                    <%--</div>--%>
                <%--</div>--%>
                <a href="login">Red</a>
                <div ng-view></div>
            </form>
        </div>
    </div>

    <div class="panel panel-default">
        <!-- Default panel contents -->
        <div class="panel-heading"><span class="lead">List of Users </span></div>
        <div class="tablecontainer">
            <table class="table table-hover">
                <thead>
                <tr>
                    <th>ID.</th>
                    <th>Name</th>
                    <th>Address</th>
                    <th>Email</th>
                    <th width="20%"></th>
                </tr>
                </thead>
                <tbody>
                <tr ng-repeat="u in ctrl.users">
                    <td><span ng-bind="u.id"></span></td>
                    <td><span ng-bind="u.username"></span></td>
                    <td><span ng-bind="u.address"></span></td>
                    <td><span ng-bind="u.email"></span></td>
                    <td>
                        <button type="button" ng-click="ctrl.edit(u.id)" class="btn btn-success custom-width">Edit</button>  <button type="button" ng-click="ctrl.remove(u.id)" class="btn btn-danger custom-width">Remove</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

    </div>
</div>

<script src="<c:url value='/static/js/app.js' />"></script>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<script src="<c:url value='/static/js/controller/lecture_controller.js' />"></script>
</body>
</html>