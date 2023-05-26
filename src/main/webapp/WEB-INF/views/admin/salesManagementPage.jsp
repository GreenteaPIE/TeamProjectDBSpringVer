<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.right {
	float: right;
}

.left {
	float: left;
}

.container {
	overflow: hidden;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div class="container">
		<div class="left" style="width: 50%">
			<div style="border: solid #0D0D0D; margin-bottom: 30px; box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);">
				<div class="container bg-secondary mb-3" style="max-width: 800px;">
					<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
						<h1 class="font-weight-semi-bold text-uppercase mb-3">Sales List</h1>
						<div class="d-inline-flex">
							<p class="m-0">매출 관리</p>
						</div>
					</div>
				</div>
				<!-- Page Header End -->
				<div class="container bg-secondary mb-3" style="max-width: 900px;">
					<input type="hidden" value="user_purchased_detail" name="command">
					<table class="table table-bordered text-center mb-0">
						<thead class="bg-secondary text-dark">
							<tr>
								<th>Order Number</th>
								<th>Orderer</th>
								<th>Order Date</th>
								<th>Total Price</th>
							</tr>
						</thead>
						<tbody class="align-middle">
							<c:if test="${salesOrderlist.size()==0}">
								<tr>
									<td class="align-middle" colspan="3">
										<h3>판매완료된 주문이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<c:set var="prev_orderNumber" value="-1" scope="page" />
							<c:set var="totalSum" value="0" />
							<c:forEach var="orderlist" items="${salesOrderlist }">
								<c:choose>
									<c:when test="${prev_orderNumber != orderlist.ordernumber}">
										<c:set var="prev_orderNumber" value="${orderlist.ordernumber}" />
										<c:set var="totalSum" value="${totalSum + orderlist.totalprice}" />
										<tr>
											<td class="align-middle"><a href="/admin/salesOrder?ordernumber=${orderlist.ordernumber}">${orderlist.ordernumber }</a></td>
											<td class="align-middle">${orderlist.userid }</td>
											<td class="align-middle"><fmt:formatDate value="${orderlist.indate }" type="date" /></td>
											<td class="align-middle"><fmt:formatNumber type="currency" value="${orderlist.totalprice}" currencySymbol="₩" /></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
						</tbody>
					</table><br>
					<table class="table table-bordered text-center mb-0">
						<tfoot class="bg-secondary text-dark">
							<tr>
								<th colspan="3">Total</th>
								<td colspan="1"><fmt:formatNumber type="currency" value="${totalSum}" currencySymbol="₩" /></td>
							</tr>
						</tfoot>
					</table>
				</div>
			</div>
		</div>
		<div class="right" style="width: 45%">
			<div style="border: solid #0D0D0D; margin-bottom: 30px; box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);">
				<div class="container bg-secondary mb-3" style="max-width: 800px;">
					<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
						<h1 class="font-weight-semi-bold text-uppercase mb-3">New Order List</h1>
						<div class="d-inline-flex">
							<p class="m-0">신규 주문</p>
						</div>
					</div>
				</div>
				<!-- Page Header End -->
				<div class="container bg-secondary mb-3" style="max-width: 900px;">
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
							<c:if test="${newOrderlist.size()==0}">
								<tr>
									<td class="align-middle" colspan="3">
										<h3>신규 주문이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<c:set var="prev_orderNumber" value="-1" scope="page" />
							<c:forEach var="orderlist" items="${newOrderlist }">
								<c:choose>
									<c:when test="${prev_orderNumber != orderlist.ordernumber}">
										<c:set var="prev_orderNumber" value="${orderlist.ordernumber}" />
										<tr>
											<td class="align-middle"><a href="/admin/orderProcess?ordernumber=${orderlist.ordernumber}">${orderlist.ordernumber }</a></td>
											<td class="align-middle"><fmt:formatDate value="${orderlist.indate }" type="date" /></td>
											<td class="align-middle"><c:choose>
													<c:when test='${orderlist.result  =="1" }'>주문 확인 중</c:when>
													<c:when test='${orderlist.result  =="2" }'>처리 진행 중</c:when>
													<c:when test='${orderlist.result  =="3" }'>배송 중</c:when>
													<c:when test='${orderlist.result  =="4" }'>취소 요청 중</c:when>
													<c:when test='${orderlist.result  =="5" }'>취소 완료</c:when>
												</c:choose></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
					</table>
				</div>
			</div>
			<div style="border: solid #0D0D0D; margin-bottom: 30px; box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);">
				<div class="container bg-secondary mb-3" style="max-width: 800px;">
					<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
						<h1 class="font-weight-semi-bold text-uppercase mb-3">Process Order List</h1>
						<div class="d-inline-flex">
							<p class="m-0">처리 진행중인 주문</p>
						</div>
					</div>
				</div>
				<!-- Page Header End -->
				<div class="container bg-secondary mb-3" style="max-width: 900px;">
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
							<c:if test="${processOrderlist.size()==0}">
								<tr>
									<td class="align-middle" colspan="3">
										<h3>배송요청할 주문이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<c:set var="prev_orderNumber" value="-1" scope="page" />
							<c:forEach var="orderlist" items="${processOrderlist }">
								<c:choose>
									<c:when test="${prev_orderNumber != orderlist.ordernumber}">
										<c:set var="prev_orderNumber" value="${orderlist.ordernumber}" />
										<tr>
											<td class="align-middle"><a href="/admin/shipmentProcess?ordernumber=${orderlist.ordernumber}">${orderlist.ordernumber }</a></td>
											<td class="align-middle"><fmt:formatDate value="${orderlist.indate }" type="date" /></td>
											<td class="align-middle"><c:choose>
													<c:when test='${orderlist.result  =="1" }'>주문 확인 중</c:when>
													<c:when test='${orderlist.result  =="2" }'>처리 진행 중</c:when>
													<c:when test='${orderlist.result  =="3" }'>배송 중</c:when>
													<c:when test='${orderlist.result  =="4" }'>취소 요청 중</c:when>
													<c:when test='${orderlist.result  =="5" }'>취소 완료</c:when>
												</c:choose></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
					</table>
				</div>
			</div>
			<div style="border: solid #0D0D0D; margin-bottom: 30px; box-shadow: 3px 3px 6px rgba(0, 0, 0, 0.3);">
				<div class="container bg-secondary mb-3" style="max-width: 800px;">
					<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 300px">
						<h1 class="font-weight-semi-bold text-uppercase mb-3">WithDraw Order List</h1>
						<div class="d-inline-flex">
							<p class="m-0">취소 요청 주문</p>
						</div>
					</div>
				</div>
				<!-- Page Header End -->
				<div class="container bg-secondary mb-3" style="max-width: 900px;">
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
							<c:if test="${withdrawOrderlist.size()==0}">
								<tr>
									<td class="align-middle" colspan="3">
										<h3>취소 요청된 주문이 없습니다.</h3>
									</td>
								</tr>
							</c:if>
							<c:set var="prev_orderNumber" value="-1" scope="page" />
							<c:forEach var="orderlist" items="${withdrawOrderlist }">
								<c:choose>
									<c:when test="${prev_orderNumber != orderlist.ordernumber}">
										<c:set var="prev_orderNumber" value="${orderlist.ordernumber}" />
										<tr>
											<td class="align-middle"><a href="/admin/withDrawOrderCheck?ordernumber=${orderlist.ordernumber}">${orderlist.ordernumber }</a></td>
											<td class="align-middle"><fmt:formatDate value="${orderlist.indate }" type="date" /></td>
											<td class="align-middle"><c:choose>
													<c:when test='${orderlist.result  =="1" }'>주문 확인 중</c:when>
													<c:when test='${orderlist.result  =="2" }'>처리 진행 중</c:when>
													<c:when test='${orderlist.result  =="3" }'>배송 중</c:when>
													<c:when test='${orderlist.result  =="4" }'>취소 요청 중</c:when>
													<c:when test='${orderlist.result  =="5" }'>취소 완료</c:when>
												</c:choose></td>
										</tr>
									</c:when>
								</c:choose>
							</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
