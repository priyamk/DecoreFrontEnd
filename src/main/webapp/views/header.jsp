<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="container-fluid text-center" id="index">
		<div class="jumbotron">
			<h1>
				DecHomeOr<small> plan & design your HOME</small>
			</h1>
		</div>

	</div>

	<nav class="navbar navbar-inverse">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">HDO</a>
		</div>
		<ul class="nav navbar-nav">
			<li class="active"><a href="index.jsp">Home</a></li>
			<li class="dropdown"><a class="dropdown-toggle"
				data-toggle="dropdown" >Products<span class="caret"></span></a>
				<ul class="dropdown-menu">
					<c:forEach items="${categoryList}" var="category">
					<li><a href="<c:url value='product/getMul/${category.id}' />">${category.name}</a>
					<ul>
						<c:forEach items="${category.products}" var="product">

						<li><a href="<c:url value='product/get/${product.id}' />">${product.name}</a></li>

						</c:forEach>

					</ul></li>
					</c:forEach>
					
					
				</ul></li>
			

		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="views/register.jsp"><span class="glyphicon glyphicon-user"></span>
					Sign Up</a></li>
			<li><a href="login"><span class="glyphicon glyphicon-log-in"></span>
					Login</a></li>
			<li><a href="#"><span
					class="glyphicon glyphicon-shopping-cart"></span> Cart</a></li>
					<li><a href="j_spring_security_logout">Logout</a></li>
		</ul>
	</div>
	</nav> 