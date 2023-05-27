<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Order List</h1>
			<div class="d-inline-flex">
				<p class="m-0">주문해주셔서 감사합니다.</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<table class="table table-bordered text-center mb-0">
			<thead class="bg-secondary text-dark">
				<tr>
					<th>Products</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Order Date</th>
					<th>Status</th>
				</tr>
			</thead>
			<tbody class="align-middle">
				<c:forEach var="olist" items="${olist }">
					<c:forEach var="plist" items="${plist }">
						<c:if test="${olist.num == plist.num}">
							<tr>
								<td class="align-middle">${plist.pname }</td>
								<td class="align-middle">${olist.quantity }</td>
								<td class="align-middle"><fmt:formatNumber value="${olist.price * olist.quantity}" type="currency" /></td>
								<td class="align-middle"><fmt:formatDate value="${olist.indate }" type="date" /></td>
								<td class="align-middle"><c:choose>
										<c:when test='${olist.result  =="1" }'>주문 확인 중</c:when>
									</c:choose></td>
							</tr>
						</c:if>
					</c:forEach>
				</c:forEach>
				<c:set var="totalPrice" value="0" />
				<c:forEach var="olist" items="${olist}">
					<c:forEach var="plist" items="${plist}">
						<c:if test="${olist.num == plist.num}">
							<c:set var="totalPrice" value="${olist.totalprice}" />
						</c:if>
					</c:forEach>
				</c:forEach>
				<tr>
					<th>Total Price</th>
					<td colspan="4"><fmt:formatNumber value="${totalPrice}" type="currency" /></td>
				<tr>
			</tbody>
		</table>
		<div class="card-footer border-secondary bg-transparent" align="center">
			<button class="btn btn-block btn-primary my-3 py-3" style="width: 350px;" onclick="location.href='/'">Continue shopping</button>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>