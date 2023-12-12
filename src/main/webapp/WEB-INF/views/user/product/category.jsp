<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>Sản phẩm theo danh mục</title>
<body>
	<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">${ category.name }</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="<c:url value="/" />">Trang chủ</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->

	<div class="container-fluid pt-5">
        <div class="row px-xl-5">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12">
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Tìm theo giá</h5>
					<a class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <label>Tất cả sản phẩm</label>
                            <span class="badge border font-weight-normal">1000</span>
                    </a>
                    <c:forEach var="price" items="${ prices }">
                        	<a href="<c:url value="/price${ price.id }_${ price.from }_${ price.to }" />" style="text-decoration: none" class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
	                            <label>
	                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ price.from }" /> ₫ - <fmt:formatNumber type="number" groupingUsed="true" value="${ price.to }" /> ₫
	                            </label>
	                            <span class="badge border font-weight-normal">1000</span>
                       		</a>
                        </c:forEach>
                </div>
                <!-- Price End -->
                
                <!-- Company Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Thương hiệu</h5>
                    <c:forEach var="company" items="${ companies }">
                        	<a href="<c:url value="/company${ company.id }" />" style="text-decoration: none" class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
	                            <label>
	                            	${ company.name }
	                            </label>
	                            <span class="badge border font-weight-normal">1000</span>
                       		</a>
                        </c:forEach>
                </div>
                <!-- Company End -->
                
                <!-- Category Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">Danh mục</h5>
                    <c:forEach var="category" items="${ categories }">
                        	<a href="<c:url value="/category${ category.id }" />" style="text-decoration: none" class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
	                            <label>
	                            	${ category.name }
	                            </label>
	                            <span class="badge border font-weight-normal">1000</span>
                       		</a>
                        </c:forEach>
                </div>
                <!-- Category End -->
                
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12">
                <div class="row pb-3">
                	
                	<c:if test="${ empty pagination }">
                		<div class="col-lg-12" style="text-align: center; font-size: 22px">
                			<span tyle="text-align: center; font-size: 22px; width:100%">Không có sản phẩm nào</span>
                		</div>
                	</c:if>
                
                	<c:forEach var="product" items="${ pagination }">
	                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
	                        <div class="card product-item border-0 mb-4">
	                            <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                                <img class="img-fluid w-100" src="<c:url value="/assets/img/product/${ product.image }" />" alt="Product">
	                            </div>
	                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                                <h6 class="text-truncate mb-3">${ product.name }</h6>
	                                <div class="d-flex justify-content-center">
	                                    <fmt:formatNumber type="number" groupingUsed="true" value="${ product.price }" /> ₫
	                                </div>
	                            </div>
	                            <div class="card-footer d-flex justify-content-between bg-light border">
	                                <a href="<c:url value="/details/${ product.id }" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>View Detail</a>
	                                
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
                    
                    <c:if test="${ totaldata > 12 }">
                    	<div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                            <li class="page-item">
                              <a class="page-link" href="<c:url value="/category${ catid }/p1" />" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>
                            
                            <c:forEach var="item" begin="1" end="${ paginationinfo.total }" varStatus="itemS">
		                    	<c:if test="${ itemS.index == paginationinfo.current }">
		                    		<li class="page-item active">
		                    			<a class="page-link" href="<c:url value="/category${ catid }/p${ itemS.index }" />">${ itemS.index }</a>
		                    		</li>
		                    	</c:if>
		                    	<c:if test="${ itemS.index != paginationinfo.current }">
		                    		<li class="page-item">
		                    			<a class="page-link" href="<c:url value="/category${ catid }/p${ itemS.index }" />">${ itemS.index }</a>
		                    		</li>
		                    	</c:if>
                    			<c:set var="lastPage" value="${ itemS.index }" />
                    		</c:forEach>

                              <a class="page-link" href="<c:url value="/category${ catid }/p${ lastPage }" />" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>
                          </ul>
                        </nav>
                    </div>
                    </c:if>
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    <!-- Shop End -->
	
	<content tag="script">
  	<script type="text/javascript">
  		$('.add_cart').click(function() {
  			var id = $(this).data('id');
  			$.ajax({
  				type: 'get',
  				url: '${ pageContext.request.contextPath }/addcart',
  				cache: false,
  				data: "id="+ id + "&quantity=1",
  				success: function(response) {
  					$('#cart_size').html(response)
  				}
  			})
  		}) 
  	</script>
  </content>
</body>