<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<script src="../resources/js/detail.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">${pdlist.bname}</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 pb-5">
				<div id="product-carousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner border">
						<img class="w-100 pimg" src="../resources/img/${ pdlist.imgUrl}" alt="Image">
					</div>
				</div>
			</div>
			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${pdlist.pname }</h3>
				<h3 class="font-weight-semi-bold mb-4">
					<fmt:formatNumber value="${Integer.parseInt(pdlist.price)}" pattern="₩###,###" />
				</h3>
				<p class="mb-4">${pdlist.explain }</p>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Sizes</p>
				</div>
				<form action="/product/addCart" name="addcart" method="post" onsubmit="return validateForm()">
					<input type="hidden" name="num" value="${pdlist.num }">
					<input type="hidden" name="userid" value="${user.userid }">
					<input type="hidden" name="price" value="${Integer.parseInt(pdlist.price)}">
					<c:forEach var="ps" items="${ps }">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="${ps.psize }" name="psize" value="${ps.psize }">
							<label class="custom-control-label" for="${ps.psize }">${ps.psize }</label>
						</div>
					</c:forEach>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="input-group quantity mr-3" style="width: 130px;">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-minus" onclick="minus()">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<input type="text" name="quantity" class="form-control bg-secondary text-center" value="1">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-plus" onclick="plus()">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<c:if test="${user != null}">
							<button class="btn btn-primary px-3">
								<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
							</button>
						</c:if>
						<c:if test="${user == null}">
							<button class="btn btn-primary px-3" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
								<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
							</button>
						</c:if>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>