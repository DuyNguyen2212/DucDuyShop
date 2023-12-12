<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/all/taglib.jsp" %>    
    
<title>Quản lý slide</title>
<body>
	<section class="wrapper">
        <div class="row">
          <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-table"></i>Slide</h3>
            <ol class="breadcrumb">
              <li><i class="fa fa-home"></i><a href="<c:url value="/admin" />">Trang chủ</a></li>
              <li><i class="fa fa-table"></i>Quản lý bảng</li>
              <li><i class="fa fa-th-list"></i>Slide</li>
            </ol>
          </div>
        </div>
        <!-- page start-->
       
        <div class="row">
          <div class="col-lg-12">
            <section class="panel">
              <header class="panel-heading">
                Slide
              </header>
              <div style="display: flex; align-items: center; padding: 16px">
              	<div>Thêm mới</div>
              	<a style="margin-left: 10px" class="btn btn-primary" href="<c:url value="/admin/createslide" />"><i class="icon_plus_alt2"></i></a>
              </div>

              <table class="table table-striped table-advance table-hover">
                <tbody>
                  <tr>
                  	<th style="text-align: center"><i class="icon_cogs"></i></th>
                    <th style="text-align: center">Id</th>
              		<th scope="col">Tiêu đề</th>
              		<th scope="col">Nội dung</th>
              		<th scope="col">Click link</th>
              		<th scope="col">Hình ảnh</th>
                  </tr>
                  <c:forEach var="item" items="${ pagination }">
                  	<tr>
	                  	<td style="text-align: center">
	                      <div class="btn-group">
	                        <a class="btn btn-success" href="<c:url value="/admin/editslide${ item.id }" />"><i class="icon_pencil"></i></a>
	                        <a class="btn btn-danger" href="<c:url value="/admin/deleteslide${ item.id }" />"><i class="icon_close_alt2"></i></a>
	                      </div>
	                    </td>
	                    <td style="text-align: center">${ item.id }</td>
	                    <td>${ item.title }</td>
	              		<td>${ item.content }</td>
	              		<td>${ item.click }</td>
	              		<td><img style="width: 50px" src="<c:url value="/assets/img/slide/${ item.image }" />" /></td>
	                </tr>
                  </c:forEach>
                </tbody>
              </table>
            </section>
          </div>
        </div>
        <c:if test="${ totaldata > 7 }">
        	<div class="pagination">
          		<a href="<c:url value="/admin/slideP1" />">&laquo;</a>
          		
          		<c:forEach var="item" begin="1" end="${ paginationinfo.total }" varStatus="itemS">
          			<c:if test="${ itemS.index == paginationinfo.current }">
          				<a href="<c:url value="/admin/slideP${ itemS.index }" />" class="active">${ itemS.index }</a>
          			</c:if>
          			<c:if test="${ itemS.index != paginationinfo.current }">
          				<a href="<c:url value="/admin/slideP${ itemS.index }" />">${ itemS.index }</a>
          			</c:if>
          			<c:set var="lastindex" value="${ itemS.index }" />
          		</c:forEach>

          		<a href="<c:url value="/admin/slideP${ lastindex }" />">&raquo;</a>
        	</div>
        </c:if>
        <!-- page end-->
      </section>
</body>
