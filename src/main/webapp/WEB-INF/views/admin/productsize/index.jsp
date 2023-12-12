<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Quản lý size theo sản phẩm</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Size theo sản phẩm</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-table"></i>Quản lý bảng</li>
              <li><i class="fa fa-th-list"></i>Size theo sản phẩm</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
       
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Size theo sản phẩm
              </header>
              <div style="display: flex; align-items: center; padding: 16px">
              	<div>Thêm mới</div>
              	<a style="margin-left: 10px" class="btn btn-primary" href="<c:url value="/admin/createproductsize" />"><i class="icon_plus_alt2"></i></a>
              </div>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                  	<th style="text-align: center"><i class="icon_cogs"></i></th>
                    <th style="text-align: center">Id</th>
                    <th>Sản phẩm</th>
                    <th style="text-align: center">Size</th>
                  </tr>
                  <c:forEach var="item" items="${ pagination }">
                  	<tr>
	                  	<td style="text-align: center">
	                      <div class="btn-group">
	                        <a class="btn btn-success" href="<c:url value="/admin/editproductsize${ item.id }" />"><i class="icon_pencil"></i></a>
	                        <a class="btn btn-danger" href="<c:url value="/admin/deleteproductsize${ item.id }" />"><i class="icon_close_alt2"></i></a>
	                      </div>
	                    </td>
	                    <td style="text-align: center">${ item.id }</td>
	                    <td>
	                    	<c:forEach var="product" items="${ products }">
	                    		<c:if test="${ product.id == item.product_id }">
	                 				${ product.name }
	                    		</c:if>
	                    	</c:forEach>
	                    </td>	
	                    <td style="text-align: center">
	                    	<c:forEach var="size" items="${ sizes }">
	                    		<c:if test="${ size.id == item.size_id }">
	                 				${ size.size }
	                    		</c:if>
	                    	</c:forEach>
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
          		<a href="<c:url value="/admin/productsizeP1" />">&laquo;</a>
          		
          		<c:forEach var="item" begin="1" end="${ paginationinfo.total }" varStatus="itemS">
          			<c:if test="${ itemS.index == paginationinfo.current }">
          				<a href="<c:url value="/admin/productsizeP${ itemS.index }" />" class="active">${ itemS.index }</a>
          			</c:if>
          			<c:if test="${ itemS.index != paginationinfo.current }">
          				<a href="<c:url value="/admin/productsizeP${ itemS.index }" />">${ itemS.index }</a>
          			</c:if>
          			<c:set var="lastindex" value="${ itemS.index }" />
          		</c:forEach>

          		<a href="<c:url value="/admin/productsizeP${ lastindex }" />">&raquo;</a>
        	</div>
        </c:if>
        <!-- page end-->
      </section>
</body>
