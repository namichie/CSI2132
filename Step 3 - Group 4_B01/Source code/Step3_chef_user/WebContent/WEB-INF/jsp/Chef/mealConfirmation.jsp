<%@ page language="java" contentType="text/html; charset=UTF-8"
 pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>

<jsp:useBean id="meal" class="beans.Meal" scope="request"/>
<html>
 <head>
    <title>Add Meal</title>
</head>
<body>
    <h3>Meal Added Successfully</h3>
 
    <table>
  
        <tr>
            <td>Name:</td>
            <td>
                <jsp:getProperty name="meal" property="name"/>
            </td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>
                <jsp:getProperty name="meal" property="description"/>
            </td>
        </tr>
        <tr>
            <td>Cuisine:</td>
            <td>
                <jsp:getProperty name="meal" property="cuisine"/>
            </td>
        </tr>
        <tr>
            <td>Available:</td>
            <td>
                <jsp:getProperty name="meal" property="available"/>
            </td>
        </tr>
        <tr>
            <td>Ingredient:</td>
            <td>
		       <c:forEach items="${meal.ingredientNames}" var="name" >
		       		${name}
		       </c:forEach>
            </td>
        </tr>
    </table>
</body>
</html>