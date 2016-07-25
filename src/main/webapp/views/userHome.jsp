<!DOCTYPE html>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<style>
body {
	background-color: #b28785;
}

.jumbotron {
	background-color: #b28785;
	color: #330033;
	margin-bottom: 0;
}

.navbar {
	background-color: #330033;
	color: #b28785;
	margin-bottom: 50px;
	border-radius: 0;
}

#index small {
	font-size: 10px;
	word-spacing: 4px;
	letter-spacing: 3px;
	color: #330033;
}

.carousel-inner>.item>img {
	width: 100%;
	margin: auto;
}
#product {
	background-color: #F0FFFF !important;

}
#allProduct {
	background-color: #F0FFFF !important;
}
</style>
<title>Landing Page</title>
</head>

<body>
	
	<%@ include file="/views/header.jsp" %>
	
	
	
	
	<sec:authorize access="isAnonymous()">
	<div class="container text-center">
			<c:if test="${isLoginClicked == 'TRUE'}">
	
		<c:if test="${isLogoutClicked == 'TRUE'}">
			${logoutMsg}
		</c:if>
			<%@ include file="/views/login.jsp" %>
			</c:if>
	</div>
	</sec:authorize>
	
	
	
	
	
	<div class="container" id="product">
		<c:if test="${!empty selectedProduct.name}">
			<%@ include file="/views/viewProduct.jsp" %>
		</c:if>
	</div>
	<div class="container" id="allProduct">
		<c:if test="${!empty products}">
			<%@ include file="/views/allProduct.jsp" %>
		</c:if>
	</div>
	
	
	<br><br><br>
	<%@ include file="/views/carousel.jsp" %>
	
	<%@ include file="/views/footer.jsp" %>
	
	
	

</body>
</html>