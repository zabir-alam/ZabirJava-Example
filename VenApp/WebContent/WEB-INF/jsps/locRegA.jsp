<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.js"></script>
<script>
var app=angular.module("detailsModule",[]);
app.controller("detail_controller",function($scope,$http){
	
	$scope.fn_getLocs=function()
	{
		$http({
			url:"allLocDetails",
			method:"get",
			data:"",
			headers:
				{
				"content-type":"aplication/json"
				}
		}).then(function(response){
			$scope.locs=response.data;
		},function(response){
			$scope.response.msg="Unable to process your Request";	
		});
	};
	
});
</script>
<!-- <script type="text/javascript">
function getUserDetails() {
	  $http({
	    method : 'GET',
	    url : 'userdetails'
	   }).then(function successCallback(response) {
	   $scope.users = response.data;
	   }, function errorCallback(response) {
	    console.log(response.statusText);
	   });
	  }
<table class="table table-bordered" style="width: 600px">
       <tr>
         <th>Name</th>
         <th>Department</th>
         <th>Actions</th>
      </tr>

      <tr ng-repeat="user in users">
        <td>{{ user.name}}</td>
        <td>{{ user.department }}</td>
</script> -->
</head>
<body ng-app="detailsModule">
<h2> Ajax Call Spring </h2>
<hr/>
<div ng-controller ="detail_controller">
<input type ="button" ng-click="fn_getLocs()" value="Get All Location"/>
<br/>
<table border="2">
<tr>
<th>LocId</th>
<th>LocName</th>
<th>LocType</th>
</tr>
<tr ng-repeat="item in locs">
<td>{{item.locId}}</td>
<td>{{item.locName}}</td>
<td>{{item.locType}}</td>
</tr>

</table>
</div>
</body>
</html>