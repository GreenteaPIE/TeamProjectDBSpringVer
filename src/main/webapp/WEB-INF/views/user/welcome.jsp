<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7c08c0b2cb98f2f810f7bd59e7c4de63&libraries=services,clusterer,drawing"></script>
</head>
<body>
	<jsp:include page="../header.jsp"></jsp:include>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">DB의 파트너가 되신걸 환영합니다.</h1>
			<div class="d-inline-flex">
				<a href="/">
					<input type="button" class="btn btn-primary" value="확인">
				</a>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<jsp:include page="../footer.jsp"></jsp:include>
</body>
</html>