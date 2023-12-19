<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp"%>

<title>Đăng nhập</title>
<body>
	<div class="register-photo">
		<div class="form-container">
			<div class="image-holder" style="background: url(<c:url value="/assets/img/logimage.jpg" />); background-size: cover"></div>
			<form:form action="login" method="post" modelAttribute="loginaccount"
				id="login-form">
				<h1 class="text-center"><a style="text-decoration: none; color: #e85d90" href="<c:url value="/" />">DD Shop</a></h1>
				<h2 class="text-center">
					<strong>Đăng nhập</strong>
				</h2>
				<div class="form-group">
					<form:input path="username" class="form-control" id="username" type="email"
						name="email" placeholder="Email" />
					<div style="color:red" class="e-message">
						<c:if test="${ not empty isexist }">
                               Tài khoản không chính xác !
                        </c:if>
					</div>
				</div>
				<div class="form-group">
					<form:input path="password" class="form-control" id="password" type="password"
						name="password" placeholder="Mật khẩu" />
					<div style="color:red" class="e-message">
						<c:if test="${ not empty iscorrect }">
                                	Mật khẩu không chính xác !
                        	</c:if>
					</div>
				</div>
				<div class="form-group">
					<button class="btn btn-primary btn-block" type="submit">Đăng
						nhập</button>
				</div>
				<a style="color: #056cc0" href="<c:url value="/signup" />" class="already">Bạn chưa có
					tài khoản? Đăng ký</a>
			</form:form>
		</div>
	</div>
	</section>

	<content tag="script"> <script>
		Validator({
			form : '#login-form',
			formGroupSelector : '.form-group',
			errorSelector : '.e-message',
			rules : [ Validator.isRequired('#username'),
					Validator.isEmail('#username'),
					Validator.isRequired('#password') ]
		})
	</script> </content>
</body>