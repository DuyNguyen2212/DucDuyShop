<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>Thanh toán</title>
<body>
	<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Home</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Checkout</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Checkout Start -->
    <div class="container-fluid pt-5">
        <form:form action="checkout" method="post" modelAttribute="bill" id="checkout-form" class="row px-xl-5">
            <div class="col-lg-8">
                <div class="mb-4">
                    <h4 class="font-weight-semi-bold mb-4">Đặt hàng</h4>
                    <div class="row">
                        <div class="col-md-12 form-group">
                            <label>E-mail</label>
                            <form:input path="username" class="form-control" id="email" type="email" placeholder="example@email.com" />
                        	<div class="e-message"></div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Điện thoại</label>
                            <form:input path="phone" id="phone" class="form-control" type="text" placeholder="Số điện thoại" />
                        	<div class="e-message"></div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Địa chỉ</label>
                            <form:input path="address" id="address" class="form-control" type="text" placeholder="Địa chỉ" />
                        	<div class="e-message"></div>
                        </div>
                        <div class="col-md-12 form-group">
                            <label>Ghi chú</label>
                            <form:input path="note" class="form-control" type="text" placeholder="Ghi chú..." />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Tổng đơn hàng</h4>
                    </div>
                    <div class="card-body">
                        <div class="d-flex justify-content-between">
                            <h6 class="font-weight-medium">Sản phẩm</h6>
                            <h6 class="font-weight-medium">${ totalQuantity }</h6>
                        </div>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <div class="d-flex justify-content-between mt-2">
                            <h5 class="font-weight-bold">Tổng tiền</h5>
                            <h5 class="font-weight-bold">
                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ totalPrice }" /> ₫
                            </h5>
                        </div>
                    </div>
                </div>
                <div class="card border-secondary mb-5">
                    <div class="card-header bg-secondary border-0">
                        <h4 class="font-weight-semi-bold m-0">Thanh toán</h4>
                    </div>
                    <div class="card-footer border-secondary bg-transparent">
                        <button type="submit" class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3">Đặt hàng</button>
                    </div>
                </div>
            </div>
        </form:form>
    </div>
    <!-- Checkout End -->
  </main>
  
  <content tag="script">
      	<script>
      		Validator({
    	        form: '#checkout-form',
    	        formGroupSelector: '.form-group',
    	        errorSelector: '.e-message',
    	        rules: [
    	          Validator.isRequired('#phone'),
    	          Validator.isPhoneNumber('#phone'),
    	          Validator.isRequired('#email'),
    	          Validator.isEmail('#email'),
    	          Validator.isRequired('#address')
    	        ]
    	      })
      	</script>
      </content>
</body>