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
					<a href="javascript:void(0);" id="wcoupon-link">
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
						<a href="javascript:void(0);" id="bcoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/bronzecoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="gcoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/goldcoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="scoupon-link">
							<img class="img-fluid w-100" style="height: 240px; width: 450px" src="../resources/img/silvercoupon.png" alt="">
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<div style="padding: 10px;">
						<a href="javascript:void(0);" id="dcoupon-link">
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
		<hr>
		<script>

	 document.getElementById('gcoupon-link').addEventListener('click', function() {
		    if (${user.grade} < 3) {
		        alert("등급이 낮아 쿠폰을 받으실 수 없습니다.");
		    } else {
		        // AJAX 호출
		        var xhttp = new XMLHttpRequest();
		        xhttp.onreadystatechange = function() {
		            if (this.readyState === 4 && this.status === 200) {
		                var result = parseInt(this.responseText);
		                switch(result) {
		                    case 1:
		                        alert("쿠폰 지급 완료");
		                        var couponLink = document.getElementById('gcoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    case 2:
		                        alert("이미 지급된 쿠폰입니다");
		                        var couponLink = document.getElementById('gcoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    default:
		                        alert("오류가 발생했습니다. 관리자에게 문의하세요");
		                        break;
		                }
		            }
		        };
		        xhttp.open("POST", "/user/addBcoupon?userid=" + encodeURIComponent("${user.userid}") + "&couponname=GoldCoupon&discountprice=500000&imgurl=goldcoupon.png", true);
		        xhttp.send();
		    }
		});
	 
	 document.getElementById('scoupon-link').addEventListener('click', function() {
		    if (${user.grade} < 2) {
		        alert("등급이 낮아 쿠폰을 받으실 수 없습니다.");
		    } else {
		        // AJAX 호출
		        var xhttp = new XMLHttpRequest();
		        xhttp.onreadystatechange = function() {
		            if (this.readyState === 4 && this.status === 200) {
		                var result = parseInt(this.responseText);
		                switch(result) {
		                    case 1:
		                        alert("쿠폰 지급 완료");
		                        var couponLink = document.getElementById('scoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    case 2:
		                        alert("이미 지급된 쿠폰입니다");
		                        var couponLink = document.getElementById('scoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    default:
		                        alert("오류가 발생했습니다. 관리자에게 문의하세요");
		                        break;
		                }
		            }
		        };
		        xhttp.open("POST", "/user/addScoupon?userid=" + encodeURIComponent("${user.userid}") + "&couponname=SilverCoupon&discountprice=100000&imgurl=silvercoupon.png", true);
		        xhttp.send();
		    }
		});
	 
	 document.getElementById('dcoupon-link').addEventListener('click', function() {
		    if (${user.grade} < 4) {
		        alert("등급이 낮아 쿠폰을 받으실 수 없습니다.");
		    } else {
		        // AJAX 호출
		        var xhttp = new XMLHttpRequest();
		        xhttp.onreadystatechange = function() {
		            if (this.readyState === 4 && this.status === 200) {
		                var result = parseInt(this.responseText);
		                switch(result) {
		                    case 1:
		                        alert("쿠폰 지급 완료");
		                        var couponLink = document.getElementById('dcoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    case 2:
		                        alert("이미 지급된 쿠폰입니다");
		                        var couponLink = document.getElementById('dcoupon-link');
		                        couponLink.style.pointerEvents = 'none';
		                        couponLink.style.opacity = 0.5;
		                        break;
		                    default:
		                        alert("오류가 발생했습니다. 관리자에게 문의하세요");
		                        break;
		                }
		            }
		        };
		        xhttp.open("POST", "/user/addDcoupon?userid=" + encodeURIComponent("${user.userid}") + "&couponname=DiaCoupon&discountprice=1000000&imgurl=diacoupon.png", true);
		        xhttp.send();
		    }
		});
	 
	 
	 
	 document.getElementById('bcoupon-link').addEventListener('click', function() {
		    // AJAX 호출
		    var xhttp = new XMLHttpRequest();
		    xhttp.onreadystatechange = function() {
		        if (this.readyState === 4 && this.status === 200) {
		            var result = parseInt(this.responseText);
		            switch(result) {
		                case 1:
		                    alert("쿠폰 지급 완료");
		                    var couponLink = document.getElementById('bcoupon-link');
		                    couponLink.style.pointerEvents = 'none';
		                    couponLink.style.opacity = 0.5;
		                    break;
		                case 2:
		                    alert("이미 지급된 쿠폰입니다");
		                    var couponLink = document.getElementById('bcoupon-link');
		                    couponLink.style.pointerEvents = 'none';
		                    couponLink.style.opacity = 0.5;
		                    break;
		                default:
		                    alert("오류가 발생했습니다. 관리자에게 문의하세요");
		                    break;
		            }
		        }
		    };
		    xhttp.open("POST", "/user/addBcoupon?userid=" + encodeURIComponent("${user.userid}") + "&couponname=BronzeCoupon&discountprice=5000&imgurl=bronzecoupon.png", true);
		    xhttp.send();
		});
	 
	 document.getElementById('wcoupon-link').addEventListener('click', function() {
		    // AJAX 호출
		    var xhttp = new XMLHttpRequest();
		    xhttp.onreadystatechange = function() {
		        if (this.readyState === 4 && this.status === 200) {
		            var result = parseInt(this.responseText);
		            switch(result) {
		                case 1:
		                    alert("쿠폰 지급 완료");
		                    var couponLink = document.getElementById('wcoupon-link');
		                    couponLink.style.pointerEvents = 'none';
		                    couponLink.style.opacity = 0.5;
		                    break;
		                case 2:
		                    alert("이미 지급된 쿠폰입니다");
		                    var couponLink = document.getElementById('wcoupon-link');
		                    couponLink.style.pointerEvents = 'none';
		                    couponLink.style.opacity = 0.5;
		                    break;
		                default:
		                    alert("오류가 발생했습니다. 관리자에게 문의하세요");
		                    break;
		            }
		        }
		    };
		    xhttp.open("POST", "/user/addWcoupon?userid=" + encodeURIComponent("${user.userid}") + "&couponname=WelcomeCoupon&discountprice=10000&imgurl=welcomecoupon.png", true);
		    xhttp.send();
		});

	   
</script>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>
