<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/static/common/header.jsp" %>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<div class="generic-container" ng-controller="UserController as ctrl" ng-init="getUser();">
    <form name="myForm" ng-submit="updateUser()">
        <input type="hidden" ng-model="userInfo.student_photo_url">
        <input type="hidden" ng-model="userInfo.student_photo_file">
        <%--<button ng-click="getUser()">사용자정보 가져오기</button>--%>
        학생 이름 : <input type="text" name="studentName" ng-model="userInfo.student_name" required>
        <span ng-show="myForm.studentName.$error.required" style="color: red;">이름을 입력하세요.</span>,
        <%--학생 이름 : <span ng-bind="userInfo.student_name"></span>,--%>
            <br>
        생년월일 : <span ng-bind="userInfo.student_birthday"></span>
            <br>
        학교명 :
            <input type="text" ng-model="userInfo.school_name">
            <br>
        학교등급 :
            <select  name="sel_schoolType" ng-show="userInfo != null" ng-model="userInfo.school_type" required>
                <option value="">선택하세요</option>
                <option value="elem_list">초</option>
                <option value="midd_list">중</option>
                <option value="high_list">고</option>
            </select>
            <span ng-show="myForm.sel_schoolType.$error.required" style="color: red;">This is a required field</span>
            <br>
        성별 :
            <label>
                <input type="radio" ng-model="userInfo.student_gender" value="MALE">
                남
            </label>
            <label>
                <input type="radio" ng-model="userInfo.student_gender" value="FEMALE">
                여
            </label>
            <br>
        학년 :
            <select ng-show="userInfo.school_type == 'elem_list'" ng-model="ctrl.studentGrade">
                <option value="1">1</option>
                <option value="2">2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                <option>6</option>
            </select>
            <select ng-show="userInfo.school_type != 'elem_list'" ng-model="ctrl.studentGrade">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
            <br>

        사진 :
            <img ng-src="{{ctrl.imageHost}}/{{userInfo.student_photo_url}}/{{userInfo.student_photo_file}}" onerror="this.src='https://docs.angularjs.org/img/angularjs-for-header-only.svg'">
        <%--<span ng-if="userInfo.student_gender == 'FEMALE'">여</span>--%>
            <br>
        전화 :
            <input type="text" ng-model="userInfo.student_phone_number">
            <br>
        부모님 이름 :
        <input type="text" ng-model="userInfo.mother_name">
        <br>
         부모님 전화 :
            <input type="text" ng-model="userInfo.mother_phone_number">
            <br>
        <input type="submit" id="submit" value="수정하기" />
    </form>
    <button ng-show="!ctrl.loginMode" ng-click="logout()">로그아웃</button>
</div>
<%@ include file="/static/common/footer.jsp" %>