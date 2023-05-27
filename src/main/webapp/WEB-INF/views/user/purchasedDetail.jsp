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
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Purchased List</h1>
			<div class="d-inline-flex">
				<p class="m-0">주문내역 상세 확인</p>
			</div>
		</div>
	</div>
	<input type="hidden" name="userid" value="${user.userid }">
	<!-- Page Header End -->
	<div class="container bg-secondary mb-3" style="max-width: 1000px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
			<table class="table table-bordered text-center mb-0">
				<thead class="bg-secondary text-dark">
					<c:if test="${not empty olist}">
						<tr>
							<th>주문한 사람</th>
							<td>${olist[0].userid }</td>
						</tr>
						<tr>
							<th>배송받을 사람</th>
							<td>${olist[0].name }</td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td>${olist[0].phone }</td>
						</tr>
						<tr>
							<th>배송지</th>
							<td>${olist[0].address1 }&nbsp;${olist[0].address2 }${olist[0].address3 }</td>
						</tr>
					</c:if>
				</thead>
			</table>
		</div>
	</div>
	<div class="container bg-secondary mb-3" style="max-width: 1000px;">
		<table class="table table-bordered text-center mb-0">
			<thead class="bg-secondary text-dark">
				<tr>
					<th>No.</th>
					<th>Products</th>
					<th>size</th>
					<th>quantity</th>
					<th>Price</th>
					<th>Status</th>
					<th>Order Date</th>
				</tr>
			</thead>
			<tbody class="align-middle">
				<c:forEach var="olist" items="${olist}">
					<c:forEach var="plist" items="${plist }">
						<c:if test="${olist.num eq plist.num }">
							<tr>
								<td class="align-middle">${olist.num}</td>
								<td class="align-middle"><a href='/product/productDetail?num=<c:out value="${plist.num }"/>&pname=${plist.pname}'>${plist.pname}</a></td>
								<td class="align-middle">${olist.psize}</td>
								<td class="align-middle">${olist.quantity }</td>
								<td class="align-middle"><fmt:setLocale value="ko_KR" /> <fmt:formatNumber type="currency" value="${olist.price * olist.quantity }" currencySymbol="₩" /></td>
								<td class="align-middle"><c:choose>
										<c:when test='${olist.result  =="1" }'>주문 확인 중</c:when>
										<c:when test='${olist.result  =="2" }'>처리 진행 중</c:when>
										<c:when test='${olist.result  =="3" }'>배송 중</c:when>
										<c:when test='${olist.result  =="4" }'>취소 요청 중</c:when>
										<c:when test='${olist.result  =="5" }'>취소 완료</c:when>
									</c:choose></td>
								<td class="align-middle"><fmt:formatDate value="${olist.indate}" pattern="yyyy. MM. dd. HH:mm" /></td>
							</tr>
							<c:set var="ordernumber" value="${olist.ordernumber }" />
							<c:set var="result" value="${olist.result }" />
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
					<th colspan="4">Total Price</th>
					<td colspan="3"><fmt:formatNumber value="${totalPrice}" type="currency" /></td>
				<tr>
		</table>
		<div class="card-footer border-secondary bg-transparent" align="center">
			<button class="btn btn-block btn-primary my-3 py-3" style="width: 350px;" onclick="withdrawOrder('${ordernumber}', '${result}')">Withdraw Order</button>
			<button class="btn btn-block btn-primary my-3 py-3" style="width: 350px;" onclick="location.href='/user/myPurchased?userid=${user.userid }'">Purchased List</button>
		</div>
	</div>
	<hr>
	<script>
		function withdrawOrder(ordernumber, orderResult) {
			if (orderResult === "1") {
				if (confirm("주문을 취소하시겠습니까?")) {
					$.ajax({
						url : `/user/withdrawOrder?ordernumber=${ordernumber}`,
						type : 'GET',
						success : function(data) {
							if (data === "Success") {
								alert("주문이 성공적으로 취소되었습니다.");
								location.reload(); // 주문 상태를 업데이트하기 위해 페이지를 다시 로드합니다.
							} else {
								alert("주문 취소 중 문제가 발생했습니다.");
							}
						},
						error : function(err) {
							alert("주문 취소 요청이 실패했습니다.");
						}
					});
				}
			} else {
				alert("취소 요청할 수 없습니다.");
			}
		}
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>