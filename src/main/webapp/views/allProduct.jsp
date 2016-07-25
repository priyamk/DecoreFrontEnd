<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>All Products In Category : </h1><h3>${selectedCategory.name}</h3>

            <p class="lead">Checkout all the awesome products available now!</p>
        </div>
			<div class="table-responsive">
        <table class="table table-hover">
            <thead>
                <tr  class="bg-success">
                    <th>Image</th>
                    <th>Product Name</th>
                    <th>Price</th>
                    <th></th>
                </tr>
            </thead>
            <c:forEach items="${products}" var="product">
                <tr>
                    <td><img src="<c:url value="/resources/images/${product.id}.jpg" />" alt="image" style="width:10%"/>
</td>
                    <td>${product.name}</td>
                    <td>RS ${product.price}</td>
              
               <td><a
							href="<spring:url value="/product/get/${product.id}" />"
							class="btn btn-sm"> <span
								class="glyphicon-info-sign glyphicon"> </span> Details
						</a> </td>
                </tr>
            </c:forEach>
        </table>
        </div>
</div>
</div>