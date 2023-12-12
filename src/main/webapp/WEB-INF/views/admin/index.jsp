<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Dasboard</title>
<body>
	<section class="wrapper">
        <!--overview start-->
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i> Dashboard</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-laptop"></i>Dashboard</li>
            </ol>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box blue-bg">
              <i class="fa fa-cloud-download"></i>
              <div class="count">
              	<c:set var="p" value="0" />
              	<c:forEach var="item" items="${ purchased }">
              		<c:set var="p" value="${ p + item.total }" />
              	</c:forEach>
              	<fmt:formatNumber type="number" groupingUsed="true" value="${ p }" /> ₫
              </div>
              <div class="title">Tổng thu nhập</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box brown-bg">
              <i class="fa fa-shopping-cart"></i>
              <div class="count">${ bills.size() }</div>
              <div class="title">Đơn hàng</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box dark-bg">
              <div><i class="fa fa-thumbs-o-up"></i></div>
              <div class="count">${ purchased.size() }</div>
              <div class="title">Đã bán</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

          <div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
            <div class="info-box green-bg">
              <i class="fa fa-cubes"></i>
              <div class="count">${ products.size() }</div>
              <div class="title">Sản phẩm</div>
            </div>
            <!--/.info-box-->
          </div>
          <!--/.col-->

        </div>
        <!--/.row-->

      </section>
     
     <content tag="script">
     	<script>
     		$('#days').bind('keyup mouseup', function(){
     			var days = $(this).val()
     			console.log(typeof days)
     			if(days <= 0 || days === '') {
     				$('.e-message').html('Số ngày > 0')
     				setTimeout(function() {
     					$('.e-message').html('')
     				}, 3000)
     			}
     			else {
     				$.ajax({
     					type: 'get',
    	  				url: '${ pageContext.request.contextPath }/admin/modifyday',
    	  				cache: false,
    	  				data: "days=" + days,
    	  				success: function(response) {
    	  					console.log(response)
    	  					var object = JSON.parse(response)
    	  					$('#revenue').html(object.revenue.toLocaleString('de-DE') + ' ₫')
    	  					$('#quantity').html(object.soldproducts)
    	  					$('#days').html(object.days)
    	  				}
     				})
     			}
     		})
     	</script>
     </content>
</body>
