<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Thêm mới tài khoản</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-file-text-o"></i> Thêm mới</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="icon_document_alt"></i>Tài khoản</li>
              <li><i class="fa fa-file-text-o"></i>Thêm mới</li>
            </ol>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Thêm tài khoản
              </header>
              <div class="panel-body">
                <form:form action="createaccount" method="post" modelAttribute="newaccount" id="create-form" class="form-horizontal">
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Họ tên</label>
                    <div class="col-sm-10">
                      <form:input path="name" type="text" class="form-control" id="name" placeholder="Họ tên" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Email</label>
                    <div class="col-sm-10">
                      <form:input path="username" type="text" class="form-control" id="username" placeholder="Tên tài khoản" />
                    </div>
                    <div class="col-sm-2"></div>
                    <div style="color:red" class="e-message col-sm-10"></div>
                  </div>
                  <div class="form-group">
                    <label class="col-sm-2 control-label">Mật khẩu</label>
                    <div class="col-sm-10">
                      <form:input path="password" type="password" class="form-control" id="password" placeholder="Mật khẩu" />
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
		          Validator.isRequired('#name'),
		          Validator.isValidName('#name'),
		          Validator.isRequired('#username'),
		          Validator.isEmail('#username'),
		          Validator.isRequired('#password'),
		          Validator.minLength('#password', 6)
		        ]
		      })
      	</script>
      </content>
</body>
