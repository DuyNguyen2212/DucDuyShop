<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<title>Liên hệ</title>
<body>

	<!-- Page Header Start -->
    <div class="container-fluid bg-secondary mb-5">
        <div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
            <h1 class="font-weight-semi-bold text-uppercase mb-3">Liên hệ</h1>
            <div class="d-inline-flex">
                <p class="m-0"><a href="">Trang chủ</a></p>
                <p class="m-0 px-2">-</p>
                <p class="m-0">Liên hệ</p>
            </div>
        </div>
    </div>
    <!-- Page Header End -->


    <!-- Contact Start -->
    <div class="container-fluid pt-5">
        <div class="text-center mb-4">
            <h2 class="section-title px-5"><span class="px-2">Mọi thắc mắc vui lòng liên hệ</span></h2>
        </div>
        <div class="row px-xl-5">
            <div class="col-lg-7 mb-5">
                <div class="contact-form">
                    <form:form action="contact" method="post" modelAttribute="contact" id="contactForm">
                        <div class="control-group">
                            <form:input path="name" type="text" class="form-control" id="name" placeholder="Họ tên" />
                            <p class="help-block text-danger"></p>
                            <div class="e-message"></div>
                        </div>
                        <div class="control-group">
                        	<form:input path="email" type="email" class="form-control" name="email" id="email" placeholder="Email" value="${ email }" />
                            <p class="help-block text-danger"></p>
                            <div class="e-message"></div>
                        </div>
                        <div class="control-group">
                            <form:input path="title" type="text" class="form-control" id="subject" placeholder="Tiêu đề" />
                            <p class="help-block text-danger"></p>
                            <div class="e-message"></div>
                        </div>
                        <div class="control-group">
                            <form:textarea path="message" class="form-control" rows="6" id="message" placeholder="Tin nhắn" />
                            <p class="help-block text-danger"></p>
                            <div class="e-message"></div>
                        </div>
                        <div>
                            <button class="btn btn-primary py-2 px-4" type="submit">Gửi</button>
                        </div>
                    </form:form>
                </div>
            </div>
            <div class="col-lg-5 mb-5">
                <h5 class="font-weight-semi-bold mb-3">Liên hệ</h5>
                <p>Mọi thắc mắc xin vui lòng liên hệ với chúng tôi qua email hoặc số điện thoại bên dưỡi. Chúng tôi rất hân hạnh được phục vụ và hỗ trợ quý khách!</p>
                <div class="d-flex flex-column mb-3">
                    <h5 class="font-weight-semi-bold mb-3">Cửa hàng</h5>
                    <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Số 22, Đông Thọ, Yên Phong, Bắc Ninh</p>
                    <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Duygiaosu2212@gmail.com</p>
                    <p class="mb-2"><i class="fa fa-phone-alt text-primary mr-3"></i>0352375224</p>
                </div>
            
            </div>
        </div>
    </div>
    <!-- Contact End -->
      
      <content tag="script">
  	<script>
	  	var mess_container = document.querySelector('.mess-container')
	    mess_container.onclick = function() {
	      mess_container.classList.remove('d-flex')
	    }
	  	Validator({
	        form: '#contactForm',
	        formGroupSelector: '.form-group',
	        errorSelector: '.e-message',
	        rules: [
	          Validator.isRequired('#name'),
		      Validator.isValidName('#name'),
	          Validator.isRequired('#email'),
	          Validator.isEmail('#email'),
	          Validator.isRequired('#subject'),
	          Validator.isRequired('#message')
	        ]
	      })
  	</script>
  </content>
</body>