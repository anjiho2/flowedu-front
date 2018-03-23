'use strict';

angular.module('myApp').factory('LectureService', ['$http', '$q', function($http, $q){

    var REST_SERVICE_URI = 'http://localhost:8888/flowedu-api/user/';

    var factory = {

    };

    var config = {
        headers : {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
        }
    }

    return factory;



}]);
