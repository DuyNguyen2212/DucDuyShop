<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Quản lý sản phẩm</title>
<body>
	<section style="width: auto" class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Sản phẩm</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-table"></i>Quản lý bảng</li>
              <li><i class="fa fa-th-list"></i>Sản phẩm</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
       
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Sản phẩm
              </header>
              <div style="display: flex; align-items: center; padding: 16px">
              	<div>Thêm mới</div>
              	<a style="margin-left: 10px" class="btn btn-primary" href="<c:url value="/admin/createproduct" />"><i class="icon_plus_alt2"></i></a>
              </div>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                  	<th style="text-align: center; min-width: 95px"><i class="icon_cogs"></i></th>
                    <th style="text-align: center; min-width: 100px">Mã sản phẩm</th>
                    <th style="min-width: 80px">Danh mục</th>
                    <th style="min-width: 100px">Thương hiệu</th>
                    <th style="min-width: 105px">Tên sản phẩm</th>
                    <th style="min-width: 75px">Hình ảnh</th>
                    <th style="min-width: 100px">Tóm tắt</th>
                    <th style="min-width: 75px">Chất liệu</th>
                    <th style="min-width: 75px">Số lượng</th>
                    <th style="min-width: 150px">Giá bán</th>
                    <th style="min-width: 150px">Mô tả</th>
                    <th style="min-width: 75px">Giảm giá</th>
                    <th>Mới</th>
                    <th style="min-width: 75px">Bán chạy</th>
                    <th style="min-width: 95px">Ngày tạo</th>
                  </tr>
                  <c:forEach var="item" items="${ pagination }">
                  	<tr>
	                  	<td style="text-align: center">
	                      <div class="btn-group">
	                        <a class="btn btn-success" href="<c:url value="/admin/editproduct${ item.id }" />"><i class="icon_pencil"></i></a>
	                        <a class="btn btn-danger" href="<c:url value="/admin/deleteproduct${ item.id }" />"><i class="icon_close_alt2"></i></a>
	                      </div>
	                    </td>
	                    <td style="text-align: center">${ item.id }</td>
	                    <c:forEach var="category" items="${ categories }">
              				<c:if test="${ category.id == item.category_id }">
              					<td>${ category.name }</td>
              				</c:if>	
              			</c:forEach>
              			<c:forEach var="company" items="${ companies }">
              				<c:if test="${ company.id == item.company_id }">
              					<td>${ company.name }</td>
              				</c:if>	
              			</c:forEach>
	                    <td>${ item.name }</td>	
	                    <td><img style="width: 50px" src="<c:url value="/assets/img/product/${ item.image }" />" /></td>
	                	<td style="max-width: 150px; overflow: hidden">${ item.brief }</td>	
	                	<td>${ item.material }</td>	
	                	<td style="text-align: center">${ item.quantity }</td>	
	                	<td>
	                		<fmt:formatNumber type="number" groupingUsed="true" value="${ item.price }" /> ₫
	                	</td>
	                	<td style="max-width: 170px; overflow: hidden">${ item.description }</td>
	                	<td style="text-align: center">${ item.sale_off } %</td>
	                	<td>${ item.is_new }</td>
	                	<td>${ item.is_topsell }</td>	
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
          		<a href="<c:url value="/admin/productP1" />">&laquo;</a>
          		
          		<c:forEach var="item" begin="1" end="${ paginationinfo.total }" varStatus="itemS">
          			<c:if test="${ itemS.index == paginationinfo.current }">
          				<a href="<c:url value="/admin/productP${ itemS.index }" />" class="active">${ itemS.index }</a>
          			</c:if>
          			<c:if test="${ itemS.index != paginationinfo.current }">
          				<a href="<c:url value="/admin/productP${ itemS.index }" />">${ itemS.index }</a>
          			</c:if>
          			<c:set var="lastindex" value="${ itemS.index }" />
          		</c:forEach>

          		<a href="<c:url value="/admin/productP${ lastindex }" />">&raquo;</a>
        	</div>
        </c:if>
        <!-- page end-->
      </section>
</body>
