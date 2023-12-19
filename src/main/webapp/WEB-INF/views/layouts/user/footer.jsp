<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<!-- Footer Start -->
    <div class="container-fluid bg-secondary text-dark mt-5 pt-5">
        <div class="row px-xl-5 pt-5">
            <div class="col-lg-4 col-md-12 mb-5 pr-3 pr-xl-5">
                <a href="" class="text-decoration-none">
                    <h1 class="mb-4 display-5 font-weight-semi-bold"><span class="text-primary font-weight-bold border border-white px-3 mr-1">DD</span>Shop</h1>
                </a>
                <p class="mb-2"><i class="fa fa-map-marker-alt text-primary mr-3"></i>Số 22, Đông Thọ, Yên Phong, Bắc Ninh</p>
                <p class="mb-2"><i class="fa fa-envelope text-primary mr-3"></i>Duygiaosu2212@gmail.com</p>
                <p class="mb-0"><i class="fa fa-phone-alt text-primary mr-3"></i>0352375224</p>
            </div>
            <div class="col-lg-8 col-md-12">
                <div class="row">
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Truy cập nhanh</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="<c:url value="/" />"><i class="fa fa-angle-right mr-2"></i>Trang chủ</a>
                            <a class="text-dark mb-2" href="<c:url value="/all" />"><i class="fa fa-angle-right mr-2"></i>Sản phẩm</a>
                            <a class="text-dark mb-2" href="<c:url value="/contact" />"><i class="fa fa-angle-right mr-2"></i>Liên hệ</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Danh mục</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="<c:url value="/category1" />"><i class="fa fa-angle-right mr-2"></i>Áo khoác</a>
                            <a class="text-dark mb-2" href="<c:url value="/category2" />"><i class="fa fa-angle-right mr-2"></i>Áo phông</a>
                            <a class="text-dark mb-2" href="<c:url value="/category4" />"><i class="fa fa-angle-right mr-2"></i>Chân váy</a>
                            <a class="text-dark mb-2" href="<c:url value="/category5" />"><i class="fa fa-angle-right mr-2"></i>Quần dài</a>
                        </div>
                    </div>
                    <div class="col-md-4 mb-5">
                        <h5 class="font-weight-bold text-dark mb-4">Thương hiệu</h5>
                        <div class="d-flex flex-column justify-content-start">
                            <a class="text-dark mb-2" href="<c:url value="/company1" />"><i class="fa fa-angle-right mr-2"></i>COLETTE</a>
                            <a class="text-dark mb-2" href="<c:url value="/company2" />"><i class="fa fa-angle-right mr-2"></i>ELLE</a>
                            <a class="text-dark mb-2" href="<c:url value="/company3" />"><i class="fa fa-angle-right mr-2"></i>GUCCI</a>
                            <a class="text-dark mb-2" href="<c:url value="/company4" />"><i class="fa fa-angle-right mr-2"></i>LEN</a>
                            <a class="text-dark mb-2" href="<c:url value="/company5" />"><i class="fa fa-angle-right mr-2"></i>LOUIS VUITTON</a>
                            <a class="text-dark mb-2" href="<c:url value="/company6" />"><i class="fa fa-angle-right mr-2"></i>NIKE</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row border-top border-light mx-xl-5 py-4">
            <div class="col-md-6 px-xl-0">
                <p class="mb-md-0 text-center text-md-left text-dark">
                    &copy; <a class="text-dark font-weight-semi-bold" href="#">DD Shop</a>. Tất cả các quyền được bảo lưu. Thiết kế bởi
                    <a class="text-dark font-weight-semi-bold" href="https://htmlcodex.com">HTML Codex</a>
                </p>
            </div>
            <div class="col-md-6 px-xl-0 text-center text-md-right">
                <img class="img-fluid" src="img/payments.png" alt="">
            </div>
        </div>
    </div>
    <!-- Footer End -->