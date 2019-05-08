<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Smart Fridge</title>
</head>
<body>
	<h1 align="center">Welcome to the Smart Fridge.</h1>
	<form method="post" action="LoginServlet">
		<table align="center">
			<tr>
				<th align="right">User Type:</th>
				<td><select name="user_type">
						<option value="Chef">Chef</option>
						<option value="User">Regular User</option>
						<option value="Admin">Administrator</option>
				</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit"
					value="Login"></td>
			</tr>
		</table>

	</form>
</body>
</html>