/**
 * Created by jihoan on 2017. 4. 26..
 */
var addressController = function ($scope, $http) {

    var REST_PATH = '/angular-mvc/address';

    $scope.editMode = false;
    $scope.position = '';
    $scope.rtnTel = '';

    $scope.viewAllAddressBook = function () {
        $http.get(REST_PATH + '/list').success(function (response) {
            $scope.addressBooks = response;
        });
    }

    $scope.resetAddressBookField = function () {
        $scope.ab.userName = '';
        $scope.ab.phoneNumber = '';
        $scope.ab.email = '';
        $scope.editMode = false;
    }

    $scope.addAddressBook = function (ab) {
        $http.post(REST_PATH + '/add', ab).success(function (response) {
            $scope.viewAllAddressBook();
            $scope.ab.userName = '';
            $scope.ab.phoneNumber = '';
            $scope.ab.email = '';
        }).error(function (response) {
            console.log(response);
        });
    }

    $scope.updateAddressBook = function (ab) {
        $http.put(REST_PATH + "/update" + "/" + ab.userId, ab).success(function (response) {
            $scope.ab.userName = '';
            $scope.ab.phoneNumber = '';
            $scope.ab.email = '';
            $scope.viewAllAddressBook();
            $scope.editMode = false;
        }).error(function (response) {
            console.log(response);
        });
    }

    $scope.deleteAddressBook = function (userId) {
        $http.delete(REST_PATH + "/delete" + "/" + userId).success(function (response) {
            $scope.viewAllAddressBook();
        }).error(function (response) {
            console.log(response);
        });
    }

    $scope.deleteAllAddressBook = function () {
        $http.delete(REST_PATH + "/deleteAll").success(function (response) {
           $scope.viewAllAddressBook();
        }).error(function (response) {
            console.log(response)
        });
    }

    $scope.editAddressBook = function (userId, ab) {
        $scope.userId = userId;
        $scope.ab = ab;
        $scope.editMode = true;
    }

    $scope.viewAllAddressBook();
}
