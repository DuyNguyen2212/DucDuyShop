<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>Giỏ hàng</title>
<body>
	<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Shopping Cart</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Shopping Cart</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Cart Start -->
    <div class="container-fluid pt-5">
        <div class="row px-xl-5">
        	<c:if test="${ empty cart }">
            	<div class="col-lg-12 text-center">
            		<div>Giỏ hàng trống</div>
                </div>
            </c:if>
            
            <c:if test="${ not empty cart }">
            <div class="col-lg-8 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Size</th>
                            <th>Giá</th>
                            <th>Số lượng</th>
                            <th>Giảm giá</th>
                            <th>Tổng tiền</th>
                            <th>Xóa</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:forEach var="item" items="${ cart }">		
	                        <tr>
	                            <td class="align-middle"><a href="<c:url value="/details/${ item.product.id }" />"><img src="<c:url value="/assets/img/product/${ item.product.image }" />" alt="" style="width: 50px;"><p style="white-space: nowrap;max-width: 150px;overflow: hidden;">${ item.product.name }</p></a></td>
	                            <td class="align-middle">
	                            	<c:forEach var="size" items="${ sizes }">
	                            		<c:if test="${ size.id == item.size_id }">
	                            			${ size.size }
	                            		</c:if>
	                            	</c:forEach>
	                            </td>
	                            <td class="align-middle"><fmt:formatNumber type="number" groupingUsed="true" value="${ item.product.price }" /> ₫</td>
	                            <td class="align-middle">
	                                <div class="input-group quantity mx-auto" style="width: 100px;">
	                                   
	                                    <input data-id="${ item.product.id }" id="item-${ item.product.id }" type="number" class="form-control form-control-sm bg-secondary text-center edit-btn" min="1" max="${ item.product.quantity }" value="${ item.quantity }">
	                                    <input class="pquantity" type="hidden" value="${ item.product.quantity }" />
	                                    <input class="psize" type="hidden" value="${ item.size_id }" />
	                                    
	                                </div>
	                                <div class="e-message"></div>
	                            </td>
	                            <td class="align-middle">${ item.product.sale_off }%</td>
	                            <td id="price" class="align-middle"><fmt:formatNumber type="number" groupingUsed="true" value="${ item.totalPrice }" /> ₫</td>
	                            <td class="align-middle"><a href="<c:url value="/delete-item/${ item.product.id }/${ item.size_id }" />"><button class="btn btn-sm btn-primary"><i class="fa fa-times"></i></button></a></td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Giỏ hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between mb-3 pt-1">
                            <h6 class="font-weight-medium">Số lượng</h6>
                            <h6 id="total_quantity" class="font-weight-medium">${ totalQuantity }</h6>
                        </div> 
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Thành tiền</h5>
                            <h5 id="total_price" class="font-weight-bold"><fmt:formatNumber type="number" groupingUsed="true" value="${ totalPrice }" /> ₫</h5>
                        </div>
                        <a href="<c:url value="/checkout" />"><button class="btn btn-block btn-primary my-3 py-3">Đặt hàng</button></a>
                    </div>
                </div>
            </div>
            	
            </c:if>
        
        </div>
    </div>
    <!-- Cart End -->
    
    <c:if test="${ success }">
  		<div class="mess-container d-flex">
    		<div class="mess-box">
      			<label class="mess-success">Đặt hàng thành công !</label>
      			<a class="btn btn-primary btn-block" href="<c:url value="/bill" />" class="login-link">Đơn hàng của bạn</a>
    		</div>
  		</div>
  	</c:if>
    
    <content tag="script">
		<script type="text/javascript">
			$('.edit-btn').bind('keyup mouseup', function() {
				var id = $(this).data("id")
				var pquantity = $(this).parent().children('.pquantity').val()
				var size_id = $(this).parent().children('.psize').val()
				var quantity = $(this).val()
				var price = $(this).parent().parent().parent().children('#price')
				
				$.ajax({
					type: 'get',
	  				url: '${ pageContext.request.contextPath }/edit-item',
	  				cache: false,
	  				data: "id="+ id + "&quantity=" + quantity + "&size_id=" + parseInt(size_id),
	  				success: function(response) {
	  					price.html('')
	  					for(var i = 0; i < response.length; i++) {
	  						if(response[i].size_id === parseInt(size_id) && response[i].product.id === id) {
	  							price.html(response[i].totalPrice.toLocaleString('de-DE') + ' ₫')
	  							break;
	  						}
	  					}
		  				var totalPrice = 0
		  				var totalQuantity = 0
		  				for (var i = 0; i < response.length; i++) {
		  					totalQuantity += response[i].quantity
		  					totalPrice += response[i].totalPrice
		  				}
		  				$('#total_price').html(totalPrice.toLocaleString('de-DE') + ' ₫')
		  				$('#total_quantity').html(totalQuantity)
	  				},
	  				error: function(XMLHttpRequest, textStatus, errorThrown) {
	  				}
				})
			})
			var messages = document.querySelectorAll('.e-message');
		    Array.from(messages).forEach(message => {
		      if(message.innerHTML != null) {
		        setTimeout(function() {
		          message.innerHTML = '';
		        }, 5000)
		      }
		    })
		    var mess_container = document.querySelector('.mess-container')
		    mess_container.onclick = function() {
		      mess_container.classList.remove('d-flex')
		    }
		</script>
	</content>
</body>