<%--
  Created by IntelliJ IDEA.
  User: jihoan
  Date: 2017. 4. 26.
  Time: 오전 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/static/jsp/common.jsp" %>
HELLO, {{user_id}}님 환영합니다.
<div class="alert alert-error" ng-show="error">{{errorMessage}}</div>
<div class="row">
    <form ng-submit="addTodo(todoName)">
        <div class="col-lg-8">
            <input class="form-control" placeholder="Enter Todo" type="text" ng-model="todoName" required min="1" />
        </div>
    </form>

    <button class="btn btn-primary" ng-disabled="!todoName" ng-hide="editMode" ng-click="addTodo(todoName)">Add Todo</button>
    <button type="btn btn-primary" class="btn btn-primary"
            ng-disabled="!todoName" ng-show="editMode"
            ng-click="updateTodo(position, todoName)">Save</button>
    <button type="btn btn-primary" class="btn btn-primary" ng-click="resetTodoField()">Reset</button>
</div>
<hr />

<div class="row">
    <div class="col-lg-8">
        <div class="form-group">
            <div class="input-group">
                <input type="text" class="form-control" placeholder="Search" id="search-query-3" ng-model="searchTodo" typeahead="todo for todo in todos | filter:$viewValue | limitTo:8">
                <span class="input-group-btn">
                    <button type="submit" class="btn"><span class="fui-search"></span></button>
                  </span>
            </div>
        </div>
    </div>
</div>
<hr />

<div class="alert alert-info" style="width:400px;margin-left:100px;" ng-show="todos.length == 0">
    No todos found
</div>
<table class="table table-bordered table-striped" ng-show="todos.length > 0">
    <thead>
    <tr>
        <th style="text-align: center; width: 25px;">Delete</th>
        <th style="text-align: center; width: 25px;">Update</th>
        <th style="text-align: center;">Todo</th>
    </tr>
    </thead>
    <tbody>
    <tr ng-repeat="todoInfo in todos | filter:searchTodo">
        <td  style="width:70px;text-align:center;"><button class="btn btn-mini btn-danger" ng-click="deleteTodo(todoInfo.idx)">Delete</button></td>
        <td  style="width:70px;text-align:center;"><button class="btn btn-mini btn-danger" ng-click="editTodo(todoInfo.idx, todoInfo.todo)">Update</button></td>
        <td>{{todoInfo.todo}}</td>
    </tr>
    </tbody>
</table>
<button class="btn btn-danger"  ng-show="todos.length >= 1" ng-click="deleteAllTodo()">Delete All Todos</button>
