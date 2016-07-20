<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Shopping chart</title>
</head>
<body>

	Please login with your credentials
	<br> ${message}
	<form name="loginForm" action="<c:url value="/j_spring_security_check" />" method="post">

                <c:if test="${not empty error}">
                    <div class="error" style="color: #ff0000;">${error}</div>
                </c:if>

                <div class="form-group">
                    <label for="username">User: </label>
                    <input type="text" id="username" name="username" class="form-control" />
                </div>
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" class="form-control" />
                </div>
                <input type="submit" value="Submit" class="btn btn-default">
            </form>
        

<a href="<c:url value="/j_spring_security_logout" />">logout</a>
</body>
</html>