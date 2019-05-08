<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<html>
<head>
<title>Place Order</title>
</head>
<body>
<%@include file="header.html"%>

	
	<h3>Order Details</h3>

	<p style="color: red;">${errorString}</p>

	<h4>Please provide the ingredient ID and the quantity of the ingredient:</h4>
	<form method="post" action="doPlaceOrder">
		<table>
			<tr>
				<td>Ingredient ID:</td>
				<td><input type="text" name="id"/></td>
			</tr>
			<tr>
				<td>Quantity:</td>
				<td><input type="text" name="qty"/></td>
				<td><input type="submit" name="chef_options" value="Place Order" /></td>
			</tr>
		</table>
	<h4>Please find the corresponding ID to the ingredient you'd like to place an order for by expanding the table below:</h4>
	  <input type="submit" name ="chef_options" value="Expand table" /> 
		<table border="1" cellpadding="5" cellspacing="1">
			<tr>
				<th>Ingredient ID</th>
				<th>Name</th>
				<th>Price per item</th>
				<th>Count</th>
			</tr>
			<c:forEach items="${ingredientList}" var="ingredient">
				<tr>
					<td>${ingredient.ingredient_id}</td>
					<td>${ingredient.name}</td>
					<td>${ingredient.price_per_item}</td>
					<td>${ingredient.count}</td>
				</tr>
			</c:forEach>
		</table>
	</form>
	<p>
		<%@include file="footer.html"%>
</body>
</html>