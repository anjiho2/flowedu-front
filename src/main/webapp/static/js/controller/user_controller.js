'use strict';

angular.module('myApp').controller('UserController', ['$scope', '$window', '$http', function($scope, $window, $http) {
    var self = this;
    self.user={id:null,username:'',address:'',email:''};
    self.users=[];
    self.loginId = null;
    self.password = null;
    self.studentId = null;
    self.studentName = null;
    //self.userInfo = null;
    self.loginMode = false;
    self.imageHost = "http://169.56.71.251/student";
    self.studentGrade = 0;

    //버튼함수 바인딩
    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
    //self.logout = logout;
    self.loginUser = loginUser;
    //self.getUser = getUser;


    //fetchAllUsers();
    //loginUser();
    var REST_SERVICE_URI = 'http://localhost:8888/flowedu-api/user/';

    var config = {
        headers : {
            'Content-Type': 'application/x-www-form-urlencoded;charset=utf-8;'
        }
    }

    if ($window.sessionStorage.getItem("user_id") == null) {
        self.loginMode = true;
    } else {
        self.studentId = $window.sessionStorage.getItem("user_id");
        self.studentName = $window.sessionStorage.getItem("user_name");
    }
    //로그인
    function loginUser() {
        var login_data = "user_id=" + $scope.loginId + "&user_pass=" + $scope.password + "&user_type=";

        $http.post(REST_SERVICE_URI + "auth", login_data, config).success(function (response) {
            if (response == "") {
                alert("아이디 또는 비밀번호가 틀립니다.");
                return;
            }
            self.loginMode = false;

            $window.sessionStorage.setItem("user_id", response.student_id);
            $window.sessionStorage.setItem("user_name", response.student_name);
            $scope.studentName = response.student_name;
        }).error(function() {
           alert("로그인 에러발생");
        });
    }
    //로그아웃
    $scope.logout = function () {
        if (confirm("로그아웃하시겠습니까?")) {
            $window.sessionStorage.clear();
            self.loginMode = true;
            $window.location.href = "/flowedu";
        }
    }
    //마이페이지 정보 불러오기
    $scope.getUser = function () {
        var sutdentId = $window.sessionStorage.getItem("user_id");
        if (sutdentId == null) {
            alert("로그인상태가 아닙니다.");
            $window.location.href = "/flowedu";
            return;
        }
        $http.get(REST_SERVICE_URI + "info/" + sutdentId).success(function (response) {
            $scope.userInfo = response;
            self.studentGrade = response.student_grade.toString();
        }).error(function () {
            alert("데이터를 불러오는데 에러가 발생했습니다.");
        });
    }
    //학생정보 변경
    $scope.updateUser = function () {
        var sutdentId = self.studentId;
        var data = {
            studentName : $scope.userInfo.student_name,
            studentGender : $scope.userInfo.student_gender,
            studentBirthday : $scope.userInfo.student_birthday,
            studentPhoneNumber: $scope.userInfo.student_phone_number,
            schoolName : $scope.userInfo.school_name,
            schoolType : $scope.userInfo.school_type,
            studentGrade : self.studentGrade,
            studentPhotoFile : null,
            studentPhotoUrl : null,
            motherName : $scope.userInfo.mother_name,
            motherPhoneNumber : $scope.userInfo.mother_phone_number
        };
        if (confirm(lang.confirm_update)) {
            $http.post(REST_SERVICE_URI + "modify/" + sutdentId, data).success(function (response) {
                refresh_page();
            }).error(function () {
                alert(lang.is_error);
            });
        }
    }
    //비밀번호 변경하기
    $scope.updatePassword = function () {
        var data = {
            currentPass : $scope.currentPassword,
            newPass : $scope.reNewPassword
        }
        $http.post(REST_SERVICE_URI + "/change_password/" + self.studentId, data).success(function (response) {
            console.log(response);
            if (response == false) {
                alert(lang.current_password_error);
                focus('focusMe');
                return;
            }
            $window.location.href = "/flowedu/mypage";
        }).error(function () {
            alert(lang.is_error);
        });
    }

    function fetchAllUsers(){
        UserService.fetchAllUsers()
            .then(
            function(d) {
                self.users = d;
            },
            function(errResponse){
                console.error('Error while fetching Users');
            }
        );
    }

    function createUser(user){
        UserService.createUser(user)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while creating User');
            }
        );
    }
    /*
    function updateUser(user, id){
        UserService.updateUser(user, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }
    */
    function deleteUser(id){
        UserService.deleteUser(id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while deleting User');
            }
        );
    }

    function submit() {
        if(self.user.id===null){
            console.log('Saving New User', self.user);
            createUser(self.user);
        }else{
            updateUser(self.user, self.user.id);
            console.log('User updated with id ', self.user.id);
        }
        reset();
    }

    function edit(id){
        console.log('id to be edited', id);
        for(var i = 0; i < self.users.length; i++){
            if(self.users[i].id === id) {
                self.user = angular.copy(self.users[i]);
                break;
            }
        }
    }

    function remove(id){
        console.log('id to be deleted', id);
        if(self.user.id === id) {//clean form if the user to be deleted is shown there.
            reset();
        }
        deleteUser(id);
    }


    function reset(){
        self.user={id:null,username:'',address:'',email:''};
        $scope.myForm.$setPristine(); //reset Form
    }

}]);
