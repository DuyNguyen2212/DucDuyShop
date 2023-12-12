<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/decorator"
	prefix="decorator"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="Creative - Bootstrap 3 Responsive Admin Template">
  <meta name="author" content="GeeksLabs">
  <meta name="keyword" content="Creative, Dashboard, Admin, Template, Theme, Bootstrap, Responsive, Retina, Minimal">
  <link rel="shortcut icon" href="img/favicon.png">

  <title><decorator:title default="DD-Admin"/></title>

  <!-- Bootstrap CSS -->
  <link href="<c:url value="/assets/admin/css/bootstrap.min.css" />" rel="stylesheet">
  <!-- bootstrap theme -->
  <link href="<c:url value="/assets/admin/css/bootstrap-theme.css" />" rel="stylesheet">
  <!--external css-->
  <!-- font icon -->
  <link href="<c:url value="/assets/admin/css/elegant-icons-style.css" />" rel="stylesheet" />
  <link href="<c:url value="/assets/admin/css/font-awesome.min.css" />" rel="stylesheet" />
  <!-- full calendar css-->
  <link href="<c:url value="/assets/admin/assets/fullcalendar/fullcalendar/bootstrap-fullcalendar.css" />" rel="stylesheet" />
  <link href="<c:url value="/assets/admin/assets/fullcalendar/fullcalendar/fullcalendar.css" />" rel="stylesheet" />
  <!-- easy pie chart-->
  <link href="assets/jquery-easy-pie-chart/jquery.easy-pie-chart.css" rel="stylesheet" type="text/css" media="screen" />
  <!-- owl carousel -->
  <link rel="stylesheet" href="css/owl.carousel.css" type="text/css">
  <link href="css/jquery-jvectormap-1.2.2.css" rel="stylesheet">
  <!-- Custom styles -->
  <link rel="stylesheet" href="css/fullcalendar.css">
  <link href="css/widgets.css" rel="stylesheet">
  <link href="<c:url value="/assets/admin/css/style.css" />" rel="stylesheet">
  <link href="<c:url value="/assets/admin/css/style-responsive.css" />" rel="stylesheet" />
  <link href="css/xcharts.min.css" rel=" stylesheet">
  <link href="css/jquery-ui-1.10.4.min.css" rel="stylesheet">
  <!-- =======================================================
    Theme Name: NiceAdmin
    Theme URL: https://bootstrapmade.com/nice-admin-bootstrap-admin-html-template/
    Author: BootstrapMade
    Author URL: https://bootstrapmade.com
  ======================================================= -->
  <style>
.pagination {
  display: inline-block;
}

.pagination a {
  color: black;
  float: left;
  padding: 8px 16px;
  text-decoration: none;
  transition: background-color .3s;
  border: 1px solid #ddd;
}

.pagination a.active {
  background-color: #4CAF50;
  color: white;
  border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {background-color: #ddd;}
</style>
</head>

<body>

	<!-- container section start -->
  <section id="container" class="">


    <header class="header dark-bg">
      <div class="toggle-nav">
        <div class="icon-reorder tooltips" data-original-title="Toggle Navigation" data-placement="bottom"><i class="icon_menu"></i></div>
      </div>

      <!--logo start-->
      <a href="index.html" class="logo">DD <span class="lite">Admin</span></a>
      <!--logo end-->

      <div class="top-nav notification-row">
        <!-- notificatoin dropdown start-->
        <ul class="nav pull-right top-menu">
          <!-- user login dropdown start-->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <span class="profile-ava">
                                <img alt="" src="img/avatar1_small.jpg">
                            </span>
                            <span class="username">${ loginsession.name }</span>
                            <b class="caret"></b>
                        </a>
            <ul class="dropdown-menu extended logout">
              <div class="log-arrow-up"></div>
              <li>
                <a href="<c:url value="/admin/logout" />"><i class="icon_key_alt"></i>Đăng xuất</a>
              </li>
            </ul>
          </li>
          <!-- user login dropdown end -->
        </ul>
        <!-- notificatoin dropdown end-->
      </div>
    </header>
    <!--header end-->

    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse " style="z-index: 999">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu">
          <li class="active">
            <a class="" href="index.html">
                          <i class="icon_house_alt"></i>
                          <span>Dashboard</span>
                      </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;" class="">
                          <i class="icon_document_alt"></i>
                          <span>Quản lý bảng</span>
                          <span class="menu-arrow arrow_carrot-right"></span>
                      </a>
            <ul class="sub">
              <li><a class="" href="<c:url value="/admin/category" />">Danh mục</a></li>
              <li><a class="" href="<c:url value="/admin/company" />">Thương hiệu</a></li>
              <li><a class="" href="<c:url value="/admin/product" />">Sản phẩm</a></li>
              <li><a class="" href="<c:url value="/admin/image" />">Hình ảnh</a></li>
              <li><a class="" href="<c:url value="/admin/size" />">Size</a></li>
              <li><a class="" href="<c:url value="/admin/productsize" />">Size theo sản phẩm</a></li>
              <li><a class="" href="<c:url value="/admin/account" />">Tài khoản</a></li>
              <li><a class="" href="<c:url value="/admin/cart" />">Giỏ hàng</a></li>
              <li><a class="" href="<c:url value="/admin/bill" />">Đơn hàng</a></li>
              <li><a class="" href="<c:url value="/admin/price" />">Giá bán</a></li>
              <li><a class="" href="<c:url value="/admin/slide" />">Slide</a></li>
            </ul>
          </li>

        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->

    <!--main content start-->
    <section id="main-content">
      	
      <decorator:body />
      	
      <!-- <div class="text-right">
        <div class="credits">
          
            All the links in the footer should remain intact.
            You can delete the links only if you purchased the pro version.
            Licensing information: https://bootstrapmade.com/license/
            Purchase the pro version form: https://bootstrapmade.com/buy/?theme=NiceAdmin
         
          Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
        </div>
      </div> -->
    </section>
    <!--main content end-->
  </section>
  <!-- container section start -->

  <!-- javascripts -->
  <script src="<c:url value="/assets/admin/js/jquery.js" />"></script>
  <script src="<c:url value="/assets/admin/js/jquery-ui-1.10.4.min.js" />"></script>
  <script src="<c:url value="/assets/admin/js/jquery-1.8.3.min.js" />"></script>
  <script type="text/javascript" src="<c:url value="/assets/admin/js/jquery-ui-1.9.2.custom.min.js" />"></script>
  <!-- bootstrap -->
  <script src="<c:url value="/assets/admin/js/bootstrap.min.js" />"></script>
  <!-- nice scroll -->
  <script src="<c:url value="/assets/admin/js/jquery.scrollTo.min.js" />"></script>
  <script src="<c:url value="/assets/admin/js/jquery.nicescroll.js" />" type="text/javascript"></script>
  <!-- charts scripts -->
  <script src="<c:url value="/assets/admin/assets/jquery-knob/js/jquery.knob.js" />"></script>
  <script src="<c:url value="/assets/admin/js/jquery.sparkline.js" />" type="text/javascript"></script>
  <script src="<c:url value="/assets/admin/assets/jquery-easy-pie-chart/jquery.easy-pie-chart.js" />"></script>
  <script src="<c:url value="/assets/admin/js/owl.carousel.js" />"></script>
  <!-- jQuery full calendar -->
  <script src="<c:url value="/assets/admin/js/fullcalendar.min.js" />"></script>
    <!-- Full Google Calendar - Calendar -->
    <script src="<c:url value="/assets/admin/assets/fullcalendar/fullcalendar/fullcalendar.js" />"></script>

    <!--custome script for all page-->
    <script src="<c:url value="/assets/admin/js/scripts.js" />"></script>
    
    <script src="<c:url value="/assets/js/validator.js" />"></script>
  
  <decorator:getProperty property="page.script" ></decorator:getProperty>

</body>

</html>