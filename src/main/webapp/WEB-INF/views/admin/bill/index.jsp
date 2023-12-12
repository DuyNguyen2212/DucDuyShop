<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Quản lý hóa đơn</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Hóa đơn</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-table"></i>Quản lý bảng</li>
              <li><i class="fa fa-th-list"></i>Hóa đơn</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
       
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Hóa đơn
              </header>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                  	<th style="text-align: center"></th>
                  	<th style="text-align: center"></th>
                  	<th style="text-align: center"></i></th>
                  	<th style="text-align: center">Trạng thái</th>
                    <th style="text-align: center">Id</th>
                    <th>Họ tên</th>
              		<th>Email</th>
              		<th>Số điện thoại</th>
              		<th>Địa chỉ</th>
              		<th style="min-width: 100px; text-align: center">Số lượng</th>
              		<th style="min-width: 100px">Tổng tiền</th>
              		<th>Ghi chú</th>
              		<th>Ngày tạo</th>
                  </tr>
                  <c:forEach var="item" items="${ pagination }">
                  	<tr>
	                  	<td style="text-align: center;">
              			<c:if test="${ item.status }"><span class="btn btn-success"><i class="icon_check_alt2"></i></span></c:if>
                        <c:if test="${ !item.status }"><a href="<c:url value="/admin/confirm${ item.id }" />">Xác nhận đơn</a></c:if>
              			</td>
              			<td>
              				<c:if test="${ item.status }"></c:if>
              				<c:if test="${ !item.status }"><a class="btn btn-danger" href="<c:url value="/admin/deletebill${ item.id }" />"><i class="icon_close_alt2"></i></a></c:if>
              			</td>
	                    <td><a href="<c:url value="/admin/billdetails${ item.id }" />">Chi tiết</a></td>
	                    <td>
              				<c:if test="${ item.status }"><span style="color: green">Thành công</span></c:if>
                        	<c:if test="${ !item.status }"><span style="color: red">Đang chuyển</span></c:if>
              			</td>
	                    <td style="text-align: center">${ item.id }</td>
	                    <td>
              				<c:forEach var="account" items="${ accounts }">
	              				<c:if test="${ account.username == item.username }">
	              					${ account.name }
              					</c:if>
              				</c:forEach>
              			</td>
              			<td>${ item.username }</td>
	              		<td>${ item.phone }</td>
	              		<td>${ item.address }</td>
	              		<td style="text-align: center">${ item.quantity }</td>
	              		<td>
	              			<fmt:formatNumber type="number" groupingUsed="true" value="${ item.total }" /> ₫
	              		</td>
	              		<td>${ item.note }</td>
	              		<td>${ item.createat }</td>
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
