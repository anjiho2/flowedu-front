/**
 * Created by jihoan on 2017. 5. 12..
 */
var itemController = function ($scope, $http, $window, NgTableParams) {

    var REST_PATH = "/angular-mvc/item";


    $scope.isEditing2 = false;

    $scope.isAdding = false;

    $scope.deleteCount = 0;

    $scope.editing = function (boolean) {
        $scope.isEditing2 = boolean;
    }

    $scope.getItemTypes = function () {
        $http.get(REST_PATH + "/itemTypeList").success(function (response) {
            $scope.itemTypes = response;
        }).error(function (response) {
            console.log(response);
        });
    }

    $scope.getProductList = function (itemType) {
        if (itemType == '') {
            itemType = 'ALL';
        }
        $scope.getStoreContions();
        $http.get(REST_PATH + "/product" + "/" + itemType).success(function (response) {
            $scope.tableParams = new NgTableParams({
                page : 1,
                count : 25
            }, {
                dataset : response
            });
        });
    }

    $scope.getStoreContions = function () {
        $scope.names = [{id: '1', title: '신규'}, {id: '2', title: '판매중'}, {id: '3', title: '인기'}, {id:'4', title:'할인중'}, {id:'5', title:'판매중지'}];
    }

    $scope.cancel = function (row, rowForm) {
        var originalRow = $scope.resetRow(row, rowForm);
        angular.extend(row, originalRow);
    }

    $scope.cancelChanges = function (itemType) {
        if (itemType == undefined) {
            itemType = "ALL";
        }
        $scope.resetTableStatus(itemType);
    }

    $scope.resetRow = function (row, rowForm) {
        row.isEditing = false;
        rowForm.$setPristine();
        $scope.tableTracker.untrack(row);
        return _.findWHere(originalData, function (r) {
            return r.id === row.id;
        });
    }

    $scope.resetTableStatus = function (itemType) {
        $scope.isEditing2 = false;
        $scope.isAdding = false;
        $scope.getProductList(itemType)
    }

    $scope.del = function (row, itemTypeSelect) {
        $http.delete(REST_PATH + "/product/" + row.idx).success(function (response) {
            $scope.getProductList(itemTypeSelect);
        }).error(function (response) {
            console.log(response);
        });
    }

    $scope.add = function () {
        $scope.isEditing2 = true;
        $scope.isAdd = true;
        $scope.tableParams.settings().dataset.unshift({
            productName : '',
            cornPrice : null,
            popcornPrice : null,
            storeCondition : ''
        });
        $scope.tableParams.sorting({});
        $scope.tableParams.page(1);
        $scope.tableParams.reload();
    }
    /*
    $scope.hasChanges = function () {
        return $scope.tableForm.$dirty || $scope.deleteCount > 0
    }
    */
    $scope.productSave = function (row, rowForm) {
        var postData = {
            "idx" : row.idx,
            "productName" : row.productName,
            "cornPrice" : parseInt(row.cornPrice),
            "popcornPrice" : parseInt(row.popcornPrice),
            "storeCondition" : parseInt(row.storeCondition)
        };
        $http.put(REST_PATH + "/product/update", postData).success(function (resopnse) {
            var originalRow = $scope.resetRow(row, rowForm);
            angular.extend(originalRow, row);
        }).error(function (response) {
            console.log(response);
        });
    }
    
    $scope.saveChanges = function () {
        var currentPage = $scope.tableParams.page();
        alert(currentPage);
        var data = angular.copy($scope.tableParams.settings().dataset);
        for (var i=0; i<25; i++) {
            console.log(data[i]);
        }
    }

    $scope.itemTypeChange = function (itemType) {
        $scope.getProductList(itemType);
    }

    $scope.toggleSelection = function (item) {
        item.isRowSelected = !item.isRowSelected;
    }

    $scope.getItemTypes();

    $scope.getProductList("ALL");
}