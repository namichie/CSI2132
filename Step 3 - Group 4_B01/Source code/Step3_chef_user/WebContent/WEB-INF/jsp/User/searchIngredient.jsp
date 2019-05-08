<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<html>
<head>
<title>Get Food Item</title>
</head>
<body>
	<%@include file="header.html"%>

	<h3>Search Ingredient</h3>

	<p style="color: red;">${errorString}</p>

	<h4>Please enter:</h4>
	<form method="post" action="doSearchIngredient">
		<table>
			<tr>
				<td>Name:</td>
				<td><input type="text" name="name" size="10" /></td>
				<td>OR Category:</td>
				<td><select name="category">
						<option value="-1">-Select Category-</option>
						<c:forEach var="item" items="${categoryTypes}">
							<option value="${item}">${item}</option>
						</c:forEach>
				</select></td>
				<td><input type="submit" value="Search Ingredient" /></td>
			</tr>
		</table>
	</form>

	<h4>Ingredient List</h4>
	<table border="1" cellpadding="5" cellspacing="1">
		<tr>
			<th>Name</th>
			<th>Threshold</th>
			<th>Price per item</th>
			<th>Count</th>
			<th>Category</th>
			<th>Available</th>
		</tr>
		<c:forEach items="${ingredientList}" var="ingredient">
			<tr>
				<td>${ingredient.name}</td>
				<td>${ingredient.threshold}</td>
				<td>${ingredient.price_per_item}</td>
				<td>${ingredient.count}</td>
				<td>${ingredient.category}</td>
				<td><c:choose>
						<c:when test="${ingredient.available}">Yes</c:when>
						<c:otherwise>No</c:otherwise>
					</c:choose></td>
			</tr>
		</c:forEach>
	</table>
	<p>
		<%@include file="footer.html"%>
</body>
</html>