<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Sửa slide</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i>Sửa</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Slide</li>
              <li><i class="fa fa-file-text-o"></i>Sửa</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Sửa slide
              </header>
              <div class="panel-body">
                <form:form action="editslide${ editslide.id }" method="post" modelAttribute="editslide" enctype="multipart/form-data" id="edit-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tiêu đề</label>
                    <div class="col-sm-10">
                      <form:input path="title" type="text" class="form-control" id="title" placeholder="Tiêu đề" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Nội dung</label>
                    <div class="col-sm-10">
                      <form:input path="content" type="text" class="form-control" id="content" placeholder="Nội dung" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Click link</label>
                    <div class="col-sm-10">
                      <form:input path="click" type="text" class="form-control" id="click" placeholder="Click link" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
              		<label for="imageupload" class="col-sm-2 control-label">Hình ảnh</label>
              		<div class="col-sm-10">
              			<div><img id="image" style="max-width: 20%; height: auto" src="<c:url value="/assets/img/slide/${ item.image }" />" alt="Image" /></div>
              			<input type="file" class="form-control-file" name="imageupload" id="imageupload" onchange=loadFile(event) />
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
	      	var loadFile = function(event) {
	  			var image = document.getElementById('image')
	  			image.src = URL.createObjectURL(event.target.files[0]);
	  		}
	      	Validator({
    	        form: '#create-form',
    	        formGroupSelector: '.form-group',
    	        errorSelector: '.e-message',
    	        rules: [
    	          Validator.isRequired('#title'),
    	          Validator.isRequired('#content'),
    	          Validator.isRequired('#click'),
    	          Validator.isRequired('#imageupload')
    	        ]
	      	})
      	</script>
      </content>
</body>
