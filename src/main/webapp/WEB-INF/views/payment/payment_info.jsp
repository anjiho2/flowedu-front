<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/static/common/header.jsp" %>
<script src="<c:url value='/static/js/service/page_service.js' />"></script>
<script src="<c:url value='/static/js/controller/payment_controller.js' />"></script>
<div class="generic-container" ng-controller="PaymentController as ctrl" ng-init="getPaymentInfo();">
    <span ng-bind="studentName"></span>결제내역 보기
    <!-- items being paged -->
    <div>
        <table>
            <thead>
                <th>번호</th>
                <th>강의이름 </th>
                <th>결제금액</th>
                <th>결제자</th>
            </thead>
            <tbody>
                <tr ng-repeat="item in ctrl.items">
                    <td>{{item.lecturePaymentLogId}}</td>
                    <td>{{item.lectureName}}</td>
                    <td>{{item.paymentPrice}}</td>
                    <td>{{item.memberName}}</td>
                </tr>
            </tbody>
        </table>
    </div>
    <!-- pager -->
    <ul ng-if="ctrl.pager.pages.length" class="pagination">
        <li ng-class="{disabled:ctrl.pager.currentPage === 1}">
            <a ng-click="ctrl.setPage(1)"><<</a>
        </li>
        <li ng-class="{disabled:ctrl.pager.currentPage === 1}">
            <a ng-click="ctrl.setPage(ctrl.pager.currentPage - 1)"><</a>
        </li>
        <li ng-repeat="page in ctrl.pager.pages" ng-class="{active:ctrl.pager.currentPage === page}">
            <a ng-click="ctrl.setPage(page)">{{page}}</a>
        </li>
        <li ng-class="{disabled:ctrl.pager.currentPage === ctrl.pager.totalPages}">
            <a ng-click="ctrl.setPage(ctrl.pager.currentPage + 1)">></a>
        </li>
        <li ng-class="{disabled:ctrl.pager.currentPage === ctrl.pager.totalPages}">
            <a ng-click="ctrl.setPage(ctrl.pager.totalPages)">>></a>
        </li>
    </ul>
</div>
<%@ include file="/static/common/footer.jsp" %>