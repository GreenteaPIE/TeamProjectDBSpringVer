<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 리스트 관리</title>
<style type="text/css">
img {
	width: 400px;
}

.delete-btn {
	position: absolute;
	opacity: 0;
	top: 50%;
	left: 50%;
	color: white;
	font-size: 3em;
	font-weight: 300;
	transform: translate(-50%, -50%);
	text-align: center;
	background-color: transparent;
	transition: color 0.3s ease;
	border: none;
	outline: none;
}

.blur {
	transition: opacity 0.3s ease;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: gray;
	opacity: 0;
}

.cat-item:hover .delete-btn {
	opacity: 1;
}

.cat-item:hover .delete-btn:hover {
	color: red;
	opacity: 1;
}

.cat-item:hover .blur {
	opacity: 0.7;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">브랜드 삭제</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="adminBrandList">Brand List</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Categories Start -->
	<div class="container-fluid pt-5">
		<div class="row px-xl-5 pb-3">
			<c:forEach var="blist" items="${blist }">
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="cat-item text-center" style="padding: 30px;">
						<a href='' class="cat-img position-relative overflow-hidden mb-3">
							<img class="img-fluid" src="../resources/img/${blist.imgurl}" alt="">
						</a>
						<div class="blur"></div>
						<button class="delete-btn font-weight-semi-bold m-0" onclick="deleteBrand('${blist.bname}')">브랜드 삭제</button>
						<form action="deleteBrand.do" method="post" id="${blist.bname}">
							<input type="hidden" name="bname" value="${blist.bname}">
						</form>
						<h5 class="font-weight-semi-bold m-0"></h5>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<hr>
	<script>
		function deleteBrand(bname) {
			if (confirm("삭제하면 브랜드 내의 모든 상품이 사라집니다. \n브랜드<"+bname+">을(를) 삭제하시겠습니까?")) {
				$("#" + bname).submit();
			}
		}
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>