<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/static/common/header.jsp" %>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<div class="generic-container" ng-controller="UserController as ctrl" ng-init="getUser();">
    <form name="myForm" ng-submit="updateUser()">
        <%--<button ng-click="getUser()">사용자정보 가져오기</button>--%>
        학생 이름 : <input type="text" name="studentName" ng-model="userInfo.student_name" required>
        <span ng-show="myForm.studentName.$error.required" style="color: red;">이름을 입력하세요.</span>,
        <%--학생 이름 : <span ng-bind="userInfo.student_name"></span>,--%>
        학교명 : <span ng-bind="userInfo.school_name"></span>,
        학교등급 :
            <select  name="sel_schoolType" ng-show="userInfo != null" ng-model="userInfo.school_type" required>
                <option value="">선택하세요</option>
                <option value="elem_list">초</option>
                <option value="midd_list">중</option>
                <option value="high_list">고</option>
            </select>
            <span ng-show="myForm.sel_schoolType.$error.required" style="color: red;">This is a required field</span>
        성별 :
        <span ng-if="userInfo.student_gender == 'MALE'">남</span>
        <span ng-if="userInfo.student_gender == 'FEMALE'">여</span>
        <input type="submit" id="submit" value="저장" />
    </form>
    <button ng-show="!ctrl.loginMode" ng-click="logout()">로그아웃</button>
</div>
<%@ include file="/static/common/footer.jsp" %>