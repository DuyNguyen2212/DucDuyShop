<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Xoá sản phẩm</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i>Xóa</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Sản phẩm</li>
              <li><i class="fa fa-file-text-o"></i>Xóa</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Xóa sản phẩm
              </header>
              <div class="panel-body">
                <form:form action="deleteproduct${ deleteproduct.id }" method="post" modelAttribute="deleteproduct" id="edit-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Id</label>
                    <label class="col-sm-10">
                      ${ deleteproduct.id }
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Danh mục</label>
                    <label class="col-sm-10">
                    	<c:forEach var="item" items="${ categories }">
                    	<c:if test="${ item.id == deleteproduct.category_id }">
              				${ item.name }
              			</c:if>
              			</c:forEach>
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Thương hiệu</label>
                    <label class="col-sm-10">
                    	<c:forEach var="item" items="${ companies }">
              			<c:if test="${ item.id == deleteproduct.company_id }">
              				${ item.name }
	              		</c:if>
	              		</c:forEach>
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tên sản phẩm</label>
                    <label class="col-sm-10">
                      ${ deleteproduct.name }
                    </label>
                  </div>
                  <div class="form-group">
                  	<label class="col-sm-2 control-label">Hình ảnh</label>
                    <div class="col-sm-10">
                    	<div><img id="image" style="max-width: 20%; height: auto" class="img-fluid" src="<c:url value="/assets/img/product/${ deleteproduct.image }" />" alt="Image" /></div>
              			<label>${ deleteproduct.image }</label>
                    </div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tóm tắt</label>
                    <label class="col-sm-10">
                      ${ deleteproduct.brief }
                    </label>
                  </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">Chất liệu</label>
                    <label class="col-sm-10">
                      ${ deleteproduct.material }
                    </label>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">Số lượng</label>
                    <label class="col-sm-10">
                      ${ deleteproduct.quantity }
                    </label>
                    </div>
                    <div class="form-group">
                    <label class="col-sm-2 control-label">Giá bán</label>
                    <label class="col-sm-10">
                      <fmt:formatNumber type="number" groupingUsed="true" value="${ deleteproduct.price }" /> ₫
                    </label>
                    </div>
                    <div class="form-group">
	                    <label class="col-sm-2 control-label">Mô tả</label>
	                    <label class="col-sm-10">
	                      ${ deleteproduct.description }
	                    </label>
                    </div>
                    <div class="form-group">
	                    <label class="col-sm-2 control-label">Giảm giá</label>
	                    <label class="col-sm-10">
	                      ${ deleteproduct.sale_off }
	                    </label>
                    </div>
                    <div class="form-group">
	                    <label class="col-sm-2 control-label">Mới</label>
	                    <label class="col-sm-10">
	                      ${ deleteproduct.is_new }
	                    </label>
                    </div>
                    <div class="form-group">
	                    <label class="col-sm-2 control-label">Bán chạy</label>
	                    <label class="col-sm-10">
	                      ${ deleteproduct.is_topsell }
	                    </label>
                    </div>
                    <div class="form-group">
	                    <label class="col-sm-2 control-label">Ngày tạo</label>
	                    <label class="col-sm-10">
	                      ${ deleteproduct.createat }
	                    </label>
                    </div>
                  <div class="form-group">
                  	<div class="col-sm-1"></div>Bạn có muốn xóa ?
                  </div>
                  <div class="form-group">
                  	<div class="col-sm-1">
                    	
                    </div>
                    <div class="col-sm-1">
                    	<a class="btn btn-danger" href="<c:url value="/admin/product" />">Huỷ</a>
                    </div>
                    <div class="col-sm-1">    
		                <button type="submit" class="btn btn-primary">Xóa</button>
                    </div>
                  </div>
                </form:form>
              </div>
            </section>
            
          </div>
        </div>
        <!-- Basic Forms & Horizontal Forms-->
        <!-- page end-->
      </section>
</body>
