'use strict';

angular.module('myApp').controller('UserController', ['$scope', '$window', 'UserService', function($scope, $window, UserService) {
    var self = this;
    self.user={id:null,username:'',address:'',email:''};
    self.users=[];
    self.student_id = null;
    self.loginId = null;
    self.password = null;

    self.submit = submit;
    self.edit = edit;
    self.remove = remove;
    self.reset = reset;
    self.logout = logout;
    self.loginUser = loginUser;
    self.loginMode = false;

    //self.login_data = "user_id=2018021424&user_pass=1234&user_type=1234";
    //fetchAllUsers();
    //loginUser();
    if ($window.sessionStorage.getItem("student_id") == null) {
        self.loginMode = true;
    } else {
        self.student_id = $window.sessionStorage.getItem("student_id");
    }

    function loginUser() {
        var login_data = "user_id=" + $scope.loginId + "&user_pass=" + $scope.password + "&user_type=";
        UserService.loginUser(login_data)
        .then(
            function (d) {
                if (d.student_id == null) {
                    alert("아이디 또는 비밀번호가 틀립니다.");
                    return;
                }
                $window.sessionStorage.setItem("student_id", d.student_id);
                self.student_id = d.student_id;
                self.loginMode = false;
                alert("로그인 성공");
            }
        );
    }

    function logout() {
        $window.sessionStorage.clear();
        self.loginMode = true;
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

    function updateUser(user, id){
        UserService.updateUser(user, id)
            .then(
            fetchAllUsers,
            function(errResponse){
                console.error('Error while updating User');
            }
        );
    }

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
