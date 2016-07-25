<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="container-wrapper">
    <div class="container">
        <div class="page-header">
            <h1>Product Detail</h1>


            <p class="lead">Here is the detail information of the product:</p>
        </div>

        <div class="container" >
            <div class="row">
                <div class="col-md-5">
                   				 <img src="<c:url value="/resources/images/${selectedProduct.id}.jpg" />" alt="image" style="width:10%"/>

                </div>
                <div class="col-md-5">
                    <h3>${selectedProduct.name}</h3>
                    <p>${selectedProduct.description}</p>
                    <p><strong>Supplier</strong>: ${selectedProduct.supplier.name}</p>
                    <p><strong>Category</strong>: ${selectedProduct.category.name}</p>
                    <p>RS ${selectedProduct.price}</p>

                    <br/>

                   

         
                    
                    
        </div>
            </div>
        </div>
        </div></div>