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
            Dynamic Table
        </div>
        <div class="demo-content">
            <!--
            <p><strong>Page:</strong> {{tableParams.page()}}</p>
            <p><strong>Count per page:</strong> {{tableParams.count()}}</p>
            -->
            <table ng-table="tableParams" class="table table-condensed table-bordered table-striped">
                <tr ng-repeat="user in $data">
                    <td data-title="'번호'" filter="{userId:'number'}">{{user.userId}}</td>
                    <td data-title="'이름'" filter="{userName:'text'}">{{user.userName}}</td>
                    <td data-title="'이메일'" filter="{email:'text'}">{{user.email}}</td>
                    <td data-title="'전화번호'" filter="{phoneNumber:'text'}">{{user.phoneNumber}}</td>
                </tr>
            </table>
        </div> <!-- /.demo-content -->
    </div> <!-- /.demo-row -->
</div><!-- /.container -->
