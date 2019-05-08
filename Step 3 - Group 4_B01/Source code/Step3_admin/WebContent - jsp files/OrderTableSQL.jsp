

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
<li><a href="order_approve.jsp">Approve Orders</a></li>	

<sql:setDataSource var="snapshot" driver="org.postgresql.Driver"
     url="jdbc:postgresql://localhost:5432/postgres"
     user="postgres"  password="2312Aidinnew777ledzeppelin"/>
     
<c:set var="orderId" value="1"/>
 

 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from orders;
</sql:query>



 
<table border="1" width="100%">
<tr>
<th>order_num</th>
   <th>Ingredient_ID</th>
   <th>Quantity</th>
   <th>Order_Approved</th>


</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
	<td><c:out value="${row.order_num}"/></td>
   <td><c:out value="${row.ingredient_id}"/></td>
   <td><c:out value="${row.quantity}"/></td>
   <td><c:out value="${row.order_approved}"/></td>
   

</tr>
</c:forEach>
</table>



</body>
</html>