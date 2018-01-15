/**
 * Created by jihoan on 2017. 4. 26..
 */
var todoController = function ($scope, $http, $window) {

    var REST_PATH = '/angular-mvc';

    if ($window.sessionStorage.getItem("user_id") == null) {
        alert("로그인을 하세요.");
        $window.location.href = REST_PATH + "#/login";
    }

    $scope.editMode = false;
    $scope.position = '';

    $scope.user_id = $window.sessionStorage.getItem("user_id");

    $scope.getAllTodos = function () {
        $scope.resetError();
        $http.get(REST_PATH + '/todo/all').success(function (response) {
            $scope.todos = response;
        }).error(function () {
            $scope.setError('Could not display all todos');
        });
    }

    $scope.addTodo = function (newTodo) {
        $scope.resetError();
        $http({
            url :  REST_PATH + "/todo/add",
            method : 'POST',
            data : {"newTodo":newTodo}
        }).success(function (response) {
            $scope.getAllTodos();
        }).error(function () {
            $scope.setError('Could add todo');
        });
        $scope.todoName = '';
    }

    $scope.deleteTodo = function (idx) {
        $scope.resetError();
        $http.get(REST_PATH + "/todo/delete/" + idx).success(function (response) {
            $scope.getAllTodos();
        }).error(function () {
            $scope.setError('Could delete todo')
        });
    }

    $scope.deleteAllTodo = function () {
        $scope.resetError();
        $http.get(REST_PATH + "/todo/deleteAll").success(function (response) {
            $scope.getAllTodos();
        }).error(function () {
           $scope.setError('Could delete All');
        });
    }

    $scope.editTodo = function (position, todo) {
        $scope.resetError();
        $scope.todoName = todo;
        $scope.position = position;
        $scope.editMode = true;
    }

    $scope.updateTodo = function (idx, todo) {
        $scope.resetError();
        $http({
            url :  REST_PATH + "/todo/update/" + idx,
            method : 'POST',
            data : {"todo":todo}
        }).success(function (response) {
            $scope.getAllTodos();
        }).error(function () {
            $scope.setError('Could update');
        });
        /*
        $http.get(REST_PATH + "/todo/update/" + idx + "/" + todo).success(function (response) {
            $scope.getAllTodos();
        }).error(function () {
           $scope.setError('Could update');
        });
        */
    }

    $scope.resetTodoField = function() {
        $scope.resetError();
        $scope.todoName = '';
        $scope.editMode = false;
    };

    $scope.resetError = function () {
        $scope.error = false;
        $scope.errorMessage = '';
    }

    $scope.getAllTodos();
}