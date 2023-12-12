<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Sửa danh mục</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i>Sửa</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Danh mục</li>
              <li><i class="fa fa-file-text-o"></i>Sửa</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Sửa danh mục
              </header>
              <div class="panel-body">
                <form:form action="editcategory${ editcategory.id }" method="post" modelAttribute="editcategory" id="edit-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tên danh mục</label>
                    <div class="col-sm-10">
                      <form:input path="name" type="text" class="form-control" id="name" placeholder="Tên danh mục" value="${ editcategory.name }" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <button type="submit" class="btn btn-primary">Sửa</button>
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
    	        form: '#edit-form',
    	        formGroupSelector: '.form-group',
    	        errorSelector: '.e-message',
    	        rules: [
    	          Validator.isRequired('#name'),
    	        ]
    	      })
      	</script>
      </content>
</body>
