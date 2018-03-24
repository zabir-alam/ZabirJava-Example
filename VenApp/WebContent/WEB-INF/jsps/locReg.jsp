<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h2>${msg}</h2>
<h1 align="center" style="color: red">Location registration Page</h1>
<form action="insert.htm" method="post">
LocId:<input name="locId">
LocName:<input name="locName">
LocType:<input type="radio" name="locType" value="rural">Rural<input type="radio" name="locType" value="urban">Urban
<input type="submit" value="insert">
</form>
<a href="allLocDetails">View All Details</a>
</body>
</html> --%>
<html ng-app="registerModule">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js">
	
</script>

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
	
<!-- </script>
<script src="WEB-INF/jsps/angular.js"></script> -->

 <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<script type="text/javascript">
var app=angular.module("registerModule",[]);

/* Write AJEX Call to insert the data into database */
app.controller("reg_controller",function($scope,$http){
$scope.registarLoc=function(){
$http({
method:"post",
url:"insert",
params:{
"locId":$scope.locId,
"locName":$scope.locName,
"locType":$scope.locType
}
}).then(function(result){
$scope.response=result.data; //Model data(responseDTO) in json format
if($scope.response.status=="SUCCESS"){
$scope.locId="";
$scope.locName="";
$scope.locType="";
}
},function(result){
$scope.response.msg="Unable to process your Request";	
});
};	

/* Write AJEX Call to update the data from database */
	   $scope.editUser = function(locId, locName, locType) 
	   { 
	$scope.loc="";
		   $http({
			     method : "PUT",
			     url : "updateLoc?locId="+locId,
			     data:"",
			     params:{
			    	 "locId":$scope.locId,
			    	 "locName":$scope.locName,
			    	 "locType":$scope.locType
			    	 },
			     headers : {
			     "Content-Type" : "application/json"
			   },
			   }).then(function(response){
				   $scope.loc=response.data;
				   alert("Calling : "+$scope.loc.locId+" "+$scope.loc.locName+" "+$scope.loc.locType);
				   $scope.locId=$scope.loc.locId;
				   $scope.locName=$scope.loc.locName;
				   $scope.locType=$scope.loc.locType;
				    });
		  	   };
		  	 /* Write AJEX Call to Load the data from database */
		  	 $scope.getLocations=function()
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
		  	 
	   /* Write AJEX Call to Delete the data from database */
	   $scope.deleteUser = function(locId) {
	   	   $http({
	   	     method : "DELETE",
	   	     url : "deleteLoc?locId="+locId,
	   	     	     headers : {
	   	     "Content-Type" : "application/json"
	   	   },
	   	   }).then($scope.getLocations());
	   	   };
	   	   
	   	/* Write data for show and hide */
	   	$scope.ShowHide = function () {
            //If DIV is visible it will be hidden and vice versa.
            $scope.IsVisible = $scope.IsVisible ? false : true;
        };
});
</script>
</head>
<body ng-controller="reg_controller">

<div>
<div align="center">
<h1 style="color:green">Location Registration Page </h1>
</div>
<h1 style="color:red">{{response.msg}}</h1>
<table align="center" class="table table-bordered" style="width: 400px">
<tr><td>LocId      :</td>      <td><input ng-model="locId"/></td><br/></tr>
<tr><td>LocName :</td><td><input ng-model="locName"/></td><br/></tr>
<tr><td>LocType   :</td><td><input ng-model="locType"/></td><br/></tr>
</table>
<div align="center">
<button  type="button" class="btn btn-success" ng-click="editUser(loc.locId,loc.locName,loc.locType)"> Register/Update </button>
</div>
<br/>
</div>

<hr/>
<div align="center" ng-init="temp=false">
<input type="button" type="button" class="btn btn-default"  ng-click="getLocations();temp=true" value="Get All Locations"><br></br>

<table align="center" class="table table-bordered" style="width: 600px" ng-show="temp">
<tr>
<th>Index</th>
<th>LocId</th>
<th>LocName</th>
<th>LocType</th>
<th>Action</th>
</tr>
<tr ng-repeat="item in locs">
<td>{{$index+1}}</td>
<td>{{item.locId}}</td>
<td>{{item.locName}}</td>
<td>{{item.locType}}</td>
<td><a ng-click="editUser(item.locId)" class="btn btn-primary btn-sm">Edit</a>
           | <a ng-click="deleteUser(item.locId)" class="btn btn-danger btn-sm">Delete</a></td>
</tr>
</div>
</table>
</div>
</body>
</html>