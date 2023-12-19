<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp"%>

<title>Đăng ký</title>
</head>
<body>
	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder" style="background: url(<c:url value="/assets/img/logimage.jpg" />); background-size: cover"></div>
			
			<form:form action="signup" method="POST" modelAttribute="newaccount" id="sign-up-form">
				<h1 class="text-center"><a style="text-decoration: none; color: #e85d90" href="<c:url value="/" />">DD Shop</a></h1>
				<h2 class="text-center">
					<strong>Đăng ký</strong>
				</h2>
				<div class="form-group">
					<form:input path="name" class="form-control" type="text" id="name" name="name"
						placeholder="Họ tên" />
					<div style="color:red" class="e-message"></div>
				</div>
				<div class="form-group">
					<form:input path="username" class="form-control" id="email" type="email" name="email"
						placeholder="Email" />
						<div style="color:red" class="e-message">
                    	<c:if test="${ not empty isexist }">
                    		Tài khoản đã tồn tại !
                    	</c:if>
                    	</div>
				</div>
				<div class="form-group">
					<form:input path="password" class="form-control" id="password" type="password" name="password"
						placeholder="Mật khẩu" /> 
					<div style="color:red" class="e-message"></div>
				</div>
				<div class="form-group">
					<input class="form-control" type="password" id="re_password" name="password-repeat"
						placeholder="Nhập lại mật khẩu">
					<div style="color:red" class="e-message"></div>
				</div>
				<div class="form-group">
                    	<div style="color:red" class="e-message">
                    	<c:if test="${ not empty error }">
                    		Lỗi tạo tài khoản ${ error }
                    	</c:if>
                    	</div>
                </div>
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">Đăng ký</button>
				</div>
				<a style="color: #056cc0" href="<c:url value="/login" />" class="already">Bạn đã có tài khoản? Đăng nhập</a>
			</form:form>
		</div>
	</div>
	
	<c:if test="${ not empty issuccess }">
  		<div class="mess-container d-flex">
    		<div class="mess-box">
      			<label class="mess-success">Đăng ký thành công !</label>
      			<a class="btn btn-primary btn-block" href="<c:url value="/login" />" class="login-link">Đăng nhập</a>
    		</div>
    		<input id="check" type="hidden" value="text"  />
  		</div>
  	</c:if>

	<content tag="script"> 
	<script>
		Validator({
			form : '#sign-up-form',
			formGroupSelector : '.form-group',
			errorSelector : '.e-message',
			rules : [
					Validator.isRequired('#name'),
					Validator.isValidName('#name'),
					Validator.isRequired('#email'),
					Validator.isEmail('#email'),
					Validator.isRequired('#password'),
					Validator.minLength('#password', 6),
					Validator.isRequired('#re_password'),
					Validator.isConfirmed('#re_password', function() {
						return document
								.querySelector('#sign-up-form #password').value
					}, 'Mật khẩu nhập lại không chính xác!') ]
		})
	</script> 
	</content>
	
</body>