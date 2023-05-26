<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div class="mypage-container">
		<div class="mypage-header"></div>
		<div class="mypage-wrapper">
			<div class="mypage-header">
				<div class="mypage-userinfo">
					<h4>
						<strong>${user.userid}</strong> 님
					</h4>
				</div>
				<div class="mypage-btns">
					<div class="mypage-menu">
						<ul>
							<button type="button" onclick="location.href='adminBrandList'">브랜드 관리</button>
							<button type="button" onclick="location.href='adminProductList'">상품 관리</button>
						</ul>
					</div> 
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>