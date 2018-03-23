'use strict';

angular.module('myApp').controller('LectureController', ['$scope', '$window', '$route', function($scope, $window, $route) {
    $scope.refreshPage = function() {
        $route.reload();
        //console.log($scope.form_name) //to ensure scope is updating
    };
}]);
