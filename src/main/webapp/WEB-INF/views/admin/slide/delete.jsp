<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Xoá slide</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i>Xóa</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Slide</li>
              <li><i class="fa fa-file-text-o"></i>Xóa</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Xóa slide
              </header>
              <div class="panel-body">
                <form:form action="deleteslide${ deleteslide.id }" method="post" modelAttribute="deleteslide" id="edit-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Id</label>
                    <label class="col-sm-10">
                      ${ deleteslide.id }
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Tiêu đề</label>
                    <label class="col-sm-10">
                      ${ deleteslide.title }
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Nội dung</label>
                    <label class="col-sm-10">
                      ${ deleteslide.content }
                    </label>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Click link</label>
                    <label class="col-sm-10">
                      ${ deleteslide.click }
                    </label>
                  </div>
                  <div class="form-group">
                  	<label class="col-sm-2 control-label">Hình ảnh</label>
                    <div class="col-sm-10">
                    	<div><img id="image" style="max-width: 20%; height: auto" class="img-fluid" src="<c:url value="/assets/img/slide/${ deleteslide.image }" />" alt="Image" /></div>
              			<label>${ deleteslide.image }</label>
                    </div>
                  </div>
                  <div class="form-group">
                  	<div class="col-sm-1"></div>Bạn có muốn xóa ?
                  </div>
                  <div class="form-group">
                  	<div class="col-sm-1">
                    	
                    </div>
                    <div class="col-sm-1">
                    	<a class="btn btn-danger" href="<c:url value="/admin/slide" />">Huỷ</a>
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
