<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>DB의 파트너가 되신걸 환영합니다</title>
<!-- 카카오 지도 API 라이브러리 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c08c0b2cb98f2f810f7bd59e7c4de63&libraries=services,clusterer,drawing"></script>
<!-- CSS 스타일 시트 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
<style>
.container {
	margin-top: 50px;
	padding: 20px;
	background-color: #f7f7f7;
	border-radius: 10px;
	box-shadow: 0px 0px 5px 0px rgba(0, 0, 0, 0.2);
	text-align: center;
	max-width: 800px;
	margin: 0 auto;
}

h1 {
	font-size: 40px;
	font-weight: bold;
	margin-bottom: 20px;
}

p {
	font-size: 20px;
	margin-bottom: 40px;
}

.btn-primary {
	font-size: 18px;
	padding: 10px 30px;
	border-radius: 30px;
	font-weight: bold;
	background-color: #7e57c2;
	border-color: #7e57c2;
	text-transform: uppercase;
}

.btn-primary:hover {
	background-color: #6d4c41;
	border-color: #6d4c41;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<!-- 페이지 상단 부분 -->
	<hr>
	<!-- 페이지 내용 부분 -->
	<div class="container">
		<h1 class="font-weight-semi-bold text-uppercase mb-3">DB의 파트너가 되신걸 환영합니다.</h1>
		<p>회원 가입이 완료되었습니다.</p>
		<!-- 카카오 지도 띄우기 -->
		<div id="map" style="width: 100%; height: 400px;"></div>
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
		<!-- 확인 버튼 -->
		<br><br>
		<div class="d-inline-flex">
			<a href="/">
				<input type="button" class="btn btn-primary" value="확인">
			</a>
		</div>
	</div>
	<!-- 페이지 하단 부분 -->
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
