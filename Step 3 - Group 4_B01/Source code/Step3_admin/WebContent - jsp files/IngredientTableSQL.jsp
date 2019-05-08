

<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Ingredient Table</title>
</head>
<body>

<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/postgres"
     user="postgres"  password="2312Aidinnew777ledzeppelin"/>
     

 

 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from ingredient;
</sql:query>



 
<table border="1" width="100%">
<tr>
<th>ingredient_id</th>
   <th>name</th>
   <th>threshold date</th>
   <th>price per item</th>
   <th>count</th>
   <th>type</th>
   <th>availability</th>


</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
	<td><c:out value="${row.ingredient_id}"/></td>
   <td><c:out value="${row.name}"/></td>
   <td><c:out value="${row.threshold}"/></td>
   <td><c:out value="${row.price_per_item}"/></td>
   <td><c:out value="${row.count}"/></td>
   <td><c:out value="${row.category}"/></td>
   <td><c:out value="${row.available}"/></td>
   

</tr>
</c:forEach>
</table>



</body>
</html>