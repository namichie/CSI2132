<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.mit.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order Insertion</title>
</head>
<body>
<jsp:useBean id="obj" class = "com.mit.OrderBean"/>
<jsp:setProperty property="*" name="obj"/>
<%
int status2=OrderDAO.approveOrder(obj);
if(status2>0)
	out.println("Approved successfully!");
else
	out.println("Approve Failed...");
%>

<p></p>
<a href="OrderTableSQL.jsp">See Order Table</a>
</body>
</html>