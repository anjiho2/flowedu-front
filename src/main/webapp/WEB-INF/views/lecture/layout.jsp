<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            </form>
        </div>
    </div>
</div>