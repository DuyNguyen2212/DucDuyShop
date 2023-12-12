<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<titile>Đức Duy Shop</titile>
<body>
	<!-- Featured Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-check text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Sản phẩm chất lượng</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-shipping-fast text-primary m-0 mr-2"></h1>
                    <h5 class="font-weight-semi-bold m-0">Free Ship</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fas fa-exchange-alt text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Hoàn trả trong 14 ngày</h5>
                </div>
            </div>
            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
                <div class="d-flex align-items-center border mb-4" style="padding: 30px;">
                    <h1 class="fa fa-phone-volume text-primary m-0 mr-3"></h1>
                    <h5 class="font-weight-semi-bold m-0">Hỗ trợ 24/7</h5>
                </div>
            </div>
        </div>
    </div>
    <!-- Featured End -->


    <!-- Categories Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5 pb-3">
        	<c:forEach var="company" items="${ randomCompanies }">
	            <div class="col-lg-4 col-md-6 pb-1">
	                <div class="cat-item d-flex flex-column border mb-4" style="padding: 30px;">
	                	<c:forEach var="num" items="${ proNum }">
	                		<c:if test="${ num.key == company.id }">
			                    <p class="text-right">${ num.value } sản phẩm</p>
	                		</c:if>
	                	</c:forEach>
	                    <a href="<c:url value="/company${ company.id }" />" class="cat-img position-relative overflow-hidden mb-3">
	                        <img class="img-fluid" src="<c:url value="/assets/img/company/${ company.image }" />" alt="Brand">
	                    </a>
	                    <h5 class="font-weight-semi-bold m-0">${ company.name }</h5>
	                </div>
	            </div>
        	</c:forEach>
        </div>
    </div>
    <!-- Categories End -->


    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Thịnh hành</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        	<c:if test="${ topsellproducts.size() < 8 }">
        		<c:set var="limit" value="4" />
        	</c:if>
        	<c:if test="${ topsellproducts.size() == 8 }">
        		<c:set var="limit" value="8" />
        	</c:if>
        	
        	<c:forEach var="product" items="${ topsellproducts }" varStatus="productIndex">
        		<c:if test="${ productIndex.index < limit }">
		            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		                <div class="card product-item border-0 mb-4">
		                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
		                        <img class="img-fluid w-100" src="<c:url value="/assets/img/product/${ product.image }" />" alt="Product">
		                    </div>
		                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
		                        <h6 class="text-truncate mb-3">${ product.name }</h6>
		                        <div class="d-flex justify-content-center">
		                            <h6>
		                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ product.price }" /> ₫
		                            </h6>
		                        </div>
		                    </div>
		                    <div class="card-footer d-flex justify-content-between bg-light border">
		                        <a href="<c:url value="/details/${ product.id }" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
		                     
		                        <c:if test="${ empty loginsession }">
			                        <a href="<c:url value="/login" />" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
		                        </c:if>  
		                        <c:if test="${ not empty loginsession }">
		                        	<span data-id="${ product.id }" class="add_cart btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</span>
		                        </c:if>
		                    </div>
		                </div>
		            </div>	
        		</c:if>
        	</c:forEach>
        </div>
    </div>
    <!-- Products End -->

    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Mới nhất</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
            <c:if test="${ newproducts.size() < 8 }">
        		<c:set var="limit" value="4" />
        	</c:if>
        	<c:if test="${ newproducts.size() == 8 }">
        		<c:set var="limit" value="8" />
        	</c:if>
        	
        	<c:forEach var="product" items="${ newproducts }" varStatus="productIndex">
        		<c:if test="${ productIndex.index < limit }">
		            <div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		                <div class="card product-item border-0 mb-4">
		                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
		                        <img class="img-fluid w-100" src="<c:url value="/assets/img/product/${ product.image }" />" alt="Product">
		                    </div>
		                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
		                        <h6 class="text-truncate mb-3">${ product.name }</h6>
		                        <div class="d-flex justify-content-center">
		                            <h6>
		                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ product.price }" /> ₫
		                            </h6>
		                        </div>
		                    </div>
		                    <div class="card-footer d-flex justify-content-between bg-light border">
		                        <a href="<c:url value="/details/${ product.id }" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
		                     
		                        <c:if test="${ empty loginsession }">
			                        <a href="<c:url value="/login" />" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
		                        </c:if>  
		                        <c:if test="${ not empty loginsession }">
		                        	<span data-id="${ product.id }" class="add_cart btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</span>
		                        </c:if>
		                    </div>
		                </div>
		            </div>	
        		</c:if>
        	</c:forEach>
        </div>
    </div>
    <!-- Products End -->
    
    <!-- Products Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Đề cử cho bạn</span></h2>
        </div>
        <div class="row px-xl-5 pb-3">
        	
        	<c:forEach var="product" items="${ products }" varStatus="productIndex">
				<div class="col-lg-3 col-md-6 col-sm-12 pb-1">
		                <div class="card product-item border-0 mb-4">
		                    <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
		                        <img class="img-fluid w-100" src="<c:url value="/assets/img/product/${ product.image }" />" alt="Product">
		                    </div>
		                    <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
		                        <h6 class="text-truncate mb-3">${ product.name }</h6>
		                        <div class="d-flex justify-content-center">
		                            <h6>
		                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ product.price }" /> ₫
		                            </h6>
		                        </div>
		                    </div>
		                    <div class="card-footer d-flex justify-content-between bg-light border">
		                        <a href="<c:url value="/details/${ product.id }" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
		                     
		                        <c:if test="${ empty loginsession }">
			                        <a href="<c:url value="/login" />" class="btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</a>
		                        </c:if>  
		                        <c:if test="${ not empty loginsession }">
		                        	<span data-id="${ product.id }" class="add_cart btn btn-sm text-dark p-0"><i class="fas fa-shopping-cart text-primary mr-1"></i>Thêm vào giỏ</span>
		                        </c:if>
		                    </div>
		                </div>
		            </div>	
        	</c:forEach>
        </div>
    </div>
    <!-- Products End -->


    <!-- Vendor Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel vendor-carousel">
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-1.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-2.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-3.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-4.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-5.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-6.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-7.jpg" alt="">
                    </div>
                    <div class="vendor-item border p-4">
                        <img src="img/vendor-8.jpg" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Vendor End -->
    
    <content tag="script">
  	<script type="text/javascript">
  		$('.add_cart').click(function() {
  			var id = $(this).data('id');
  			$.ajax({
  				type: 'get',
  				url: '${ pageContext.request.contextPath }/addcart',
  				cache: false,
  				data: "id="+ id + "&quantity=1&size=1",
  				success: function(response) {
  					$('#cart_size').html(response)
  				}
  			})
  		}) 
  	</script>
  </content>
</body>