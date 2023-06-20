<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/adminTheme.css">
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
<!-- font-awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
* {
	margin: 0 auto;
}

/* 페이지 버튼 인터페이스 */
.pageMaker_wrap {
	text-align: center;
	margin-top: 30px;
	margin-bottom: 40px;
}

.pageMaker_wrap a {
	color: black;
}

.pageMaker {
	list-style: none;
	display: inline-block;
}

.pageMaker_btn {
	float: left;
	width: 40px;
	height: 40px;
	line-height: 40px;
	margin-left: 20px;
}

.next, .prev {
	border: 1px solid #ccc;
	padding: 0 10px;
}

.active { /* 현재 페이지 버튼 */
	border: 2px solid black;
	font-weight: 400;
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div>
		<!-- Page Header Start -->
		<div class="container bg-secondary mb-3" style="max-width: 800px;">
			<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
				<h1 class="font-weight-semi-bold text-uppercase mb-3">상품 관리</h1>
				<p class="m-0">
					<!-- 					<a href="adminProductList">목록으로</a> -->
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<div id="wrap">
		<div align="center" style="width: 90%">
			<div align="right" style="margin-bottom: 10px;">
				<button class="btn btn-primary px-3" onclick="location.href='/admin/adminProductWriteForm'">상품등록</button>
				<!-- 	<button class="btn btn-primary px-3">선택삭제</button>
				<button class="btn btn-primary px-3">전체삭제</button> -->
			</div>
			<div align="center">
				<table class="table" style="text-align: center; border: 1px solid #dddddd;">
					<thead>
						<tr>
							<!-- <th style="background-color: #eeeeee; text-align: center;">
							<input type="checkbox" class="individual_cart_checkbox input_size_20">
							</th> -->
							<th style="background-color: #eeeeee; text-align: center;">상품번호</th>
							<th style="background-color: #eeeeee; text-align: center;">브랜드</th>
							<th style="background-color: #eeeeee; text-align: center;">상품이름</th>
							<th style="background-color: #eeeeee; text-align: center;">성별</th>
							<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
							<th style="background-color: #eeeeee; text-align: center;">사이즈</th>
							<th style="background-color: #eeeeee; text-align: center;">재고</th>
							<th style="background-color: #eeeeee; text-align: center;">상품 등록일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${productList }" var="productList">
							<tr>
								<!-- <td>
									<input type="checkbox">
								</td> -->
								<td><c:out value="${productList.num }"></c:out></td>
								<td><c:out value="${productList.bname }"></c:out></td>
								<td><a class="move" href='<c:out value="${productList.num }"/>'>
										<c:out value="${productList.pname }"></c:out>
									</a></td>
								<td><c:if test="${productList.pGender==1 }">남자</c:if> <c:if test="${productList.pGender==2 }">여자</c:if> <c:if test="${productList.pGender==3 }">공용</c:if></td>
								<td><c:if test="${productList.kind==1 }">상의	</c:if> <c:if test="${productList.kind==2 }">하의	</c:if> <c:if test="${productList.kind==3 }">잡화	</c:if></td>
								<td><c:out value="${productList.psize }"></c:out></td>
								<td><c:out value="${productList.balance }"></c:out></td>
								<td><fmt:formatDate value="${productList.writedate  }" type="date" /></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<!-- 페이지 이동 인터페이스 영역 -->
				<div class="pageMaker_wrap">
					<ul class="pageMaker">
						<!-- 이전 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageMaker_btn prev"><a href="${pageMaker.startPage - 1}">
									<i class="fa fa-angles-left"></i>
								</a></li>
						</c:if>
						<!-- 페이지 번호 -->
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
							<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}"><a href="${num}">${num}</a></li>
						</c:forEach>
						<!-- 다음 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageMaker_btn next"><a href="${pageMaker.endPage + 1 }">
									<i class="fa fa-angles-right"></i>
								</a></li>
						</c:if>
					</ul>
				</div>
				<!-- 페이징 끝  -->
				<!-- 검색 영역 -->
				<div class="search_wrap">
					<form id="searchForm" action="/admin/adminProductList" method="get">
						<div class="input-group" style="max-width: 400px;">
							<input type="text" placeholder="상품명을 입력 해주세요." class="form-control" name="keyword" style="width: 10%" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'> <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'> <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
							<div class="input-group-append">
								<button class="btn btn-primary px-3">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
				<form id="moveForm" action="/admin/adminProductList" method="get">
					<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
				</form>
			</div>
		</div>
	</div>
	<hr>
	<script>
		$(document).ready(function(e) {
			/* 등록 성공 경고창 */
			let eResult = '<c:out value="${enroll_result}"/>';

			checkResult(eResult);
			function checkResult(result) {
				if (result === '') {
					return;
				}
				alert("상품 '" + eResult + "'을 등록하였습니다.");
			}
		});

		/* 수정 성공 이벤트 */
		let modify_result = '${modify_result}';

		if (modify_result == 1) {
			alert("수정 완료");
		}

		/* 삭제 결과 경고창 */
		let delete_result = '${delete_result}';

		if (delete_result == 1) {
			alert("삭제 완료");
		}

		$(".table tbody tr").each(
				function() {
					var row = $(this);

					// Get the original price
					var goodsPriceText = row.find("td:eq(8)").text().trim();
					var goodsPrice = parseFloat(goodsPriceText.replace(
							/[^0-9.-]+/g, ""));

					// Get the discount rate
					var discountRateText = row.find("td:eq(9)").text().trim();
					var discountRate = parseFloat(discountRateText) / 100;

					// Calculate the discounted price
					var discountPrice = goodsPrice * (1 - discountRate);

					// Format the discounted price with the currency symbol
					var formattedDiscountPrice = '₩'
							+ new Intl.NumberFormat('ko-KR')
									.format(discountPrice.toFixed(0));

					// Set the formatted discounted price in the span_discount element
					row.find(".span_discount").text(formattedDiscountPrice);
				});

		let moveForm = $('#moveForm');

		/* 페이지 이동 버튼 */
		$(".pageMaker_btn a").on("click", function(e) {

			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.submit();
		});

		/* 상품 조회 페이지 */
		/* 상품 조회 페이지 */
		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();

					moveForm.append("<input type='hidden' name='num' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/admin/adminProductDetail");
					moveForm.submit();
				});
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>