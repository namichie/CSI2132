<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter new meal</title>
</head>
<body>
<form name="f1" method="get" action="success.jsp">
<ul>
<li>Meal Name: <input type="text" name="meal_name"/></li><p></p>
<li>Meal Descripion: <input type="text" name="meal_description"/></li><p></p>
<li>Meal Cuisine: <input type="text" name="meal_cuisine"/></li><p></p>
<li>Meal Availability: <input type="text" name="meal_availability"/></li><p></p>
</ul>

<input type="submit" name="Submit"/>
</form>
</body>
</html>