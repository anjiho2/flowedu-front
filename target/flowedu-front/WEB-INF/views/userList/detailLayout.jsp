<%--
  Created by IntelliJ IDEA.
  User: jihoan
  Date: 2017. 4. 27.
  Time: 오후 3:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="container">
    <div id="fui-button" class="pbl"></div>

    <div class="demo-row">
        <div class="demo-title">
            사용자 상세정보
        </div>
        <div class="demo-content">
            <table ng-table="tableParams" class="table table-condensed table-bordered table-striped" ng-show="user != null">
                <thead>
                <tr>
                    <th style="text-align: center; width: 100px;">아이디</th>
                    <td>{{user_id}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">이름</th>
                    <td>{{user.userName}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">전화번호</th>
                    <td>{{user.phoneNumber}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">가입일</th>
                    <td>{{user.createDate}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">보유 콘</th>
                    <td>{{user.cornPoint}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">보유 팝콘</th>
                    <td>{{user.popcornPoint}}</td>
                </tr>
                <tr>
                    <th style="tex-align: center; width: 100px;">성별</th>
                    <td ng-show="user.gender == 'MALE'">남성</td>
                    <td ng-show="user.gender == 'FEMALE'">여성</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">생년월일</th>
                    <td>{{user.birthDay}}</td>
                </tr>
                <tr>
                    <th style="text-align: center; width: 100px;">상태</th>
                    <td ng-show="user.userStatus == 'NORMAL'">정상
                        <button type="button" class="btn-primary" ng-click="updateUserStatus(user_id, true)"><span class="">차단</span></button>
                    </td>
                    <td ng-show="user.userStatus == 'BLOCK'">차단
                        <button type="button" class="btn-primary" ng-click="updateUserStatus(user_id, false)"><span class="">복귀</span></button>
                    </td>
                </tr>
                </thead>
            </table>
        </div> <!-- /.demo-content -->
    </div> <!-- /.demo-row -->
</div><!-- /.container -->
