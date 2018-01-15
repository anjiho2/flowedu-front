/**
 * Created by jihoan on 2017. 4. 27..
 */
var tableController = function ($scope, $http, NgTableParams) {

    var REST_PATH = '/angular-mvc/address';

    $http.get(REST_PATH + '/list').success(function (response) {
        $scope.cols = [
            { field : "userId", title : "UserId", filter: {userId:"number"}, show:true},
            { field : "userName", title : "UserName", filter: {userName:"text"}, show:true},
            { field : "email", title : "Email", filter: {email:"text"}, show:true},
            { field : "phoneNumber", title : "PhoneNumber", filter: {phoneNumber:"text"}, show:true}
        ];
        $scope.tableParams = new NgTableParams({
            page: 1,            // show first page
            count: 10           // count per page
        }, {
            dataset:response
        });
    });
}
