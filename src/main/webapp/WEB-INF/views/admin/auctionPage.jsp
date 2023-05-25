<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Auction</title>
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
						<button type="button" onclick="location.href='/admin/adminAuctionBrandList'">옥션 등록</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>