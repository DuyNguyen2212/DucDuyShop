<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Thêm mới sản phẩm</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i> Thêm mới</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Sản phẩm</li>
              <li><i class="fa fa-file-text-o"></i>Thêm mới</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Thêm sản phẩm
              </header>
              <div class="panel-body">
                <form:form action="createproduct" method="post" modelAttribute="newproduct" enctype="multipart/from-data" id="create-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Danh mục</label>
                    <div class="col-sm-10">
                    	<form:select path="category_id" id="category">
              				<option value="-1" selected>---Danh mục---</option>
              				<c:forEach var="item" items="${ categories }">
              				<form:option value="${ item.id }" label="${ item.name }" />
              				</c:forEach>
              			</form:select>
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Thương hiệu</label>
                    <div class="col-sm-10">
                    	<form:select path="company_id" id="company">
              				<option value="" selected>---Thương hiệu---</option>
              				<c:forEach var="item" items="${ companies }">
              				<form:option value="${ item.id }" label="${ item.name }" />
              				</c:forEach>
              			</form:select>
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tên sản phẩm</label>
                    <div class="col-sm-10">
                      <form:input path="name" type="text" class="form-control" id="name" placeholder="Tên sản phẩm" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
              		<label for="imageupload" class="col-sm-2 control-label">Hình ảnh</label>
              		<div class="col-sm-10">
              			<div><img id="image" style="max-width: 20%; height: auto" src="<c:url value="/assets/img/no_image.png" />" alt="Image" /></div>
              			<input type="file" class="form-control-file" name="imageupload" id="imageupload" onchange=loadFile(event) />
              		</div>
              		<div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
            	</div>
            	<div class="form-group">
                    <label class="col-sm-2 control-label">Tóm tắt</label>
                    <div class="col-sm-10">
                      <form:input path="brief" type="text" class="form-control" id="brief" placeholder="Tóm tắt" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Chất liệu</label>
                    <div class="col-sm-10">
                      <form:input path="material" type="text" class="form-control" id="material" placeholder="Chất liệu" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Số lượng</label>
                    <div class="col-sm-10">
                      <form:input path="quantity" type="text" class="form-control" id="quantity" placeholder="Số lượng" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Giá bán</label>
                    <div class="col-sm-10">
                      <form:input path="price" type="text" class="form-control" id="price" placeholder="Giá bán" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Mô tả</label>
                    <div class="col-sm-10">
                      <form:input path="description" type="text" class="form-control" id="description" placeholder="Mô tả" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                 <div class="form-group">
                    <label class="col-sm-2 control-label">Giảm giá</label>
                    <div class="col-sm-10">
                      <form:input path="sale_off" type="text" class="form-control" id="saleoff" placeholder="Giảm giá" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                 </div>
                  <button type="submit" class="btn btn-primary">Thêm mới</button>
                </form:form>
              </div>
            </section>
            
          </div>
        </div>
        <!-- Basic Forms & Horizontal Forms-->
        <!-- page end-->
      </section>
      
      <content tag="script">
      	<script>
      	var loadFile = function(event) {
  			var image = document.getElementById('image')
  			image.src = URL.createObjectURL(event.target.files[0]);
  		}
  		Validator({
	        form: '#create-form',
	        formGroupSelector: '.form-group',
	        errorSelector: '.e-message',
	        rules: [
	          Validator.isRequired('#category'),
	          Validator.isRequired('#company'),
	          Validator.isRequired('#name'),
	          Validator.isRequired('#imageupload'),
	          Validator.isRequired('#brief'),
	          Validator.isRequired('#material'),
	          Validator.isRequired('#quantity'),
	          Validator.isIntegerNumber('#quantity'),
	          Validator.isRequired('#price'),
	          Validator.isFloatNumber('#price'),
	          Validator.isRequired('#description'),
	          Validator.isRequired('#price'),
	          Validator.isRequired('#saleoff'),
	          Validator.isIntegerNumber('#saleoff'),
	          Validator.isSaleOffValue('#saleoff')
	        ]
	      })
      	</script>
      </content>
</body>
