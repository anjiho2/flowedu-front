'use strict';

angular.module('myApp').controller('PaymentController', ['$scope', '$window', '$http', 'PageService', function($scope, $window, $http, PageService) {

    var self = this;
    self.studentId = $window.sessionStorage.getItem("user_id");
    $scope.studentName = $window.sessionStorage.getItem("user_name");

    self.dummyItems = [];
    self.pager = {};
    self.items = [];
    self.setPage = setPage;

    var REST_SERVICE_URI = 'http://localhost:8888/flowedu-api/log/payment/';

    initController();

    function initController() {
        self.setPage(1);
    }

    function setPage(page) {
        if (page < 1 || page > self.pager.totalPages) {
            return;
        }
        var studentId = self.studentId;
        $http.get(REST_SERVICE_URI + "student_id/" + studentId).success(function (response) {
            //console.log(response);
            self.dummyItems = response;
            //return $filter('filter')($scope.data, $scope.q)
            self.pager = PageService.GetPager(self.dummyItems.length, page);
            self.items = self.dummyItems.slice(self.pager.startIndex, self.pager.endIndex + 1);
        });
    }
}]);
