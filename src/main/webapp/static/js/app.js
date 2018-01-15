'use strict'
var FloweudFrontApp = {};

var App = angular.module('FloweudFrontApp', ['FloweudFrontApp.filters', 'FloweudFrontApp.service', 'FloweudFrontApp.directives', 'ngRoute', 'ngTable', 'ui.ace']);

App.config(['$routeProvider', function ($routeProvider, $locationProvider) {

    $routeProvider.when("/login", {
        templateUrl : 'login/layout',
        controller : loginController
    });

    $routeProvider.when('/todo', {
        templateUrl : 'todo/layout',
        controller : todoController
    });

    $routeProvider.when("/address", {
       templateUrl : 'address/layout',
        controller : addressController
    });

    $routeProvider.when("/table", {
        templateUrl : 'table/layout',
        controller : tableController
    });

    $routeProvider.when("/tabs", {
        templateUrl : "tabs/layout",
        controller : tabsController
    });

    $routeProvider.when("/userList", {
        templateUrl : "userList/layout",
        controller : userController
    });

    $routeProvider.when("/userDetail/:userId", {
        controller : userDetailController,
        templateUrl : function(params) {
            return "userDetail/" + params.userId;
        }
    });

    $routeProvider.when("/product", {
        templateUrl : "item/productLayout",
        controller : itemController
    });

    $routeProvider.otherwise({redirectTo : '/'});

    $locationProvider.html5Mode(); //activate HTML5 Mode
}]);