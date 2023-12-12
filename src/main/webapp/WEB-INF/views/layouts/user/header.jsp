<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<!-- Topbar Start -->
    <div class="container-fluid">
        <div class="row bg-secondary py-2 px-xl-5">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark" href="">FAQs</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Giúp đỡ</a>
                    <span class="text-muted px-2">|</span>
                    <a class="text-dark" href="">Hỗ trợ</a>
                </div>
            </div>
            <div class="col-lg-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a href="<c:url value="/" />" class="text-decoration-none">
                    <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">DD</span>Shop</h1>
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left">
                <form:form action="/ducduyshop/search" modelAttribute="searchobject">
                    <div class="input-group">
                        <form:input path="name" type="text" class="form-control" placeholder="Tìm kiếm..." />
                        <div class="input-group-append">
                            <span class="input-group-text bg-transparent text-primary">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form:form>
            </div>
            <div class="col-lg-3 col-6 text-right">
            	<c:if test="${ not empty loginsession }">
	                <a href="<c:url value="/cart" />" class="btn border">
	                    <i class="fas fa-shopping-cart text-primary"></i>
	                    <span id="cart_size" class="badge">
	                    	<c:if test="${ cart.size() > 0 }">${ cart.size() }</c:if>
	                    	<c:if test="${ cart.size() <= 0 }">0</c:if>
	                    </span>
	                </a>
            	</c:if>
            	
            	<c:if test="${ empty loginsession }">
	                <a href="<c:url value="/login" />" class="btn border">
	                    <i class="fas fa-shopping-cart text-primary"></i>
	                    <span class="badge">0</span>
	                </a>
            	</c:if>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <c:if test="${ not empty homepage}">
    	<div class="container-fluid mb-5">
    </c:if>
    <c:if test="${ empty homepage }">
    	<div class="container-fluid">
    </c:if>
        <div class="row border-top px-xl-5">
            <div class="col-lg-3 d-none d-lg-block">
                <a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
                    <h6 class="m-0">Danh mục</h6>
                    <i class="fa fa-angle-down text-dark"></i>
                </a>
                <c:if test="${ not empty homepage}">
                <nav class="collapse show navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0" id="navbar-vertical">		
    			</c:if>
    			<c:if test="${ empty homepage }">
    			<nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
    			</c:if>
                    <div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
                    	<a href="<c:url value="/all" />" class="nav-item nav-link">Tất cả sản phẩm</a>
           				<c:forEach var="category" items="${ categories }">
	                        <a href="<c:url value="/category/${ category.id }" />" class="nav-item nav-link">${ category.name }</a>
           				</c:forEach>
                    </div>
                </nav>
            </div>
            <div class="col-lg-9">
                <nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
                    <a href="" class="text-decoration-none d-block d-lg-none">
                        <h1 class="m-0 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border px-3 mr-1">E</span>Shopper</h1>
                    </a>
                    <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
                        <div class="navbar-nav mr-auto py-0">
                            <a href="<c:url value="/" />" class="nav-item nav-link active">Trang chủ</a>
                            <a href="<c:url value="/all" />" class="nav-item nav-link">Sản phẩm</a>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">Thương hiệu</a>
                                <div class="dropdown-menu rounded-0 m-0">
                                	<c:forEach var="company" items="${ companies }">
	                                    <a href="<c:url value="/company/${ company.id }" />" class="dropdown-item">${ company.name }</a>
                                	</c:forEach>
                                </div>
                            </div>
                            <a href="<c:url value="/contact" />" class="nav-item nav-link">Liên hệ</a>
                        </div>
                        <div class="navbar-nav ml-auto py-0">
                        	<c:if test="${ empty loginsession }">
	                            <a href="<c:url value="/login" />" class="nav-item nav-link">Đăng nhập</a>
	                            <a href="<c:url value="/signup" />" class="nav-item nav-link">Đăng ký</a>     	
                        	</c:if>
                        	<c:if test="${ not empty loginsession }">
                        		<div class="nav-item dropdown">
	                                <a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">${ loginsession.name }</a>
	                                <div class="dropdown-menu rounded-0 m-0">
	                                	<c:if test="${ rolesession == 'admin, user' }">
	                            			<a href="<c:url value="/admin" />" class="nav-item nav-link">DD Admin</a>
	                            		</c:if>
		                            	<c:if test="${ rolesession == 'user' }">
		                            		<a href="<c:url value="/bill" />" class="nav-item nav-link">Đơn hàng của bạn</a>
		                            	</c:if>
		                            	<a href="<c:url value="/changepass" />" class="nav-item nav-link">Đổi mật khẩu</a> 
	                            		<a href="<c:url value="/logout" />" class="nav-item nav-link">Đăng xuất</a> 
	                                </div>
                            	</div>  	
                        	</c:if>
                        </div>
                    </div>
                </nav>
                <c:if test="${ not empty homepage }">
                	<div id="header-carousel" class="carousel slide" data-ride="carousel">
                    <div class="carousel-inner">
                    	<c:forEach var="slide" items="${ slides }" varStatus="slideIndex">
                    		<c:if test="${ slideIndex.index == 0 }">
	                        <div class="carousel-item active" style="height: 410px;">		
                    		</c:if>
                    		<c:if test="${ slideIndex.index != 0 }">
	                        <div class="carousel-item" style="height: 410px;">		
                    		</c:if>
	                            <img class="img-fluid" src='<c:url value="/assets/img/slide/${ slide.image }" />' alt="Image">
	                            <div class="carousel-caption d-flex flex-column align-items-center justify-content-center">
	                                <div class="p-3" style="max-width: 700px;">
	                                    <h4 class="text-light text-uppercase font-weight-medium mb-3">${ slide.title }</h4>
	                                    <h3 class="display-4 text-white font-weight-semi-bold mb-4">${ slide.content }</h3>
	                                    <a href="<c:url value="${ slide.click }" />" class="btn btn-light py-2 px-3">Mua ngay</a>
	                                </div>
	                            </div>
	                        </div>	
                    	</c:forEach>
                    </div>
                    <a class="carousel-control-prev" href="#header-carousel" data-slide="prev">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-prev-icon mb-n2"></span>
                        </div>
                    </a>
                    <a class="carousel-control-next" href="#header-carousel" data-slide="next">
                        <div class="btn btn-dark" style="width: 45px; height: 45px;">
                            <span class="carousel-control-next-icon mb-n2"></span>
                        </div>
                    </a>
                </c:if>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar End -->