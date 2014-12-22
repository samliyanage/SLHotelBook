<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>
<link href="<c:url value="/resources/css/bootstrap.css" />" rel="stylesheet">
<link href="<c:url value="/resources/css/custom_style.css" />" rel="stylesheet">
<script src="<c:url value="/resources/js/angular.min.js" />"></script>

<body>
	<div class="center">
		<h2>
			Adding Hotel to Database
		</h2>
		
		<form action="findHotels" method="get">
			<input type="submit" value="Search Hotels">
		</form>
		
		<div class="${status}">${message}</div>

		<form action="addHotel" method="post">
			<table class="table table-striped" style="width: 60%" align="center">
				<tbody>
					<tr>
						<td>Name of the Hotel</td>
						<td><input type="hidden" name="id"> <input
							type="text" id="name" name="name" placeholder="Hotel Name"
							autofocus /></td>
					</tr>
					<tr>
						<td>Address of the Hotel</td>
						<td><input type="text" id="address" name="address"
							placeholder="Address" autofocus /></td>
					</tr>
					<tr>
						<td>Location of the Hotel</td>
						<td><input type="text" id="location" name="location"
							placeholder="Location" autofocus /></td>
					</tr>
					<tr>
						<td colspan="2"><input type="submit" value="Import" /></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</body>
</html>