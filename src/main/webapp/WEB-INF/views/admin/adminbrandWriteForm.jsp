<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>브랜드 등록</title>
<!-- 
<script type="text/javascript" src="script/admin.js"></script> -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<style>
.image-regit {
	position: absolute;
	opacity: 0;
	top: 50%;
	left: 50%;
	color: white;
	font-size: 4em;
	font-weight: 300;
	transform: translate(-50%, -50%);
	text-align: center;
	background-color: transparent;
	transition: color 0.3s ease;
	border: none;
	outline: none;
	cursor: pointer;
	width: 100%;
	height: 100%;
}

.blur {
	display: flex;
	justify-content: center;
	align-items: center;
	transition: opacity 0.3s ease;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0;
	left: 0;
	background-color: gray;
	opacity: 0;
	text-align: center;
	color: white;
	font-size: 3em;
}

.carousel-inner:hover .blur {
	opacity: 0.5;
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
				<h1 class="font-weight-semi-bold text-uppercase mb-3">브랜드 등록</h1>
				<p class="m-0">
					<a href="adminBrandList">Brand List</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Shop Detail Start -->
	<div class="container-fluid py-5">
		<form action="brandWrite.do" method="post" name="frm" enctype="multipart/form-data">
			<div class="row px-xl-5">
				<div class="col-lg-5 pb-5">
					<div id="product-carousel" class="carousel slide" data-ride="carousel">
						<div class="carousel-inner border" style="height: 500px;">
							<div class="blur">이미지 등록</div>
							<input type="file" class="btn btn-primary px-3 image-regit" name="uploadFile" id="file-upload-1" onchange="previewFile(), selectSameFile(event)"> <img style="width: 100%;" class="img-fluid preview-img" src="" alt="">
						</div>
					</div>
				</div>
				<div class="col-lg-7 pb-5">
					<div class="d-flex mb-3" style="margin-top: 150px;">
						<p class="text-dark font-weight-medium mb-0 mr-3">Brand Name:</p>
					</div>
					<div style="display: flex;">
						<input type="text" class="form-control" name="bname" maxlength="50" style="width: 200px;">
					</div>
					<div class="d-flex mb-3" style="margin-top: 40px;">
						<p class="text-dark font-weight-medium mb-0 mr-3">Brand Image</p>
					</div>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="custom-control custom-control-inline">
							<input type="file" class="btn btn-primary px-3" name="uploadFile" id="file-upload-2" onchange="previewFile(event), selectSameFile(event)">
						</div>
					</div>
				</div>
				<input type="submit" class="btn btn-primary px-3" style="margin: 0 auto;" value="브랜드 등록하기">
			</div>
		</form>
	</div>
	<!-- Shop Detail End -->
	<hr>
	<script>
		//미리보기 사진
		function previewFile() {
			const preview = document.querySelector('.preview-img');
			const file = event.target.files[0];
			const reader = new FileReader();

			reader.addEventListener("load", function() {
				// 파일을 읽어서 이미지 URL로 설정합니다.
				preview.src = reader.result;
			}, false);

			if (file) {
				// 파일을 읽습니다.
				reader.readAsDataURL(file);
			}
		}
		//두개의 input이 같은 파일을 선택하도록 지정
		function selectSameFile(event) {
			const inputElements = document.querySelectorAll('input[type=file]');

			for (let i = 0; i < inputElements.length; i++) {
				inputElements[i].files = event.target.files;
			}
		}

		let regex = new RegExp("(.*?)\.(jpg|png)$");
		let maxSize = 1048576 * 5; //5MB	

		function fileCheck(fileName, fileSize) {

			if (fileSize >= maxSize) {
				alert("파일 사이즈 초과");
				return false;
			}

			if (!regex.test(fileName)) {
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}

			return true;
		}
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>