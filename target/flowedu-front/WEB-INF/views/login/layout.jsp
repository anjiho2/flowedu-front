<%--
  Created by IntelliJ IDEA.
  User: jihoan
  Date: 2017. 4. 26.
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="container">
    <div class="row">
        <form >
            <div class="col-lg-3">
                <input class="form-control" ng-show="!loginoutMode" placeholder="아이디" type="text" ng-model="loginInfo.userId">
            </div>
            <div class="col-lg-3">
                <input class="form-control" ng-show="!loginoutMode" placeholder="비밀번호" type="password" ng-model="loginInfo.userPass" ng-keydown="($event.keyCode === 13 || $event.keyCode === 32) && login(loginInfo)">
            </div>
        </form>
        <div>
        <button type="btn btn-primary" class="btn btn-primary"
                ng-hide="loginoutMode" ng-click="login(loginInfo)">로그인</button>
        <button type="btn btn-primary" class="btn btn-primary"
                ng-hide="!loginoutMode" ng-click="logout()">로그아웃</button>
        </div>
    </div>
</div>
