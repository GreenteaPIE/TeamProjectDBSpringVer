<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Purchased List</h1>
			<div class="d-inline-flex">
				<p class="m-0">진행 중인 주문내역</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<div class="container bg-secondary mb-3" style="max-width: 900px;">
		<form name="frm" action="DBServlet">
			<input type="hidden" value="user_purchased_detail" name="command">
			<table class="table table-bordered text-center mb-0">
				<thead class="bg-secondary text-dark">
					<tr>
						<th>Order Number</th>
						<!-- 					<th>Products</th> -->
						<!-- 					<th>Total Price</th> -->
						<th>Order Date</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody class="align-middle">
				
				<c:if test="${olist.size()==0}">
								<tr>
									<td class="align-middle" colspan="3">
										<h3>주문내역이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
					<c:set var="prev_orderNumber" value="-1" scope="page" />
					<c:forEach var="olist" items="${olist }">
						<c:choose>
							<c:when test="${prev_orderNumber != olist.ordernumber}">
								<c:set var="prev_orderNumber" value="${olist.ordernumber}" />
								<tr>
									<td class="align-middle"><a href="/user/myPurchasedDetail?ordernumber=${olist.ordernumber}">${olist.ordernumber }</a></td>
									<td class="align-middle"><fmt:formatDate value="${olist.indate }" type="date" /></td>
									<td class="align-middle"><c:choose>
											<c:when test='${olist.result  =="1" }'>주문 확인 중</c:when>
											<c:when test='${olist.result  =="2" }'>처리 진행 중</c:when>
											<c:when test='${olist.result  =="3" }'>배송 중</c:when>
											<c:when test='${olist.result  =="4" }'>취소 요청 중</c:when>
											<c:when test='${olist.result  =="5" }'>취소 완료</c:when>
										</c:choose></td>
								</tr>
							</c:when>
						</c:choose>
					</c:forEach>
			</table>
		</form>
		<div class="card-footer border-secondary bg-transparent" align="center">
			<button class="btn btn-block btn-primary my-3 py-3" style="width: 350px;" onclick="location.href='/'">Continue shopping</button>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>