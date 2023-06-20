<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>
<style>
.ck-content {
	height: 200px;
}

input {
	width: 98%;
	padding: 5px 1%;
	border: 0;
	text-aling: center;
}

select {
	width: 98%;
	padding: 5px 1%;
	border: 0;
}

tr th td {
	vertical-align: middle;
	border-collapse: collapse;
}

.step_val { /* 할인 가격 문구 */
	padding-top: 5px;
	font-weight: 500;
}

.ck_warn { /* 입력란 공란 경고 태그 */
	display: none;
	padding-top: 10px;
	text-align: center;
	color: #e05757;
	font-weight: 300;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div>
		<!-- Page Header Start -->
		<div class="container bg-secondary mb-3" style="max-width: 800px;">
			<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
				<h1 class="font-weight-semi-bold text-uppercase mb-3">상품 정보</h1>
				<p class="m-0">
					<a href="adminProductList">Product Info</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
</head>
<!-- Shop Detail Start -->
<div align="center">
	<table class="table" style="text-align: center; border: 1px solid #dddddd; width: 70%;">
		<tr>
			<th style="background-color: #eeeeee; text-align: center; width: 200px;">브랜드</th>
			<td colspan="3"><input id="bname" value="<c:out value="${productDetail.bname }"/>" disabled="disabled"></td>
		</tr>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">상품명</th>
			<td colspan="3"><input id="pname" value="<c:out value="${productDetail.pname }"/>" disabled="disabled"></td>
		</tr>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">성별</th>
			<td><c:if test="${productDetail.pGender==1 }">남성용</c:if> <c:if test="${productDetail.pGender==2 }">여성용</c:if> <c:if test="${productDetail.pGender==3 }">공용</c:if></td>
			<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
			<td><c:if test="${productDetail.kind==1 }">상의</c:if> <c:if test="${productDetail.kind==2 }">하의</c:if> <c:if test="${productDetail.kind==3 }">잡화</c:if></td>
		</tr>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">사이즈</th>
			<td><c:choose>
					<c:when test="${productDetail.psize =='Free'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='XS'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='S'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='M'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='L'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='XL'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
					<c:when test="${productDetail.psize =='XXL'}">
						<c:out value="${productDetail.psize }"></c:out>
					</c:when>
				</c:choose></td>
			<th style="background-color: #eeeeee; text-align: center; width: 200px">재고</th>
			<td><input name="balance" value="${productDetail.balance }" disabled="disabled"></td>
		</tr>
		<tr>
			<th style="background-color: #eeeeee; text-align: center;">원가</th>
			<td><input name="price" value="${productDetail.price }" disabled="disabled"> <span class="step_val">
					할인된 가격 (판매가) :
					<span class="span_discount"></span>
				</span></td>
			<th style="background-color: #eeeeee; text-align: center; width: 200px">할인율</th>
			<td><input name="discountrate_input" value="<fmt:formatNumber value="${productDetail.discountrate/100}" type="percent" />" disabled="disabled"> <input type="hidden" name="discountrate" value="${productDetail.discountrate}" /></td>
		</tr>
		<tr>
			<th colspan="4" style="background-color: #eeeeee; text-align: center;">상품 설명</th>
		</tr>
		<tr>
			<td colspan="4">
				<div class="explainTextarea">
					<textarea name="explain" id="productExplainEditor"><c:out value="${productDetail.explain }"></c:out></textarea>
				</div>
			</td>
		</tr>
		<tr>
			<th colspan="4" style="background-color: #eeeeee; text-align: center;">등록된 상품 이미지 확인</th>
		</tr>
		<tr>
			<td colspan="4"><c:choose>
					<c:when test="${empty productDetail.imgUrl }">
						등록된 이미지가 없습니다.
					</c:when>
					<c:otherwise>
						<img style="width: 600px; height: 400px" src="/admin/display?fileName=${productDetail.imgUrl}" />
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>
	<button class="btn btn-primary px-3" style="width: 150px" id="modifyBtn">수 정</button>
	<button class="btn btn-primary px-3" style="width: 150px" id="cancelBtn">취 소</button>
	<button class="btn btn-primary px-3" style="width: 150px" id="deleteBtn">삭 제</button>
	<form id="moveForm" action="/admin/adminProductList" method="get">
		<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
	</form>
</div>
<hr>
<script>
/*취소 버튼 */
$("#cancelBtn").click(function(){
	location.href="/admin/adminProductList"
});

/* 수정 페이지 이동 */
$("#modifyBtn").on("click", function(e){
	e.preventDefault();
	let addInput = '<input type="hidden" name="num" value="${productDetail.num}">';
	$("#moveForm").append(addInput);
	$("#moveForm").attr("action", "/admin/adminProductModify");
	$("#moveForm").submit();
});	

/*삭제 버튼*/
$("#deleteBtn").on("click", function(e){
	e.preventDefault();
	if(confirm("정말 삭제하시겠습니까? 삭제 후 내용 복구는 할 수 없습니다.")) {
		let moveForm = $("#moveForm");
		moveForm.find("input").remove();
		moveForm.append('<input type="hidden" name="num" value="${productDetail.num}">');
		moveForm.attr("action", "/admin/adminProductDelete");
		moveForm.attr("method", "post");
		moveForm.submit();
	}
});


$(document).ready(function(){
	
		  let discountRate = $("input[name='discountrate']").val();  // 할인율 값 가져오기
		  let goodsPrice = $("input[name='price']").val();           // 원가
		  let discountPrice = goodsPrice * (1 - discountRate / 100); // 할인가격

		  $(".span_discount").html(discountPrice.toFixed(0) + "원");

	/*위지윅*/
	/*상품설명 등록 */
	ClassicEditor
		.create(document.querySelector('#productExplainEditor'))
		.then(editor => {
					console.log(editor);
					editor.enableReadOnlyMode( 'my-feature-id' ); 
				})
		.catch(error=>{
			console.error(error);
	});
	
});

</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>