<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">MY COUPON</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<div id="my-container" class="container-fluid pt-5">
		<div class="col-lg-9 col-md-12">
			<h3 style="text-align: center;">사용한 쿠폰</h3>
			<div class="row pb-3">
				<c:set var="usedCouponFound" value="false" />
				<c:forEach var="couplist" items="${couplist }">
					<c:if test="${couplist.couponresult == 0 }">
						<c:set var="usedCouponFound" value="true" />
						<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
							<div class="card product-item border-0 mb-4">
								<div class="card-header position-relative overflow-hidden bg-transparent border p-0">
									<img class="img-fluid w-100" style="height: 140px;" src="../resources/img/${couplist.imgurl}" alt="">
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${!usedCouponFound}">
					<div class="col-12">
						<p style="text-align: center;">사용한 쿠폰 없음</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<div id="my-container" class="container-fluid pt-5">
		<div class="col-lg-9 col-md-12">
			<h3 style="text-align: center;">미사용 쿠폰</h3>
			<div class="row pb-3">
				<c:set var="unusedCouponFound" value="false" />
				<c:forEach var="couplist" items="${couplist }">
					<c:if test="${couplist.couponresult != 0 }">
						<c:set var="unusedCouponFound" value="true" />
						<div class="col-lg-4 col-md-6 col-sm-12 pb-1">
							<div class="card product-item border-0 mb-4">
								<div class="card-header position-relative overflow-hidden bg-transparent border p-0">
									<img class="img-fluid w-100" style="height: 140px;" src="../resources/img/${couplist.imgurl}" alt="">
								</div>
							</div>
						</div>
					</c:if>
				</c:forEach>
				<c:if test="${!unusedCouponFound}">
					<div class="col-12">
						<p style="text-align: center;">미사용 쿠폰 없음</p>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
