'use strict';

var App = angular.module('myApp',['ngRoute']);

App.config(function ($routeProvider, $locationProvider) {
        $locationProvider.html5Mode(true);

        $routeProvider
            //.when( "/", { templateUrl : "", controller : "UserController"})
            .when( "/login", { templateUrl : "login", controller : "LectureController"});

        $routeProvider.otherwise({redirectTo: '/'});

});


