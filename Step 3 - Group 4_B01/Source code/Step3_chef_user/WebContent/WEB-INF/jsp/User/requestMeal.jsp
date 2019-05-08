<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<title>Request A Meal</title>
</head>
<body>

	<%@include file="header.html"%>

	<h3>Meal Details</h3>

	<p style="color: red;">${errorString}</p>

	<h4>Please enter:</h4>
	<form method="post" action="doRequestMeal">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" size="10" /></td>
				<td><input type="submit" name="chef_options"
					value="Request Meal" /></td>
			</tr>
		</table>
	</form>

	<h4>Meal List</h4>
	<table border="1" cellpadding="5" cellspacing="1">
		<tr>
			<th>Name</th>
			<th>Description</th>
			<th>Cuisine</th>
			<th>Available</th>
		</tr>
		<c:forEach items="${mealList}" var="meal">
			<tr>
				<td>${meal.name}</td>
				<td>${meal.description}</td>
				<td>${meal.cuisine}</td>
				<td><c:choose>
						<c:when test="${meal.available}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<%@include file="footer.html"%>


</body>
</html>