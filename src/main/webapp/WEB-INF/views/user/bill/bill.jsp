<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>Đơn hàng của bạn</title>
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
        	<c:if test="${ empty bills }">
            	<div class="col-lg-12 text-center">
            		<div>Đơn hàng trống</div>
                </div>
            </c:if>
            
            <c:if test="${ not empty bills }">
            <div class="col-lg-12 table-responsive mb-5">
                <table class="table table-bordered text-center mb-0">
                    <thead class="bg-secondary text-dark">
                        <tr>
                            <th></th>
                            <th style="min-width: 80px"></th>
                            <th style="min-width: 135px">Trạng thái</th>
                            <th style="min-width: 70px">Id</th>
                            <th>Email</th>
                            <th>Điện thoại</th>
                            <th style="max-width: 200px;">Địa chỉ</th>
                            <th style="min-width: 100px">Số lượng</th>
                            <th style="min-width: 100px">Tổng tiền</th>
                            <th style="min-width: 120px">Ngày tạo</th>
                        </tr>
                    </thead>
                    <tbody class="align-middle">
                    	<c:forEach var="bill" items="${ bills }">
	                        <tr>
	                            <td class="align-middle">
	                            	<c:if test="${ !bill.status }"><a href="<c:url value="/deletebill${ bill.id }" />">Hủy</a></c:if>	
	                            </td>
	                            <td class="align-middle">
	                            	<a href="<c:url value="/billdetails/${ bill.id }" />">Chi tiết</a>
	                            </td>
	                            <td class="align-middle">
	                            	<c:if test="${ bill.status }"><span style="color: green">Thành công</span></c:if>
                        			<c:if test="${ !bill.status }"><span style="color: red">Đang chuyển</span></c:if>
	                            </td>
	                            <td class="align-middle">${ bill.id }</td>
	                            <td class="align-middle">${ bill.username }</td>
	                            <td class="align-middle">${ bill.phone }</td>
	                            <td style="max-width: 200px; overflow: hidden;" class="align-middle">${ bill.address }</td>
	                            <td class="align-middle">${ bill.quantity }</td>
	                            <td class="align-middle">
	                            	<fmt:formatNumber type="number" groupingUsed="true" value="${ bill.total }" /> ₫
	                            </td>
	                            <td class="align-middle">${ bill.createat }</td>
	                        </tr>
                    	</c:forEach>
                    </tbody>
                </table>
            </div>
            </c:if>
        </div>
    </div>
    <!-- Cart End -->
</body>