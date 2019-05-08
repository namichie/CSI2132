<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Enter new order</title>
</head>
<body>
<form name="f2" method="get" action="success_place_order.jsp">
<ul>
<li>Order ingredient_id: <input type="number" name="ingredient_id"/></li><p></p>
<li>Order quantity: <input type="number" name="quantity"/></li><p></p>
<li>Order approved: <input type="text" name="order_approved"/></li><p></p>
</ul>

<input type="submit" name="Submit"/>
</form>

<li><a href="OrderTableSQL.jsp">See Orders Table and Approve</a></li>	

</body>
</html>