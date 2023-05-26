<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>DIIB</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap" rel="stylesheet">
<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<!-- Libraries Stylesheet -->
<link href="../resources/css/owl.carousel.min.css" rel="stylesheet">
<!-- Customized Bootstrap Stylesheet -->
<link href="../resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
<style>
body {
  cursor: url("../resources/img/cursor.png"), auto;
}
* {
  cursor: url("../resources/img/cursor.png"), auto;
}
</style>

</head>
<body>
	<!-- Topbar Start -->
	<div class="container-fluid">
		<div class="row align-items-center py-3 px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a href="/" class="text-decoration-none">
					<img src="../resources/img/logo.png" alt="DB로고" height="50px" class="img-fluid">
				</a>
			</div>
			<div class="col-lg-6 col-6 text-left">
				<form method="get" action="/product/searchProduct">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="상품명을 입력 해주세요." name="pname">
						<div class="input-group-append">
							<button type="submit" class="input-group-text bg-transparent text-primary sp_btn">
								<i class="fa fa-search"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
			<div class="col-lg-3 col-6 text-right">
				<c:if test="${user != null}">
					<div id="cart-badge">
						<a href="/product/myCart?userid=${user.userid}" class="btn border">
							<i class="fas fa-shopping-cart text-primary"></i>
							<span class="badge"></span>
						</a>
					</div>
				</c:if>
				<c:if test="${user == null}">
					<a class="btn border" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;">
						<i class="fas fa-shopping-cart text-primary"></i>
						<span class="badge"></span>
					</a>
				</c:if>
			</div>
		</div>
	</div>
	<!-- Topbar End -->
	<!-- Navbar Start -->
	<div class="container-fluid">
		<div class="row border-top px-xl-5">
			<div class="col-lg-3 d-none d-lg-block">
				<a class="btn shadow-none d-flex align-items-center justify-content-between bg-primary text-white w-100" data-toggle="collapse" href="#navbar-vertical" style="height: 65px; margin-top: -1px; padding: 0 30px;">
					<h6 class="m-0" style="color: white;">Categories</h6>
					<i class="fa fa-angle-down text-white"></i>
				</a>
				<nav class="collapse position-absolute navbar navbar-vertical navbar-light align-items-start p-0 border border-top-0 border-bottom-0 bg-light" id="navbar-vertical" style="width: calc(100% - 30px); z-index: 1;">
					<div class="navbar-nav w-100 overflow-hidden" style="height: 410px">
						<c:forEach var="blist" items="${blist }">
							<div class="nav-item dropdown">
								<a href="#" class="nav-link" data-toggle="dropdown">${blist.bname }
									<i class="fa fa-angle-down float-right mt-1"></i>
								</a>
								<div class="dropdown-menu position-absolute bg-secondary border-0 rounded-0 w-100 m-0">
									<a href='/product/brandTopList?bname=<c:out value="${blist.bname }"/>' class="dropdown-item">TOP</a>
									<a href='/product/brandBottomList?bname=<c:out value="${blist.bname }"/>' class="dropdown-item">BOTTOM</a>
									<a href='/product/brandBoutiList?bname=<c:out value="${blist.bname }"/>' class="dropdown-item">boutique collection</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</nav>
			</div>
			<div class="col-lg-9">
				<nav class="navbar navbar-expand-lg bg-light navbar-light py-3 py-lg-0 px-0">
					<a href="/" class="text-decoration-none d-block d-lg-none">
						<img src="../resources/img/logo.png" alt="DB로고" height="50px" class="img-fluid">
					</a>
					<button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-between" id="navbarCollapse">
						<div class="navbar-nav mr-auto py-0">
							<a href="/" class="nav-item nav-link">Home</a>
							<!--<a href="shop.jsp" class="nav-item nav-link active">미입력</a> <a href="detail.jsp" class="nav-item nav-link">미입력</a>-->
							<div class="nav-item dropdown">
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">게시판</a>
								<div class="dropdown-menu rounded-0 m-0">
									<a href="/board/list?pageNum=1&amount=10&category=F&keyword=&type=" class="dropdown-item">자유 게시판</a>
									<a href="/board/list?pageNum=1&amount=10&category=Q&keyword=&type=" class="dropdown-item">질문 게시판</a>
									<a href="/board/list?pageNum=1&amount=10&category=S&keyword=&type=" class="dropdown-item">공지사항</a>
								</div>
							</div>
							<a href="/qna" class="nav-item nav-link">Q&A</a>
							<a href="/product/auctionView" class="nav-item nav-link">Auction</a>
							<a href="/product/saleList" class="nav-item nav-link">Sale</a>
							<a href="/event" class="nav-item nav-link">Event</a>
							<a href="/contact" class="nav-item nav-link">Contact</a>
						</div>
						<div class="navbar-nav mr-auto py-0" align="right">
							<c:if test="${user != null}">
								
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <b>${user.name} 님</b>
							</c:if>
						</div>
						<div class="navbar-nav ml-auto py-0">
							<c:if test="${user == null }">
								<a href="/user/login" class="nav-item nav-link">로그인</a>
								<a href="/user/join" class="nav-item nav-link">회원가입</a>
							</c:if>
							<c:if test="${user.grade == 1}">
								<div class="nav-item dropdown">
									<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">관리자</a>
									<div class="dropdown-menu rounded-0 m-0">
										<a href="/admin/userManagementPage" class="dropdown-item">회원 관리</a>
										<a href="/admin/auctionPage" class="dropdown-item">옥션 관리</a>
										<a href="/admin/productManagementPage" class="dropdown-item">상품 관리</a>
										<a href="/admin/sales_OrderManagement" class="dropdown-item">매출&주문 관리</a>
									</div>
								</div>
							</c:if>
							<c:if test="${user != null }">
								<c:if test="${user.grade != 1 }">
									<div class="nav-item dropdown">
										<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown">MY PAGE</a>
										<div class="dropdown-menu rounded-0 m-0">
											<c:if test="${user.grade == 0 }">
												<h6 style="text-align: center;">
													<span style="color: #775e39;">Bronze</span>
													등급
												</h6>
											</c:if>
											<c:if test="${user.grade == 2 }">
												<h6 style="text-align: center;">
													<span style="color: #c0c0c0;">Silver</span>
													등급
												</h6>
											</c:if>
											<c:if test="${user.grade == 3 }">
												<h6 style="text-align: center;">
													<span style="color: #ffd700;">Gold</span>
													등급
												</h6>
											</c:if>
											<c:if test="${user.grade == 4 }">
												<h6 style="text-align: center;">
													<span style="color: #87ddb1;">Diamond</span>
													등급
												</h6>
											</c:if>
											<div style="text-align: center;">
												<b style="font-size: 13px; color: gray;">${user.point} Point</b>
											</div>
											<hr>
											<a href="/user/mypagechk" class="dropdown-item">내 정보 수정</a>
											<a href="/user/myWriting?pageNum=1&amount=10&type=M&keyword=${user.userid }" class="dropdown-item">나의 작성 글</a>
											<a href="/user/myPurchased?userid=${user.userid }" class="dropdown-item">나의 주문내역</a>
											<a href="/user/myCoupon?userid=${user.userid }" class="dropdown-item">보유 쿠폰</a>
											<hr>
											<div style="text-align: center;">
												<b style="font-size: 12px; color: gray;">가입일 <fmt:formatDate value="${user.enter}" pattern="yyyy-MM-dd" /></b>
											</div>
										</div>
									</div>
								</c:if>
								<a href="/user/logout" class="nav-item nav-link">로그아웃</a>
							</c:if>
						</div>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Navbar End -->
	<script>
		$(document).ready(function() {
			$.ajax({
				url : '/product/countCartAjax',
				data : {
					userid : '${user.userid}'
				},
				success : function(data) {
					$('#cart-badge .badge').text(data);
				}
			});
		});

	</script>
</body>
</html>