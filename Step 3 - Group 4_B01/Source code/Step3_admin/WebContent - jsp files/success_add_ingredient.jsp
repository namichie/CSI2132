<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.mit.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ingredient Insertion</title>
</head>
<body>
<jsp:useBean id="obj" class = "com.mit.IngredientBean"/>
<jsp:setProperty property="*" name="obj"/>
<%
int status3=IngredientDAO.insertIngredient(obj);
if(status3>0)
	out.println("Inserted successfully!");
else
	out.println("Insertion Failed...");
%>

<p></p>
<a href="IngredientTableSQL.jsp">See Ingredient Table</a>
</body>
</html>