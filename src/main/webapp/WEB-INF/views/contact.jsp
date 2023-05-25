<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c08c0b2cb98f2f810f7bd59e7c4de63&libraries=services,clusterer,drawing"></script>
<jsp:include page="header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Contact Us</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Contact Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5">
			<div class="col-lg-7 mb-5">
				<div class="contact-form">
					<div id="success"></div>
					<form name="sentMessage" id="contactForm" novalidate="novalidate">
						<div class="row">
							<div class="col-md-12">
								<div id="map" style="height: 500px; border: 1px solid #ccc; border-radius: 5px; background-color: #f8f9fa;"></div>
							</div>
						</div>
						<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c08c0b2cb98f2f810f7bd59e7c4de63"></script>
						<script>
							var mapContainer = document.getElementById('map'), mapOption = {
								center : new kakao.maps.LatLng(
										37.526028933993665, 127.04603780540681),
								level : 3
							};
							var map = new kakao.maps.Map(mapContainer,
									mapOption);
							var markerPosition = new kakao.maps.LatLng(
									37.526028933993665, 127.04603780540681);
							var marker = new kakao.maps.Marker({
								position : markerPosition
							});
							marker.setMap(map);
						</script>
					</form>
				</div>
			</div>
			<div class="col-lg-5 mb-5">
				<h5 class="font-weight-semi-bold mb-3">Get In Touch</h5>
				<p class="text-primary">
					문의 사항이 있으시다면 우리 회사에 연락할 수 있습니다. <br> 아래의 연락처 이메일을 참조하시기 바랍니다.
				</p>
				<p>Customers with inquiries can contact our company. Please refer to the contact address email below.</p>
				<div class="d-flex flex-column mb-3">
					<h5 class="font-weight-semi-bold mb-3">Diamond Black 청담 본점</h5>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt text-primary mr-3"></i>서울특별시 강남구 청담동 청담명품거리 DB센트럴타워
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope text-primary mr-3"></i>DBSeoul@gmail.com
					</p>
					<p class="mb-2">
						<i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890
					</p>
				</div>
				<div class="d-flex flex-column">
					<h5 class="font-weight-semi-bold mb-3">Diamond Black 뉴욕 지점</h5>
					<p class="mb-2">
						<i class="fa fa-map-marker-alt text-primary mr-3"></i>123 Street, New York, USA
					</p>
					<p class="mb-2">
						<i class="fa fa-envelope text-primary mr-3"></i>DBNewYork@gmail.com
					</p>
					<p class="mb-0">
						<i class="fa fa-phone-alt text-primary mr-3"></i>+012 345 67890
					</p>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->
	<hr>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>