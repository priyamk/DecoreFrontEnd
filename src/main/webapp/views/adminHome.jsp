<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
#page{
background-color: #b28785;}
#page2{
background-color: #F0FFFF;}
</style>
</head>
<body id="page">

<h4>Welcome Admin </h4> <br><br>

<a href="categories"> Categories </a>  | <a href="suppliers"> Suppliers</a> |  <a href="products"> Products</a>   

<a href="j_spring_security_logout">Logout</a>

<div id="page2" class="container">
<c:if test="${isProductClicked=='TRUE'}">
	<%@ include file="/views/product.jsp" %>

</c:if>
<c:if test="${isCategoriesClicked=='TRUE'}">
	<%@ include file="/views/category.jsp" %>

</c:if>
<c:if test="${isSupplierClicked=='TRUE'}">
	<%@ include file="/views/supplier.jsp" %>

</c:if>
</div>
</body>
</html>