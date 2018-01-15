/**
 * Created by jihoan on 2017. 5. 10..
 */
var loginController = function ($scope, $http, $window) {
    var REST_PATH = '/flowedu';

    if ($window.sessionStorage.getItem("user_id") == null) {
        $scope.loginoutMode = false;
    } else {
        $scope.loginoutMode = true;
    }

    $scope.login = function (loginInfo) {
        $http.post(REST_PATH + "/login/check", loginInfo).success(function (response) {
            $window.sessionStorage.setItem("user_id",loginInfo.userId);
            $scope.loginoutMode = true;
            $window.location.href = REST_PATH + "/todo";
        }).error(function (response) {
            alert("아이디 또는 비밀번호가 틀렸습니다.");
           console.log(response);
        });
    }

    $scope.logout = function (userId) {
        $window.sessionStorage.clear();
        $window.location.href = REST_PATH + "/login";
    }
}
