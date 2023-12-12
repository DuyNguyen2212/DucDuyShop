<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Chi tiết Chi tiết hóa đơn</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Chi tiết hóa đơn</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-table"></i>Hóa đơn</li>
              <li><i class="fa fa-th-list"></i>Chi tiết hóa đơn</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
       
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Chi tiết hóa đơn
              </header>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                    <th style="text-align: center">Id</th>
                    <th>Sản phẩm</th>
              		<th>Hình ảnh</th>
              		<th>Số lượng</th>
              		<th>Tổng tiền </th>
                  </tr>
                  <c:forEach var="item" items="${ billdetails }">
                  	<tr>
	                  	<td style="text-align: center">${ item.id }</td>
	              		<td>
	              		<c:forEach var="product" items="${ products }">
	              			<c:if test="${ product.id == item.product_id }">
	              				${ product.name }
	              			</c:if>
	              		</c:forEach>
	              		</td>
	              		<td>
	              		<c:forEach var="product" items="${ products }">
	              			<c:if test="${ product.id == item.product_id }">
	              				<img style="width: 50px" src="<c:url value="/assets/img/product/${ product.image }" />" />
	              			</c:if>
	              		</c:forEach>
	              		</td>
	              		<td>${ item.quantity }</td>
	              		<td>
	              			<fmt:formatNumber type="number" groupingUsed="true" value="${ item.total }" /> ₫
	              		</td>
	                </tr>
                  </c:forEach>
                </tbody>
              </table>
            </section>
          </div>
        </div>
        <c:if test="${ totaldata > 7 }">
        	<div class="pagination">
          		<a href="<c:url value="/admin/billP1" />">&laquo;</a>
          		
          		<c:forEach var="item" begin="1" end="${ paginationinfo.total }" varStatus="itemS">
          			<c:if test="${ itemS.index == paginationinfo.current }">
          				<a href="<c:url value="/admin/billP${ itemS.index }" />" class="active">${ itemS.index }</a>
          			</c:if>
          			<c:if test="${ itemS.index != paginationinfo.current }">
          				<a href="<c:url value="/admin/billP${ itemS.index }" />">${ itemS.index }</a>
          			</c:if>
          			<c:set var="lastindex" value="${ itemS.index }" />
          		</c:forEach>

          		<a href="<c:url value="/admin/billP${ lastindex }" />">&raquo;</a>
        	</div>
        </c:if>
        <!-- page end-->
      </section>
</body>
