<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	
</script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Auction</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="index.jsp">Home</a>
				</p>
			</div>
		</div>
		<c:if test="${AuctionList.size()==0 }">
			<h3 style="text-align: center;">진행된 옥션이 없습니다.</h3>
		</c:if>
	</div>
	<!-- Page Header End -->
	<!-- Shop Start -->
	<div id="my-container" class="container-fluid pt-5">
		<!-- Shop Product Start -->
		<div class="col-lg-9 col-md-12">
			<div class="row pb-3">
				<c:forEach var="AuctionList" items="${AuctionList }">
					<div class="col-lg-4 col-md-6 col-sm-12 pb-1" align="center">
						<div class="card product-item border-0 mb-4">
							<div class="card-header product-img position-relative overflow-hidden bg-transparent border p-0">
								<a href="auctionDetail?num=${AuctionList.num}&pName=${AuctionList.pname}">
									<img class="img-fluid w-100" style="height: 280px" src="../resources/img/${AuctionList.imgUrl}" alt="">
								</a>
							</div>
							<div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
								<h6 class="text-truncate mb-3">${AuctionList.pname}</h6>
								<c:if test="${AuctionList.onOff == 1}">
									<p>경매 진행중</p>
								</c:if>
								<c:if test="${AuctionList.onOff == 0}">
									<p>경매 완료</p>
								</c:if>
								<div class="d-flex justify-content-center">
									<%-- 통화 단위 지정 --%>
									<fmt:formatNumber value="${Integer.parseInt(AuctionList.price)}" pattern="₩###,###" />
								</div>
							</div>
						</div>
						<c:if test="${AuctionList.onOff == 0}">
							<c:if test="${user.userid eq AuctionList.userid}">
								<c:choose>
									<c:when test="${AuctionList.endPrice > 0}">
										<input type="button" class="btn btn-primary px-3" style="width: 100%;" value="구매 완료" onclick="#" disabled="disabled">
									</c:when>
									<c:otherwise>
										<input type="button" class="btn btn-primary px-3" style="width: 100%;" value="구매" onclick="location.href='/product/auctionCheckOut?auNum=${AuctionList.num}'">
									</c:otherwise>
								</c:choose>
							</c:if>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- Shop Product End -->
	</div>
	<!-- Shop End -->
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>