<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>

<jsp:useBean id="order" class="beans.Order" scope="request"/>
<html>
 <head>
    <title>Place Order</title>
</head>
<body>
    <h3>Thank you! Your Order Has Been Placed Successfully</h3>
 
    <p style="color: red;">${errorString}</p>
    
    <table>
        <tr>
            <td>Ingredient ID:</td>
            <td>
                <jsp:getProperty name="order" property="ingredient_id"/>
            </td>
        </tr>
        <tr>
            <td>Quantity:</td>
            <td>
                <jsp:getProperty name="order" property="quantity"/>
            </td>
        </tr>
        
    </table>
</body>
</html>