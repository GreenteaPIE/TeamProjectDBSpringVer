<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
<style>
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

.next a, .prev a {
	color: #ccc;
}

.active { /* 현재 페이지 버튼 */
	border: 2px solid black;
	font-weight: 400;
}

.table_empty {
	text-align: center;
	font-weight: 400;
}
</style>
</head>
<body>
	<div>
		<!-- Page Header Start -->
		<div class="container bg-secondary mb-3" style="max-width: 800px;">
			<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
				<h1 class="font-weight-semi-bold text-uppercase mb-3">브랜드 목록</h1>
				<!-- 검색 영역 -->
				<div class="search_wrap">
					<form id="searchForm" action="/admin/brandPop" method="get">
						<div class="input-group" style="max-width: 400px;">
							<input type="text" placeholder="브랜드 명을 입력 해주세요." class="form-control" name="keyword" style="width: 10%" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'> <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'> <input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
							<div class="input-group-append">
								<button class="btn btn-primary px-3">
									<i class="fa fa-search"></i>
								</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 게시물 O -->
	<c:if test="${listCheck != 'empty'}">
		<div class="table_exist">
			<table class="table" style="text-align: center; border: 1px solid #dddddd;">
				<c:forEach items="${brandList}" var="brandList">
					<tr>
						<td><a class="move" href='<c:out value="${brandList.bname}"/>' data-bname='<c:out value="${brandList.bname}"/>'>
								<c:out value="${brandList.bname}" />
							</a></td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</c:if>
	<!-- 게시물 x -->
	<c:if test="${listCheck == 'empty'}">
		<div class="table_empty">등록된 브랜드가 없습니다.</div>
	</c:if>
	<form id="moveForm" action="/admin/brandPop" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
	<script>
		let searchForm = $('#searchForm');
		let moveForm = $('#moveForm');

		/* 브랜드 검색 버튼 동작 */
		$("#searchForm button").on("click", function(e) {

			e.preventDefault();

			/* 검색 키워드 유효성 검사 */
			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력하십시오");
				return false;
			}

			searchForm.find("input[name='pageNum']").val("1");

			searchForm.submit();

		});

		/* 브랜드 선택 및 팝업창 닫기 */
		$(".move").on("click", function(e) {

			e.preventDefault();
			let brandHref = $(this).attr("href");
			let brandName = $(this).data("bname");

			// 			console.log("brandHref:", brandHref);
			// 			console.log("brandName:", brandName);
			// 			console.log("bName_select:", $(opener.document).find("#bName_select").length); // 디버깅을 위한 출력
			// 			console.log("bName_input:", $(opener.document).find("#bName_input").length); // 디버깅을 위한 출력

			$(opener.document).find("#bName_select").val(brandHref);
			$(opener.document).find("#bName_input").val(brandName);

			window.close();

		});
	</script>
</body>
</html>