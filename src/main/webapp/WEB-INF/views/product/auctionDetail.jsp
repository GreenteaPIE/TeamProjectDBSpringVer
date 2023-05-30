<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="../resources/js/auction.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
<style>
  @keyframes flashing {
    0% {
      color: transparent;
    }
    50% {
      color: black;
    }
    100% {
      color: transparent;
    }
  }
  
  .animated {
    animation: flashing 1s linear infinite;
  }
</style>

</head>
<hr>
<body onload="startTimer()">
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Auction</h1>
			<h1>
				<span id="countdown"></span>
			</h1>
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
						<div class="carousel-item active">
							<img class="w-100 pimg" src="../resources/img/${ auction.imgUrl}" alt="Image">
						</div>
						<div class="carousel-item">
							<img class="w-100 pimg" src="../resources/img/${ auction.imgUrl}" alt="Image">
						</div>
					</div>
					<a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
						<i class="fa fa-2x fa-angle-left text-dark"></i>
					</a>
					<a class="carousel-control-next" href="#product-carousel" data-slide="next">
						<i class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>
			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${auction.pname }</h3>
				<h3 class="font-weight-semi-bold mb-4">
					원가 &#8361;
					<fmt:formatNumber value="${Integer.parseInt(originProduct.price)}" pattern="###,###" />
				</h3>
				<p class="mb-4">${originProduct.explain }</p>
				<form action="dealAuction.do" method="post" name="frm">
					<input type="hidden" name="userid" value="${user.userid }">
					<div class="custom-control custom-radio custom-control-inline">
						<p class="text-dark font-weight-medium mb-0 mr-3">사이즈: ${auction.psize }</p>
					</div>
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<h3 class="font-weight-semi-bold">시작가 ₩ ${auction.startPrice }</h3>
					</div>
					<c:choose>
						<c:when test="${auction.onOff == 0 }">
							<div class="d-flex mb-3" style="margin-top: 40px;">
								<p style="font-size: 1.3em;" class="font-weight-semi-bold">낙찰자: ${auction.userid }</p>
							</div>
						</c:when>
						<c:otherwise>
							<div class="d-flex mb-3" style="margin-top: 40px;">
								<p style="font-size: 1.3em;" class="font-weight-semi-bold">현재 낙찰 예상자: ${auction.userid }</p>
							</div>
						</c:otherwise>
					</c:choose>
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<h3 class="font-weight-semi-bold">현재가 ₩</h3>
						<!-- animated 클래스 추가 -->
						<span style="font-size: 1.8em; color: black; margin-left: 30px; transform: translate(-8px, -3px);" id="cPrice" class="animated">
							<fmt:formatNumber value="${Integer.parseInt(auction.price)}" pattern="###,###" />
						</span>
					</div>
					<c:if test="${auction.onOff== 1 }">
						<div style="display: flex;">
							<span style="font-size: 1.7em;">&#8361;</span>
							<input type="text" class="form-control" value="${auction.price }" name="price" maxlength="15" style="width: 300px;">
						</div>
					</c:if>
					<div class="d-flex align-items-center mb-4 pt-2">
						<input type="hidden" name="num" value="${auction.num }">
						<input type="hidden" name="onOff" value="${auction.onOff }">
						<input type="hidden" name="originProduct" value="${originProduct.pname }">
						<!-- 입력 가격과 현재 가격을 비교를 위한 input -->
						<input type="hidden" name="currentPrice" id="currentPrice" value="${auction.price }">
						<c:choose>
							<c:when test="${auction.onOff==0 }">
								<c:if test="${user.userid eq auction.userid}">
									<c:choose>
										<c:when test="${auction.endPrice > 0}">
											<input type="button" class="btn btn-primary px-3" style="width: 100%;" value="이미 구매 완료한 상품입니다." onclick="#" disabled="disabled">
										</c:when>
									</c:choose>
								</c:if>
								<input type="button" value="뒤로가기" class="btn btn-primary px-3" onclick="location.href='/product/auctionView'">
							</c:when>
							<c:otherwise>
								<c:if test="${not empty user.userid}">
									<input type="submit" class="btn btn-primary px-3" value="입찰" onclick="return priceCheck()">
									<input type="reset" class="btn btn-primary px-3" value="Reset">
								</c:if>
								<c:if test="${empty user.userid}">
									<input type="submit" class="btn btn-primary px-3" value="입찰" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
									<input type="reset" class="btn btn-primary px-3" value="Reset">
								</c:if>
							</c:otherwise>
						</c:choose>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->
	<hr>
	<script>
	// 현재 날짜와 시간 가져오기
	var now = new Date().getTime();

	// 타이머가 끝날 날짜와 시간 설정 (예: 2023년 5월 1일)
	var countDownDate = ${auction.endTime.getTime()};

	// 매 초마다 실행될 함수
	 if(document.frm.onOff.value != 0){
	var x =	setInterval(function() {


		// 현재 날짜와 시간 가져오기
		var now = new Date().getTime();

		// 남은 시간 계산
		var distance = countDownDate - now;

		// 남은 시간을 초, 분, 시, 일 단위로 변환
		var days = Math.floor(distance / (1000 * 60 * 60 * 24));
		var hours = Math.floor((distance % (1000 * 60 * 60 * 24))
				/ (1000 * 60 * 60));
		var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
		var seconds = Math.floor((distance % (1000 * 60)) / 1000);
		var milliseconds = distance % 10;

		// 표시할 텍스트 생성
		var countdownText = days + "일 " + hours + "시간 " + minutes + "분 "
				+ seconds + ". " + milliseconds + " 초 ";

		// 텍스트를 countdown ID를 가진 HTML 요소에 삽입
		document.getElementById("countdown").innerHTML = countdownText;

		// 타이머 종료 시 실행될 함수
		if (distance <= 0) {
			sendOnOffToServer();
			clearInterval(x);
			document.getElementById("countdown").innerHTML = "기간이 만료된 경매입니다.";
			
		}
	}, 100);
	} else{
		document.getElementById("countdown").innerHTML = "기간이 만료된 경매입니다.";
	}
	
	 function sendOnOffToServer() {
		  // num과 onOff 값을 서버로 전송
		  var numValue = ${auction.num};
		  
		  // 서버로 전송할 데이터를 FormData 객체에 추가
		  var formData = new FormData();
		  formData.append('num', numValue);

		  // AJAX 요청
		  var xhr = new XMLHttpRequest();
		  xhr.open('POST', '/product/expiredAuction.do', true);
		  xhr.onreadystatechange = function() {
		    if (xhr.readyState === XMLHttpRequest.DONE) {
		      if (xhr.status === 200) {
		        // 서버 응답 성공
		        console.log('서버 응답:', xhr.responseText);
		        document.getElementById('message').innerHTML = '기간이 만료된 경매입니다.';
		        
		        // 페이지 새로고침
		        location.reload();
		      } else {
		        // 서버 응답 실패
		        console.error('서버 응답 오류:', xhr.status);
		     // 페이지 새로고침
		        location.reload();
		      }
		    }
		  };
		  xhr.send(formData);
		}
	 if(document.frm.onOff.value != 0){
	 $(document).ready(function() {
		  fetchPrice(); // 페이지 로드 시 가격 가져오기

		  // 일정 간격마다 가격을 업데이트하기 위해 fetchPrice() 함수를 호출합니다.
		  setInterval(fetchPrice, 1000); // 1초마다 업데이트
		});
	 }

		function fetchPrice() {
			var numValue = ${auction.num};
			
		  $.ajax({
		    url: '/product/getPrice',
		    type: 'post', // POST 방식으로 변경
		    data: { num: numValue }, // num 값을 매개변수로 전달
		    success: function(price) {
		    	console.log("가격:", price);
		      updatePrice(price);
		    },
		    error: function(xhr, status, error) {
		      console.error('가격을 가져오는 동안 오류가 발생했습니다:', error);
		    }
		  });
		}

		function formatPrice(price) {
		    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		}

		function updatePrice(price) {
		    const priceEl = document.getElementById('cPrice');
		    priceEl.innerText = formatPrice(price);

		    const currentPrice = document.getElementById('currentPrice');
		    currentPrice.value = formatPrice(price);
		}

	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>