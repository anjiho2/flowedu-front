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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/angular-ui-router/0.3.1/angular-ui-router.js"></script>

    <script src="static/js/services.js"></script>
    <script src="static/js/filters.js"></script>
    <script src="static/js/directives.js"></script>

    <script src="<c:url value='/static/js/app.js' />"></script>
</head>
<body ng-app="myApp" class="ng-cloak">