<%--
  Created by IntelliJ IDEA.
  User: jihoan
  Date: 2017. 5. 12.
  Time: 오전 11:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<style>
    .demoTable td:last-child {
        min-width: 90px;
    }

    /** Editable table
    ------------------------- */

    .editable-table > tbody > tr > td {
        padding: 4px
    }
    .editable-text {
        padding-left: 4px;
        padding-top: 4px;
        padding-bottom: 4px;
        display: inline-block;
    }
    .editable-table tbody > tr > td > .controls {
    //width: 100%
    }
    .editable-input {
        padding-left: 3px;
    }
    .editable-input.input-sm {
        height: 30px;
        font-size: 14px;
        padding-top: 4px;
        padding-bottom: 4px;
    }
</style>
<div class="container">
    <div id="fui-button" class="pbl"></div>
    <div class="demo-row">
        <div class="demo-title">
            아이템 목록
        </div>

        <select name="itemTypeSelect" ng-model="itemTypeSelect" ng-change="itemTypeChange(itemTypeSelect)">
            <option value="">선택하세요</option>
            <option ng-repeat="itemName in itemTypes">{{itemName}}</option>
        </select>
    </div>

    <div class="row">
        <div class="demo-title">
            아이템 리스트
        </div>
        <div class="col-md-12">
            <div class="brn-group pull-right">
                <button class="btn btn-default" ng-if="isEditing2" ng-click="cancelChanges(itemTypeSelect)">
                    <span class="glyphicon glyphicon-remove"></span>
                </button>
                <button class="btn btn-primary" ng-if="!isEditing2" ng-click="editing(true)">
                    <span class="glyphicon glyphicon-pencil"></span>
                </button>
                <button class="btn btn-primary" ng-if="isEditing2" ng-click="saveChanges()" ng-disabled="tableTracker.$invalid">
                    <span class="glyphicon glyphicon-ok"></span>
                </button>
                <button class="btn btn-default" ng-click="add()">
                    <span class="glyphicon glyphicon-plus"></span>
                </button>
            </div>
            <table ng-table="tableParams" class="table table-bordered table-hover table-condensed editable-table demoTable" ng-form="tableForm" disable-filter="isAdding" demo-tracked-table="tableTracker">
                <colgroup>
                    <col width="20%" />
                    <col width="20%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="5%" />
                    <col width="45%" />
                </colgroup>
                <tr ng-repeat="row in $data" ng-form="rowForm" demo-tracked-table="row">
                    <td title="'상품 코드'" filter="{productCode: 'text'}" sortable="'productCode'">
                        <span>{{row.productCode}}</span>
                    </td>
                    <td title="'상품 이름'" filter="{productName : 'text'}" sortable="'productName'" ng-switch="row.isEditing || isEditing2" ng-class="productName.$dirty ? 'bg-waring' : ''"
                        ng-form="productName" demo-tracked-table-cell>
                        <span ng-switch-default class="editable-text">{{row.productName}}</span>
                        <div class="controls" ng-class="productName.$invalid && productName.$dirty ? 'has-error' : ''" ng-switch-when="true">
                            <input type="text" name="productName" ng-model="row.productName" class="editable-input form-control input-sm" required>
                        </div>
                    </td>
                    <td title="'콘 가격'" filter="{cornPrice : 'number'}" sortable="'cornPrice'" ng-switch="row.isEditing || isEditing2" ng-class="cornPrice.$dirty ? 'bg-waring' : ''" ng-form="cornPrice" demo-tracked-table-cell>
                        <span ng-switch-default class="editable-text">{{row.cornPrice}}</span>
                        <div class="controls" ng-class="cornPrice.$invalid && cornPrice.$dirty ? 'has-error' : ''" ng-switch-when="true">
                            <input type="number" name="cornPrice" ng-model="row.cornPrice" class="editable-input form-control input-sm" required>
                        </div>
                    </td>
                    <td title="'팝콘 가격'" filter="{popcornPrice : 'number'}" sortable="'popcornPrice'" ng-switch="row.isEditing || isEditing2" ng-class="popcornPrice.$dirty ? 'bg-waring' : ''" ng-form="popcornPrice" demo-tracked-table-cell>
                        <span ng-switch-default class="editable-text">{{row.popcornPrice}}</span>
                        <div class="controls" ng-class="popcornPrice.$invalid && cornPrice.$dirty ? 'has-error' : ''" ng-switch-when="true">
                            <input type="number" name="popcornPrice" ng-model="row.popcornPrice" class="editable-input form-control input-sm" required >
                        </div>
                    </td>
                    <td title="'판매여부'" filter="{storeCondition : 'select'}" filter-data="names" sortable="'name'" ng-form="storeCondition" ng-switch="row.isEditing || isEditing2">
                        <div ng-switch-when="false">
                            <span ng-if="row.storeCondition == '1'">신규</span>
                            <span ng-if="row.storeCondition == '2'">판매중</span>
                            <span ng-if="row.storeCondition == '3'">인기</span>
                            <span ng-if="row.storeCondition == '4'">할인중</span>
                            <span ng-if="row.storeCondition == '5'">판매중지</span>
                        </div>
                        <div class="controls" ng-class="storeCondition.$invalid && storeCondition.$dirty ? 'has-error' : ''">
                            <select name="storeCondition" ng-model="row.storeCondition" ng-switch-when="true">
                                <option ng-repeat="x in names" value="{{x.id}}" ng-selected="row.storeCondition == x.id">{{x.title}}</option>
                            </select>
                        </div>
                    </td>
                    <td>
                        <button class="btn btn-primary btn-sm" ng-click="productSave(row, rowForm)" ng-if="row.isEditing">
                            <span class="glyphicon glyphicon-ok"></span>
                        </button>
                        <button class="btn btn-default btn-sm" ng-click="cancel(row, rowForm)" ng-if="row.isEditing">
                            <span class="glyphicon glyphicon-remove"></span>
                        </button>
                        <button class="btn btn-default btn-sm" ng-click="row.isEditing = true" ng-if="!row.isEditing">
                            <span class="glyphicon glyphicon-pencil"></span>
                        </button>
                        <button class="btn btn-danger btn-sm" ng-click="del(row, itemTypeSelect)" ng-if="!row.isEditing">
                            <span class="glyphicon glyphicon-trash"></span>
                        </button>
                    </td>
                </tr>
            </table>
        </div>
    </div> <!-- /.demo-row -->
</div><!-- /.container -->

