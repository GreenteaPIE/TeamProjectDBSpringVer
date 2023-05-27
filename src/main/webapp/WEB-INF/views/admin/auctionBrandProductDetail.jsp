<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>옥션 등록</title>
<script>
		// 5초마다 메시지를 출력하는 타이머 함수
		function startTimer() {
			setInterval(function() {
				var message = "현재 시간은 " + new Date().toLocaleTimeString() + "입니다.";
				document.getElementById("timer").innerHTML = message;
			}, 1000);
		}
	</script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<hr>
<body onload="startTimer()">
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">옥션 등록</h1>
			<p class="m-0" style="font-size: 1.6em;">${product.bname}</p>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="index.jsp">Home</a>
				</p>
			</div>
			<div id="timer"></div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 pb-5">
				<div id="product-carousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner border">
						<img class="w-100 h-100" style="height: 280px" src="../resources/img/${product.imgUrl}" alt="Image">
					</div>
				</div>
			</div>
			<div class="col-lg-7 pb-5">
				<h3 class="font-weight-semi-bold">${product.pname }</h3>
				<h3 class="font-weight-semi-bold mb-4">
					<fmt:formatNumber value="${Integer.parseInt(product.price)}" pattern="###,###원" />
				</h3>
				<p class="mb-4">${product.explain }</p>
				<div class="d-flex mb-3">
					<p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
				</div>
				<form action="/admin/addAuction.do" method="post">
					<input type="hidden" name="pname" value="${product.pname }"> <input type="hidden" name="bname" value="${product.bname }"> <input type="hidden" name="price" value="0"> <input type="hidden" name="imgUrl" value="${product.imgUrl }">
					<c:forEach var="size" items="${pSize }">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="${size.psize }" name="psize" value="${size.psize }"> <label class="custom-control-label" for="${size.psize }">${size.psize }</label>
						</div>
					</c:forEach>
					<input type="hidden" class="form-control" name="userid" value="${user.userid }">
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<p class="text-dark font-weight-medium mb-0 mr-3">시작가:</p>
					</div>
					<div style="display: flex;">
						&#8361;<input type="text" class="form-control" value="0" name="startPrice" maxlength="10" style="width: 100px;">
					</div>
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<p class="text-dark font-weight-medium mb-0 mr-3">기간:</p>
						<input type="datetime-local" class="form-control" id="dateTimeInput" name="dateTimeInput" style="width: 300px;">
					</div>
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<p class="text-dark font-weight-medium mb-0 mr-3">Available:</p>
					</div>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="on" name="onOff" value="1" checked="checked"> <label class="custom-control-label" for="on">ON</label>
						</div>
						<input type="submit" class="btn btn-primary px-3" value="옥션 등록하기">
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- Shop Detail End -->
	<script type="text/javascript">
		
		const dateTimeInput = document.getElementById("dateTimeInput");
		const dateObj = new Date(dateTimeInput.value); // 입력된 문자열값을 Date 객체로 변환
		const endAt = dateObj.toISOString(); // Date 객체를 문자열로 변환
		document.getElementById("dateTimeInput").value = endAt; // endtime 입력 컨트롤의 값으로 설정
		
		</script>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>