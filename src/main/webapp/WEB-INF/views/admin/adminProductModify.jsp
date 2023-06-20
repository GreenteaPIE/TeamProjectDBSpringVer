<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdn.ckeditor.com/ckeditor5/38.0.1/classic/ckeditor.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
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
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<div>
		<!-- Page Header Start -->
		<div class="container bg-secondary mb-3" style="max-width: 800px;">
			<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 150px">
				<h1 class="font-weight-semi-bold text-uppercase mb-3">상품 수정</h1>
				<p class="m-0"></p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Shop Detail Start -->
	<div align="center">
		<form action="/admin/adminProductModify" method="post" id="modifyForm" enctype="multipart/form-data">
			<input type="hidden" name="num" value="${productDetail.num}">
			<table class="table" style="text-align: center; border: 1px solid #dddddd; width: 70%;">
				<tr>
					<th style="background-color: #eeeeee; text-align: center; width: 200px;">브랜드</th>
					<td colspan="4"><input id="bName_select" value="${productDetail.bname}" style="Width: 75%" readonly="readonly"> <input id="bName_input" name="bname" type="hidden" value="${productDetail.bname}">
						<button id="select_brand" class="btn btn-primary px-3" style="width: 150px">선택</button>
						<div>
							<span class="ck_warn bname_warn">브랜드를 선택해주세요.</span>
						</div></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">상품명</th>
					<td colspan="4"><input id="pnameId" name="pname" value="${productDetail.pname }">
						<div>
							<span class="ck_warn pname_warn">상품명을 입력해주세요.</span>
						</div></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">성별</th>
					<td colspan="4"><label> <input type="radio" name="pGender" value="1" ${productDetail.pGender == "1" ? "checked" : ""}> 남성용
					</label> <label> <input type="radio" name="pGender" value="2" ${productDetail.pGender == "2" ? "checked" : ""}> 여성용
					</label> <label> <input type="radio" name="pGender" value="3" ${productDetail.pGender == "3" ? "checked" : ""}> 공용
					</label>
						<div>
							<span class="ck_warn pGender_warn">상품의 성별을 선택해주세요.</span>
						</div></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">카테고리</th>
					<td colspan="4"><label> <input type="radio" name="kind" value="1" ${productDetail.kind == "1" ? "checked" : ""}> 상의
					</label> <label> <input type="radio" name="kind" value="2" ${productDetail.kind == "2" ? "checked" : ""}> 하의
					</label> <label> <input type="radio" name="kind" value="3" ${productDetail.kind == "3" ? "checked" : ""}> 잡화
					</label>
						<div>
							<span class="ck_warn kind_warn">상품의 카테고리를 선택해주세요.</span>
						</div></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">사이즈</th>
					<td><select name="psize">
							<option value="Free" ${productDetail.psize == "Free" ? "selected" : ""}>Free</option>
							<option value="XS" ${productDetail.psize == "XS" ? "selected" : ""}>XS</option>
							<option value="S" ${productDetail.psize == "S" ? "selected" : ""}>S</option>
							<option value="M" ${productDetail.psize == "M" ? "selected" : ""}>M</option>
							<option value="L" ${productDetail.psize == "L" ? "selected" : ""}>L</option>
							<option value="XL" ${productDetail.psize == "XL" ? "selected" : ""}>XL</option>
							<option value="XXL" ${productDetail.psize == "XXL" ? "selected" : ""}>XXL</option>
					</select>
						<div>
							<span class="ck_warn psize_warn">상품 사이즈를 선택해주세요.</span>
						</div></td>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">재고</th>
					<td><input name="balance" type="number" value="${productDetail.balance }">
						<div>
							<span class="ck_warn balance_warn">상품의 재고를 입력해주세요.</span>
						</div></td>
				</tr>
				<tr>
					<th style="background-color: #eeeeee; text-align: center;">원가</th>
					<td><input name="price" type="number" value="${productDetail.price }">
						<div>
							<span class="step_val">
								할인된 가격 (판매가) :
								<span class="span_discount"></span>
								원
							</span>
							<span class="ck_warn price_warn">상품의 가격을 입력해주세요.</span>
						</div></td>
					<th style="background-color: #eeeeee; text-align: center; width: 200px">할인율</th>
					<td><input id="discount_interface" maxlength="2" value="<fmt:formatNumber value="${productDetail.discountrate/100}" type="percent" />"> <input name="discountrate" type="hidden" value="0"></td>
				</tr>
				<tr>
					<th colspan="4" style="background-color: #eeeeee; text-align: center;">상품 설명</th>
				</tr>
				<tr>
					<td colspan="4">
						<div class="explainTextarea">
							<textarea name="explain" id="productExplainEditor">${productDetail.explain }</textarea>
						</div>
						<div>
							<span class="ck_warn explain_warn">상품의 설명을 입력해주세요.</span>
						</div>
					</td>
				</tr>
				<tr>
					<th colspan="4" style="background-color: #eeeeee; text-align: center;">등록된 상품이미지 확인</th>
				</tr>
				<tr>
					<td colspan="4"><c:choose>
							<c:when test="${empty productDetail.imgUrl}">
								<span>등록된 이미지가 없습니다.</span>
							</c:when>
							<c:otherwise>
								<img style="width: 600px; height: 400px" src="/admin/display?fileName=${productDetail.imgUrl}" />
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th colspan="2" style="background-color: #eeeeee; text-align: center;">상품 이미지 변경</th>
					<td colspan="4"><input type="file" id="fileItem" name="uploadFile" style="height: 30px;"></td>
				</tr>
			</table>
		</form>
		<button class="btn btn-primary px-3" style="width: 150px" id="modifyBtn">수 정</button>
		<button class="btn btn-primary px-3" style="width: 150px" id="cancelBtn">취 소</button>
	</div>
	<hr>
	<script>
	/*위지윅*/
	/*상품설명 등록 */
	ClassicEditor
		.create(document.querySelector('#productExplainEditor'))
		.catch(error=>{
			console.error(error);
	});
	
	/*취소 버튼 */
	$("#cancelBtn").click(function(){
		location.href="/admin/adminProductList"
	});
	
	/* 수정 버튼 */
	$("#modifyBtn").on("click", function(e){
		e.preventDefault();
		
		/*유효성 검사 체크 변수 선언*/
		let bnameCk = false;
		let pnameCk = false;
		let pGenderCk = false;
		let kindCk = false;
		let psizeCk = false;
		let balanceCk = false;
		let priceCk = false;
		let explainCk = false;
		
		/* 체크 대상 변수 */
		let bname = $("input[id='bName_select']").val();
		let pname = $("input[id='pnameId']").val().trim();
		let pGender = $("input[name='pGender']:checked").val();
		let kind = $("input[name='kind']:checked").val();
		let psize = $("select[name='psize']").val();
		let balance = parseInt($("input[name='balance']").val(), 10);
		let price = parseInt($("input[name='price']").val(), 10);
		let explain = $(".explainTextarea p").html();
		
		if(bname!== ''){
			$(".bname_warn").css('display','none');
			bnameCk = true;
		} else {
			$(".bname_warn").css('display','block');
			bnameCk = false;
		}
		
		if(pname!== ''){
			$(".pname_warn").css('display','none');
			pnameCk = true;
		} else {
			$(".pname_warn").css('display','block');
			pnameCk = false;
		}
		
		if(pGender){
			$(".pGender_warn").css('display','none');
			pGenderCk = true;
		} else {
			$(".pGender_warn").css('display','block');
			pGenderCk = false;
		}
		
		if(kind){
			$(".kind_warn").css('display','none');
			kindCk = true;
		} else {
			$(".kind_warn").css('display','block');
			kindCk = false;
		}
		
		if(psize){
			$(".psize_warn").css('display','none');
			psizeCk = true;
		} else {
			$(".psize_warn").css('display','block');
			psizeCk = false;
		}
		
		if (!isNaN(balance) && balance >= 0) {
			  $(".balance_warn").css('display', 'none');
			  balanceCk = true;
			} else {
			  $(".balance_warn").css('display', 'block');
			  balanceCk = false;
			}
		
		if (!isNaN(price) && price > 0) {
			  $(".price_warn").css('display', 'none');
			  priceCk = true;
			} else {
			  $(".price_warn").css('display', 'block');
			  priceCk = false;
			}
		
		if(explain != '<br data-cke-filler="true">'){
			$(".explain_warn").css('display','none');
			explainCk = true;
		} else {
			$(".explain_warn").css('display','block');
			explainCk = false;
		}			
		
		if(bnameCk && pnameCk && pGenderCk && kindCk && psizeCk && priceCk && balanceCk && explainCk){
			alert('통과');
			$("#modifyForm").submit();
		} else {
			return false;
		}
	});
	
	/*브랜드 선택*/
	$("#select_brand").click(function(e){
		e.preventDefault();
		
		let popUrl = "/admin/brandPop";
		let popOption = "width = 400px, height=500px, top=300px, left=300px, scrollbars=yes";
		
		window.open(popUrl,"브랜드 검색",popOption);	
		
	});
	
	
	$(document).ready(function() {
		  let userInput = $("#discount_interface");
		  let discountInput = $("input[name='discountrate']");
		  let goodsPriceInput = $("input[name='price']");
		  let spanDiscount = $(".span_discount");

		  let discountRate = parseFloat(userInput.val()); // 사용자가 입력한 할인값 (숫자로 변환)
		  let goodsPrice = parseFloat(goodsPriceInput.val()); // 원가 (숫자로 변환)

		  // 할인율과 원가에 입력된 값으로 할인가격 계산
		  let discountPrice = goodsPrice * (1 - discountRate / 100);

		  discountInput.val(discountRate); // 서버에 전송할 할인값
		  spanDiscount.text(discountPrice); // 할인가격을 출력합니다.

		  // 할인율 입력란 변경 시
		  userInput.on("propertychange change keyup paste input", function() {
		    discountRate = parseFloat(userInput.val());
		    discountPrice = goodsPrice * (1 - discountRate / 100);

		    discountInput.val(discountRate);
		    spanDiscount.text(discountPrice);
		  });

		  // 원가 입력란 변경 시
		  goodsPriceInput.on("change", function() {
		    goodsPrice = parseFloat(goodsPriceInput.val());
		    discountPrice = goodsPrice * (1 - discountRate / 100);

		    spanDiscount.text(discountPrice);
		  });
		});


	
	/*이미지 업로드*/
	$("input[type='file']").on("change", function(e){
		alert("동작 확인");

		/* /*이미지 존재 시 삭제
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		} */
		
		let formData = new FormData();
		let fileInput=$('input[name="uploadFile"]');
		let fileList=fileInput[0].files;
		let fileObj=fileList[0];
		
		console.log("fileList : "+ fileList);
		console.log("fileObj : " + fileObj);
		console.log("fileName : "+ fileObj.name);
		console.log("fileSize : " + fileObj.size);
		console.log("fileType(MimeType) : " + fileObj.type);

		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		alert("통과");
		formData.append("uploadFile", fileObj);
		
		$.ajax({
			url: '/admin/uploadAjaxAction', //서버로 요청을 보낼 url
			processData : false, // 서버로 전송할 데이터를 queryString 형태로 변환할지 여부
			contentType : false, // 서버로 전송되는 데이터의 content-type 
			data : formData, // 서버로 전송할 데이터
			type : 'POST', // 서버로 요청 타입 (get, post)
			dataType : 'json', // 서버로부터 반환받을 데이터 타입 
			success : function(result){
				console.log(result);
				showUploadImage(result);
			},
			error: function(result){
				console.log(result);
				alert("업로드 실패");
			}
		});
	});
	
	
	/*var, mehtod related with attachFile*/
	let regex  = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB
	
	function fileCheck(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;	
		}
		
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드 할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showUploadImage(uploadResultArr) {
		console.log("showUploadImage called");
		console.log(uploadResultArr);

		  let uploadResult = $("#uploadResult");

		  let str = "";
		 
		  for (let i = 0; i < uploadResultArr.length; i++) {
		    let obj = uploadResultArr[i];

		    if (!obj || !obj.imgUrl) {
		      console.log("Invalid object or missing imgUrl property");
		      continue;
		    }

		    let fileCallPath = "/admin/display?fileName=" + obj.imgUrl;
		    
			console.log("obj.imgUrl : " + obj.imgUrl);
		    console.log("fileCallPath: " + fileCallPath);
		    
		    str += "<div id='result_card'>";
		    str += "<img src='"+fileCallPath+"'>";
		    str += "<div class='imgDeleteBtn'>x</div>";
		    str += "</div>";
		    
		    console.log("Appending the following HTML string: " + str);
		  }
			uploadResult.html(str);
		}
	
	
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>