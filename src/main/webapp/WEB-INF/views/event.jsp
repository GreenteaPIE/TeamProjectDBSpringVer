<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>
<style>
.title {
	text-align: center;
	font-family: "Helvetica Neue", Arial, sans-serif;
	font-weight: bold;
	font-size: 28px;
	letter-spacing: 1px;
	text-transform: uppercase;
	color: #333;
}
</style>
</head>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Event</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<div class="container">
		<!-- 신규가입 환영 쿠폰 영역 -->
		<div class="row">
			<div class="col-md-12">
				<h2 class="title">신규가입 환영 쿠폰</h2>
			</div>
		</div>
		<!-- 빈 공간 -->
		<div class="row mt-4">
			<div class="col-md-12"></div>
		</div>
		<c:if test="${user != null}">
			<div class="row">
				<div class="col-md-6">
					<a href="javascript:void(0);" id="WelcomeCoupon-link">
						<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/welcomecoupon.png" alt="">
					</a>
				</div>
			</div>
		</c:if>
		<c:if test="${user == null}">
			<div class="row">
				<div class="col-md-6">
					<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
						<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/welcomecoupon.png" alt="">
					</a>
				</div>
			</div>
		</c:if>
		<!-- 빈 공간 -->
		<div class="row mt-4">
			<div class="col-md-12"></div>
		</div>
		<!-- 이번 달 할인 쿠폰 영역 -->
		<div class="row mt-4">
			<div class="col-md-12">
				<h2 class="title">이달의 할인 쿠폰</h2>
			</div>
		</div>
		<!-- 빈 공간 -->
		<div class="row mt-4">
			<div class="col-md-12"></div>
		</div>
		<c:if test="${user != null}">
			<div class="row">
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="BronzeCoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/bronzecoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="GoldCoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/goldcoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="SilverCoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/silvercoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="DiaCoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/diacoupon.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${user == null}">
			<div class="row">
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/bronzecoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/goldcoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/silvercoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/diacoupon.png" alt="">
						</a>
					</div>
				</div>
			</div>
		</c:if>
	</div>
	<hr>
	<script>
	    function issueCoupon(couponName, discountPrice, imgUrl, requiredGrade) {
	        if (${user.grade} < requiredGrade) {
	            alert('등급이 낮아 쿠폰을 받으실 수 없습니다.');
	        } else {
	            var xhttp = new XMLHttpRequest();
	            xhttp.onreadystatechange = function() {
	                if (this.readyState === 4 && this.status === 200) {
	                    var result = parseInt(this.responseText);
	                    switch(result) {
	                        case 1:
	                            alert('쿠폰 지급 완료');
	                            var couponLink = document.getElementById(couponName + '-link');
	                            couponLink.style.pointerEvents = 'none';
	                            couponLink.style.opacity = 0.5;
	                            break;
	                        case 2:
	                            alert('이미 지급된 쿠폰입니다');
	                            var couponLink = document.getElementById(couponName + '-link');
	                            couponLink.style.pointerEvents = 'none';
	                            couponLink.style.opacity = 0.5;
	                            break;
	                        default:
	                            alert('오류가 발생했습니다. 관리자에게 문의하세요');
	                            break;
	                    }
	                }
	            };
	            xhttp.open('POST', '/user/addCoupon?userid=' + encodeURIComponent('${user.userid}') + '&couponname=' + couponName + '&discountprice=' + discountPrice + '&imgurl=' + imgUrl, true);
	            xhttp.send();
	        }
	    }

	    document.getElementById('GoldCoupon-link').addEventListener('click', function() {
	        issueCoupon('GoldCoupon', 500000, 'goldcoupon.png', 3);
	    });

	    document.getElementById('SilverCoupon-link').addEventListener('click', function() {
	        issueCoupon('SilverCoupon', 100000, 'silvercoupon.png', 2);
	    });

	    document.getElementById('DiaCoupon-link').addEventListener('click', function() {
	        issueCoupon('DiaCoupon', 1000000, 'diacoupon.png', 4);
	    });

	    document.getElementById('BronzeCoupon-link').addEventListener('click', function() {
	        issueCoupon('BronzeCoupon', 5000, 'bronzecoupon.png', 0);
	    });

	    document.getElementById('WelcomeCoupon-link').addEventListener('click', function() {
	        issueCoupon('WelcomeCoupon', 10000, 'welcomecoupon.png', 0);
	    });
	</script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
