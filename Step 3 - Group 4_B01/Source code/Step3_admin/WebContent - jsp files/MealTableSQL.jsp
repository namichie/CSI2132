

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/postgres"
     user="postgres"  password="2312Aidinnew777ledzeppelin"/>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from meals;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>Meal_ID</th>
   <th>Name</th>
   <th>Decritption</th>
   <th>Cuisine</th>
   <th>Available</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.meal_id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.description}"/></td>
   <td><c:out value="${row.cuisine}"/></td>
   <td><c:out value="${row.available}"/></td>
</tr>
</c:forEach>
</table>
</body>
</html>