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
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th>Sản phẩm</th>
                            <th>Số lượng</th>
                            <th>Tổng tiền</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:forEach var="item" items="${ billdetails }">
	                        <tr>
	                        	<td class="align-middle">
	                        		<c:forEach var="product" items="${ products }">
	                        			<c:if test="${ product.id == item.product_id }">
	                        				<img src="<c:url value="/assets/img/product/${ product.image }" />" alt="Product" style="width: 50px;"> ${ product.name }
	                        			</c:if>
                        			</c:forEach>
	                        	</td>
	                            <td class="align-middle">${ item.quantity }</td>
	                            <td class="align-middle">
	                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ item.total }" /> ₫
	                            </td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <!-- Cart End -->
</body>