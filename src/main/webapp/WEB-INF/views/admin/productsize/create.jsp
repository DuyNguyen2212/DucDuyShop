<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Thêm mới size theo sản phẩm</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i> Thêm mới</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Size theo sản phẩm</li>
              <li><i class="fa fa-file-text-o"></i>Thêm mới</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Thêm size theo sản phẩm
              </header>
              <div class="panel-body">
                <form:form action="createproductsize" method="post" modelAttribute="newproductsize" id="create-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Sản phẩm</label>
                    <div class="col-sm-10">
                    	<form:select path="product_id" id="product">
              				<option value="-1" selected>---Sản phẩm---</option>
              				<c:forEach var="item" items="${ products }">
              					<form:option value="${ item.id }" label="${ item.name }" />
              				</c:forEach>
              			</form:select>
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Size</label>
                    <div class="col-sm-10">
                    	<form:select path="size_id" id="size">
              				<option value="-1" selected>---Size---</option>
              				<c:forEach var="item" items="${ sizes }">
              				<form:option value="${ item.id }" label="${ item.size }" />
              				</c:forEach>
              			</form:select>
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
      		Validator({
    	        form: '#create-form',
    	        formGroupSelector: '.form-group',
    	        errorSelector: '.e-message',
    	        rules: [
    	        	Validator.isRequired('#product'),
    		        Validator.isRequired('#size')
    	        ]
    	      })
      	</script>
      </content>
</body>
