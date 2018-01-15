'use strict';
/*
angular.module('myApp', ['myApp.controllers', 'ngRoute']);

angular.module('myApp').config(function ($routeProvider, $locationProvider) {
    $routeProvider
        .when('/view1', {
            controller: 'Controller1',
            templateUrl: 'partials/view1.html'
        })
        .when('/view2', {
            controller: 'Controller2',
            templateUrl: 'partials/view2.html'
        });

    $locationProvider.html5Mode(true); //activate HTML5 Mode
});
*/


var AngularSpringApp = {};

var App = angular.module('AngularSpringApp', ['AngularSpringApp.filters', 'AngularSpringApp.service', 'AngularSpringApp.directives', 'ngRoute', 'ui.bootstrap', 'ngTable', 'ui.ace', 'angularFileUpload', 'nvd3ChartDirectives']);

// Declare app level module which depends on filters, and service
App.config(['$routeProvider', $locationProvider, function ($routeProvider) {

    $routeProvider.when('/todo', {
        templateUrl: 'todo/layout',
        controller: TodoController
    });
    $routeProvider.when('/address', {
        templateUrl: 'address/layout',
        controller: AddressBookController
    });
    $routeProvider.when('/table', {
        templateUrl: 'table/layout',
        controller: TableController
    });
    $routeProvider.when('/tabs', {
        templateUrl: 'tabs/layout',
        controller: TabsController
    })

    $routeProvider.when('/file', {
        templateUrl: 'file/layout',
        controller: FileController
    });
    $routeProvider.when('/editor', {
        templateUrl: 'editor/layout',
        controller: EditorController
    });
    $routeProvider.when('/restangular', {
        templateUrl: 'restangular/layout',
        controller: RestController
    });
    $routeProvider.when('/force', {
        templateUrl: 'force/layout',
        controller: ForceController
    });
    $routeProvider.when('/d3', {
        templateUrl: 'd3/layout',
        controller: D3Controller
    })

    $routeProvider.otherwise({redirectTo: '/todo'});
    // use the HTML5 History API
    $routeProvider.html5Mode(true);
}]);
