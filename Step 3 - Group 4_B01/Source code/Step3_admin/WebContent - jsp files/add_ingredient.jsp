<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Ingredient</title>
</head>
<body>
<form name="f3" method="get" action="success_add_ingredient.jsp">
<ul>
<li>Enter name: <input type="text" name="name"/></li><p></p>
<!--<li>Enter expiry date: <input type="date" name="threshold"/></li><p></p>-->
<li>Enter price per item: <input type="text" name="price_per_item"/></li><p></p>
<li>Enter quantity: <input type="text" name="count"/></li><p></p>
<li>Enter type of product: <input type="text" name="category"/></li><p></p>
<li>Enter availability: <input type="text" name="available"/></li><p></p>
</ul>

<input type="submit" name="Submit"/>
</form>

<li><a href="IngredientTableSQL.jsp">See Ingredients Table</a></li>	

</body>
</html>