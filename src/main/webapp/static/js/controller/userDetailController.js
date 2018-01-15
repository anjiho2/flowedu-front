/**
 * Created by jihoan on 2017. 5. 11..
 */
var userDetailController = function ($scope, $http, $routeParams, $window) {

    var REST_PATH = '/angular-mvc/user';

    var userId = $routeParams.userId;

    $scope.user_id = userId;

    $http.get(REST_PATH + "/" + userId).success(function (response) {
        $scope.user = response;
    }).error(function (response) {
        console.log(resonse);
    });

    $scope.updateUserStatus = function (userId, isBlock) {
        if (confirm("상태를 변경하시겠습니까?")) {
            $http.put(REST_PATH + "/" + userId + "/" + isBlock).success(function (response) {
                $window.location.reload();
            }).error(function (response) {
                console.log(response);
            });
        }
    }
}