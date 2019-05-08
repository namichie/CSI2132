<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Report of Meal</title>
</head>
<body>
	<%@include file="header.html"%>

	<h3>Search Meal</h3>

	<p style="color: red;">${errorString}</p>

	<h4>Please enter:</h4>
	<form method="post" action="doSearchMeal">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" size="10" /></td>
				<td>OR Cuisine:</td>
				<td><input type="text" name="cuisine" size="10" /></td>
				<td><input type="submit" value="Search Meal" /></td>
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
			<th>Ingredient</th>
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
				<td><c:forEach items="${meal.ingredientNames}" var="name">
		       		${name}
		         </c:forEach></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<%@include file="footer.html"%>
</body>
</html>