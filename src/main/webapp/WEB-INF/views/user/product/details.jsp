<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>${ productdetails.name }</title>
<body>
	<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Chi tiết sản phẩm</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="<c:url value="/" />">Trang chủ</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shop Detail</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Shop Detail Start -->
    <div class="container-fluid py-5">
        <div class="row px-xl-5">
            <div class="col-lg-5 pb-5">
                <div id="product-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner border">
                        <div class="carousel-item active">
                            <img class="w-100 h-100" src="<c:url value="/assets/img/product/${ productdetails.image }" />" alt="Image">
                        </div>
                        <c:forEach var="image" items="${ productimages }">
                        	<div class="carousel-item">
                            	<img class="w-100 h-100" src="<c:url value="/assets/img/product/${ image.image_img }" />" alt="Image">
                        	</div>
                        </c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
                        <i class="fa fa-2x fa-angle-left text-dark"></i>
                    </a>
                    <a class="carousel-control-next" href="#product-carousel" data-slide="next">
                        <i class="fa fa-2x fa-angle-right text-dark"></i>
                    </a>
                </div>
            </div>

            <div class="col-lg-7 pb-5">
                <h3 class="font-weight-semi-bold">${ productdetails.name }</h3>
                
                <h3 class="font-weight-semi-bold mb-4"><fmt:formatNumber type="number" groupingUsed="true" value="${ productdetails.price }" /> ₫</h3>
                <p class="mb-4">${ productdetails.brief }</p>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Chất liệu: ${ productdetails.material }</p>
                </div>
                <div class="d-flex mb-3">
                    <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
                    <form id="myForm">
                    	<c:forEach var="size" items="${ sizes }">
	                	<div class="custom-control custom-radio custom-control-inline">
		                    <input type="radio" class="custom-control-input" id="size-${ size.size_id }" name="size" value="${ size.size_id }">
		                    <label class="custom-control-label" for="size-${ size.size_id }">
		                    	<c:forEach var="item" items="${ listsize }">
		                    		<c:if test="${ item.id == size.size_id }">
		                    			${ item.size }
		                    		</c:if>
		                    	</c:forEach>
		                    </label>
	                    </div>
                    </c:forEach>
                    </form>
                </div>
                <p class="mb-4" id="message_size"></p>
                <div class="d-flex align-items-center mb-4 pt-2">
                    <div class="input-group quantity mr-3" style="width: 170px;">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-minus" >
                            <i class="fa fa-minus"></i>
                            </button>
                        </div>
                        <input id="input" type="number" class="form-control bg-secondary text-center" min="1" max="${ productdetails.quantity }" value="1">
                        <div class="input-group-btn">
                            <button class="btn btn-primary btn-plus">
                                <i class="fa fa-plus"></i>
                            </button>
                        </div>
                    </div>
                    <c:if test="${ empty loginsession }">
                    	<a href="<c:url value="/login" />">
                    		<button class="btn btn-primary px-3">
                    			<i class="fa fa-shopping-cart mr-1"></i>Thêm vào giỏ
                    		</button>
                    	</a>
                    </c:if>
                    
                    <c:if test="${ not empty loginsession }">
                    	<button id="btn" data-id="${ productdetails.id }" class="btn btn-primary px-3">
                    		<i class="fa fa-shopping-cart mr-1"></i>Thêm vào giỏ
                    	</button>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="nav nav-tabs justify-content-center border-secondary mb-4">
                    <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">Mô tả</a>
                </div>
                <div class="tab-content">
                    <div class="tab-pane fade show active" id="tab-pane-1">
                        <h4 class="mb-3">Mô tả sản phẩm</h4>
                        <p>${ productdetails.description }</p>
                   
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Shop Detail End -->


    <!-- Products Start -->
    <div class="container-fluid py-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Có Thể Bạn Sẽ Thích</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col">
                <div class="owl-carousel related-carousel">
                	<c:forEach var="product" items="${ relatedproducts }">
	                    <div class="card product-item border-0">
	                        <div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
	                            <img class="img-fluid w-100" src="<c:url value="/assets/img/product/${ product.image }" />" alt="">
	                        </div>
	                        <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
	                            <h6 class="text-truncate mb-3">${ product.name }</h6>
	                            <div class="d-flex justify-content-center">
	                                <h6>
	                                	<fmt:formatNumber type="number" groupingUsed="true" value="${ product.price }" /> ₫
	                                </h6>
	                            </div>
	                        </div>
	                        <div class="card-footer d-flex bg-light border" style="justify-content: center")>
	                            <a href="<c:url value="/details/${ product.id }" />" class="btn btn-sm text-dark p-0"><i class="fas fa-eye text-primary mr-1"></i>Chi tiết</a>
	                        </div>
	                    </div>              		
                	</c:forEach>
                </div>
            </div>
        </div>
    </div>
    <!-- Products End -->
    
    <content tag="script">
  		<script>
  			$('#btn').on('click', function() {
  				var radioValue = 0
  				
	  				$('#myForm .custom-control input[type="radio"]').each(function() {
	  						
	  					var check = $(this).is(":checked")
	  						
	  				    	if(check) {
		  				    	radioValue = $(this).val()
		  				    	console.log(radioValue)
		  				    	return false;
		  				    }
	  				    
	  				  })
  				
  				if(radioValue === 0) {
  					var messagesize = $('#message_size')
  					
  					messagesize.text('Chọn size')
  					
  					setTimeout(function() {
  						messagesize.text('');
  			        }, 5000)
  				}
  				else {
	  				var id = $(this).data("id")
					var quantity = $('#input').val()
					console.log(quantity)
					console.log('${ pageContext.request.contextPath }')
					$.ajax({
						type: 'get',
		  				url: '${ pageContext.request.contextPath }/addcart',
		  				cache: false,
		  				data: "id="+ id + "&quantity=" + quantity + "&size=" + radioValue,
		  				success: function(response) {
		  					if(response === 0) {
		  						$('#cart_size').html('')
		  					}
		  					else {
		  						$('#cart_size').html(response)
		  					}
		  				}
					})	
  				}	
  			})
  		</script>
	</content>
</body>