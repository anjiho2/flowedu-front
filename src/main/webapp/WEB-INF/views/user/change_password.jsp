<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/static/common/header.jsp" %>
<script src="<c:url value='/static/js/controller/user_controller.js' />"></script>
<div class="generic-container" ng-controller="UserController as ctrl" ng-init="getUser();">
    <form name="frm">
        현재 비밀번호 : <input type="password" ng-model="currentPassword" name="password"><br>
        새로운 비밀번호 : <input type="password" name="password" ng-model="newPassword" >
        <br>
        새로운 비밀번호 확인 : <input type="password" name="confirm_password" ng-model="reNewPassword" >
        <label ng-show="newPassword != reNewPassword" style="color: red">새로운 비밀번호가 일치하지 않습니다.</label>
        <br>
        <button ng-click="updatePassword();">비밀번호 변경</button>
    </form>


</div>
<%@ include file="/static/common/footer.jsp" %>