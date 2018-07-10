<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/static/common/header.jsp" %>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<div class="generic-container" ng-controller="UserController as ctrl">
    <div class="panel panel-default">
        <div class="panel-heading"><span class="lead">로그인</span></div>
        <div class="formcontainer">
            <form name="myForm" class="form-horizontal">
                <span ng-show="!ctrl.loginMode" ng-bind="ctrl.studentId"></span>
                <span ng-show="!ctrl.loginMode" ng-bind="studentName"></span>
                <input type="text" name="login_id" ng-show="ctrl.loginMode" ng-model="loginId">
                <input type="password" name="login_pass" ng-show="ctrl.loginMode" ng-model="password">
                <span ng-show="!ctrl.loginMode" ng-bind="ctrl.student_id"></span>
                <button ng-show="ctrl.loginMode" ng-click="ctrl.loginUser()">로그인</button>
                <button ng-show="!ctrl.loginMode" ng-click="logout()">로그아웃</button>
                <a href="mypage" ng-show="!ctrl.loginMode">마이페이지</a>
                <a href="payment_info" ng-show="!ctrl.loginMode">결재내역</a>
                <a href="change_password" ng-show="!ctrl.loginMode">비밀번호 변경</a>
            </form>
        </div>
    </div>
</div>
<%@ include file="/static/common/footer.jsp" %>