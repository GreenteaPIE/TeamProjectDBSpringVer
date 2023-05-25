<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 리스트 관리</title>
<script type="text/javascript" src="../resources/js/admin.js"></script>
<style type="text/css">
img {
	width: 400px;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div id="wrap" align="center">
		<hr>
		<h1 style="margin-top: 80px;" class="font-weight-semi-bold text-uppercase mb-3">브랜드 리스트 관리</h1>
		<input type="button" style="margin: 40px 0" class="btn btn-primary px-3" value="브랜드 등록" onclick="location.href='adminbrandWriteForm'"> <input type="button" style="margin: 40px 0" class="btn btn-primary px-3" value="브랜드 삭제" onclick="location.href='adminBrandDelete'">
		<!-- Categories Start -->
		<div class="container-fluid pt-5">
			<div class="row px-xl-5 pb-3">
				<c:forEach var="blist" items="${blist }">
					<div class="col-lg-4 col-md-6 pb-1">
						<div class="cat-item text-center" style="padding: 30px;">
							<p class="text-right"></p>
							<a href='/product/brandProductList?bname=<c:out value="${blist.bname }"/>' class="cat-img position-relative overflow-hidden mb-3">
								<img class="img-fluid" src="../resources/img/${blist.imgurl}" alt="">
							</a>
							<h5 class="font-weight-semi-bold m-0"></h5>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<input type="button" class="btn btn-primary px-3" value="뒤로가기" onclick="location.href='adminBrandList'">
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>