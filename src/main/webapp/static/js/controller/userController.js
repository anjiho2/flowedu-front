/**
 * Created by jihoan on 2017. 5. 11..
 */
var userController = function ($scope, $http, NgTableParams, $window) {

    var REST_PATH = '/angular-mvc';

    if ($window.sessionStorage.getItem("user_id") == null) {
        alert("로그인을 하세요.");
        $window.location.href = REST_PATH + "#/login";
    }

    $http.get(REST_PATH + "/user/list").success(function (response) {
        $scope.tableParams = new NgTableParams({
            page : 1,
            count : 10
        }, {
            dataset : response
        });
    });

    $http.get(REST_PATH + "/user/blockList").success(function (response) {
        $scope.tableParams2 = new NgTableParams({
            page : 1,
            count : 10
        }, {
            dataset : response
        });
    });

}