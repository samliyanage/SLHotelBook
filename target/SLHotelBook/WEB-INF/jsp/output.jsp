<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/angular.min.js" />"></script>

<script>
    var app = angular.module('myapp', []);
    
    app.filter('offset', function() {
    	  return function(input, start) {
    	    start = parseInt(start, 10);
    	    return input.slice(start);
    	  };
    	});
	
    app.controller('myController', function($scope) {
      
      $scope.itemsPerPage = 10;
      $scope.currentPage = 0;
      $scope.items =${hotels};
      
      $scope.sortorder = 'location';

      
      $scope.range = function() {
    	    var rangeSize = 5;
    	    var ret = [];
    	    var start;

    	    start = $scope.currentPage;
    	    if ( start > $scope.pageCount()-rangeSize ) {
    	      start = $scope.pageCount()-rangeSize+1;
    	    }

    	    for (var i=start; i<start+rangeSize; i++) {
    	      ret.push(i);
    	    }
    	    return ret;
    	  };

    	  $scope.prevPage = function() {
    	    if ($scope.currentPage > 0) {
    	      $scope.currentPage--;
    	    }
    	  };

    	  $scope.prevPageDisabled = function() {
    	    return $scope.currentPage === 0 ? "disabled" : "";
    	  };

    	  $scope.pageCount = function() {
    	    return Math.ceil($scope.items.length/$scope.itemsPerPage)-1;
    	  };

    	  $scope.nextPage = function() {
    	    if ($scope.currentPage < $scope.pageCount()) {
    	      $scope.currentPage++;
    	    }
    	  };

    	  $scope.nextPageDisabled = function() {
    	    return $scope.currentPage === $scope.pageCount() ? "disabled" : "";
    	  };

    	  $scope.setPage = function(n) {
    	    $scope.currentPage = n;
    	  };
      
      
    });
  </script>
<body ng-app="myapp">
	<h2>Sri Lanka's Hotels Network</h2>
	<div ng-controller="myController">
	
	 <form class="form-inline">
      <input ng-model="query" type="text"
        placeholder="Filter by Location" autofocus>
    </form>
	
	<form action="hotel/add" method="post">
		<table class="table table-striped">
			<thead>
	      <tr>
	        <th>Name</th>
	        <th>Address</th>
	        <th>Location/City</th>
	        <th></th>
	      </tr>
	    </thead>
	    <tbody>
	    	<tr>
	    		<td>
	    			<input type="hidden" name="id">
	    			<input type="text" id="name" name="name" placeholder="Hotel Name" autofocus />
	    		</td>
	    		<td>
	    			<input type="text" id="address" name="address" placeholder="Address" autofocus />
	    		</td>
	    		<td>
	    			<input type="text" id="location"name="location" placeholder="Location" autofocus/>
	    		</td>
	    		<td>
	    			<input type="submit" value="Import" />
	    		</td>
	    	</tr>
			<tr ng-repeat="hotel in items | offset: currentPage*itemsPerPage | limitTo: itemsPerPage | orderBy:sortorder | filter: { location: query} ">
				<td>{{ hotel.name }}</td>
				<td>{{ hotel.address }}</td>
				<td>{{ hotel.location }}</td>
				<td></td>
			</tr>
			</tbody>
			<tfoot>
	      <td colspan="3">
	        <div class="pagination">
	          <ul>
	            <li ng-class="prevPageDisabled()">
	              <a href ng-click="prevPage()">« Prev</a>
	            </li>
	            <li ng-repeat="n in range()"
	              ng-class="{active: n == currentPage}" ng-click="setPage(n)">
	              <a href="#">{{n+1}}</a>
	            </li>
	            <li ng-class="nextPageDisabled()">
	              <a href ng-click="nextPage()">Next »</a>
	            </li>
	          </ul>
	        </div>
	      </td>
	    </tfoot>
		</table>
	</form>
	</div>

</body>
</html>