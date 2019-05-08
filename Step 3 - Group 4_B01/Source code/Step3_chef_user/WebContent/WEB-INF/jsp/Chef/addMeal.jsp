<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<jsp:useBean id="meal" class="beans.Meal" scope="session">
	<jsp:setProperty name="meal" property="*" />
</jsp:useBean>

<html>
<head>
<title>Add Meal</title>
</head>
<body>
	<%@include file="header.html"%>

	<h3>Meal Details</h3>

	<p style="color: red;">${errorString}</p>

	<h4>Please provide:</h4>
	<form method="post" action="doAddMeal">
		<table>
			<tr>
				<td align='right'>Name:</td>
				<td><input type="text" name="name" size="30" maxlength=30 /> 
				<span style="color: red;">${messages.name}</span></td>
			</tr>
			<tr>
				<td align='right'>Description:</td>
				<td><input type="text" name="description" size="30"
					maxlength=30 /> <span style="color: red;">${messages.description}</span>
				</td>
			</tr>
			<tr>
				<td align='right'>Cuisine:</td>
				<td><input type="text" name="cuisine" size="30" /> <span
					style="color: red;">${messages.cuisine}</span></td>
			</tr>
			<tr>
				<td>Available:</td>
				<td><input type="checkbox" name="available" checked="checked" />
				</td>
			</tr>
			<tr>
				<td>Select Ingredients:</td>
				<td></td>
			</tr>
			<tr>
				<td align='right'>(Control-Click)</td>
				<td><select name="ingredients" size="5" multiple="multiple"
					tabindex="1">
						<c:forEach var="item" items="${ingredients}">
							<option value="${item.ingredient_id}_${item.name}">${item.name}</option>
						</c:forEach>
				</select> <span style="color: red;">${messages.ingredients}</span></td>
			</tr>
		</table>
		<p>
			<input type="submit" value="Add Meal" />
	</form>
	<p>
		<%@include file="footer.html"%>
</body>
</html>