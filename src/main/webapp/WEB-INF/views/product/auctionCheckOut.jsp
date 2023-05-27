<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<%--아임포트 라이브러리--%>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<!-- Page Header Start -->
	<div class="container bg-secondary mb-3" style="max-width: 800px;">
		<div class="d-flex flex-column align-items-center justify-content-center" style="min-height: 200px">
			<h1 class="font-weight-semi-bold text-uppercase mb-3">Checkout</h1>
			<div class="d-inline-flex">
				<p class="m-0">
					<a href="/">Home</a>
				</p>
			</div>
		</div>
	</div>
	<!-- Page Header End -->
	<!-- Checkout Start -->
	<form action="/product/auctionPurchased" method="post" name="frm" id="frm">
		<input type="hidden" name="userid" value="${user.userid }">
		<div class="container-fluid pt-5">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<div class="mb-4">
						<h4 class="font-weight-semi-bold mb-4">Billng Address</h4>
						<div class="row">
							<div class="col-md-6 form-group">
								<label>이름</label> <input class="form-control" type="text" name="name" placeholder="${user.name }">
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text" name="email" placeholder="${user.email }">
							</div>
							<div class="col-md-6 form-group">
								<label>전화번호</label> <input class="form-control" type="text" name="phone" placeholder="${user.phone }">
							</div>
							<div class="col-md-6 form-group">
								<label>우편번호</label> <input class="form-control address_input_1" type="text" name="address1" placeholder="${user.address1 }">
							</div>
							<div class="col-md-12 form-group">
								<label>주소</label> <input class="form-control address_input_2" type="text" name="address2" placeholder="${user.address2 }">
							</div>
							<div class="col-md-12 form-group">
								<label>상세주소</label> <input class="form-control address_input_3" type="text" name="address3" placeholder="${user.address3 }">
							</div>
							<div class="col-md-12 text-right">
								<input type="button" onclick="execution_daum_address()" class="rbutton xsmall white btn btn-primary" value="우편번호 찾기">
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="useraddress"> <label class="custom-control-label" for="useraddress">주문자 정보와 동일</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<div class="custom-control custom-checkbox">
									<input type="checkbox" class="custom-control-input" id="shipto"> <label class="custom-control-label" for="shipto" data-toggle="collapse" data-target="#shipping-address">약관 동의</label>
								</div>
							</div>
						</div>
					</div>
					<div class="collapse mb-4" id="shipping-address">
						<h4 class="font-weight-semi-bold mb-4">이용약관</h4>
						<div class="row">
							<div class="col-md-6 form-group">
								<label>결제약관</label>
								<p>제1조 (목적) 이 약관은 "간편결제서비스회원"이 ㈜DIIB(이하 “DB”이라 합니다.)이 운영하는 매체(이하 “쇼핑몰”이라 한다)에서 "대상카드"를 이용하여 전자상거래를 이용 하는 경우 롯데카드 주식회사(이하 "회사"라 합니다.)가 "간편결제서비스회원"에게 제공하는 간편결제서비스(이하 "간편결제서비스"라 합니다.)의 이용조건 및 절차에 관한 기본사항을 정함을 목적으로 합니다.</p>
								<hr>
								<p>제2조 (용어의 정의) ① "대상카드"란 "간편결제서비스"를 적용하고자 하는 카드로서, "회사"가 발급한 VISA, Master, JCB, American Express Card, Local 신용카드를 소지한 개인 개별 회원, 체크카드 이용회원을 말합니다.</p>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Order Total</h4>
						</div>
						<div class="card-body">
							<c:set var="subprice" value="0" />
							<h5 class="font-weight-medium mb-3">Products</h5>
							<div class="d-flex justify-content-between">
								<p>${auVo.pname}</p>
								<p>
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${auVo.price}" currencySymbol="₩" />
								</p>
							</div>
							<input type="hidden" name="pname" id="pname" value="${auVo.pname}"> <input type="hidden" name="psize" value="${auVo.psize }"> <input type="hidden" name="quantity" value="1"> <input type="hidden" name="num" value="${auVo.num }"> <input type="hidden" name="price" value="${auVo.price }"> <input type="hidden" name="auNum" value="${auVo.num }"> <input type="hidden" name="endPrice" value="${auVo.price }">
							<c:set var="subprice" value="${subprice + auVo.price}" />
							<br>
							<hr class="mt-0">
							<div class="d-flex justify-content-between mb-3 pt-1">
								<h6 class="font-weight-medium">Subtotal</h6>
								<h6 class="font-weight-medium" id="subtotalPrice">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${subprice}" currencySymbol="₩" />
								</h6>
							</div>
							<div class="d-flex justify-content-between">
								<h6 class="font-weight-medium">Shipping</h6>
								<h6 class="font-weight-medium">
									<strong style="font-size: 20px">Free</strong>
								</h6>
							</div>
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<div class="d-flex justify-content-between mb-2">
								<h5 class="font-weight-bold">Total</h5>
								<h5 class="font-weight-bold" id="totalDisplayPrice">
									<fmt:setLocale value="ko_KR" />
									<fmt:formatNumber type="currency" value="${subprice}" currencySymbol="₩" />
								</h5>
							</div>
							<div>
								<div class="d-flex justify-content-between mb-2">
									<h6 class="font-weight-medium">Discount Price</h6>
									<h6 class="font-weight-medium" id="DiscountPrice">₩0</h6>
								</div>
							</div>
						</div>
					</div>
					<div class="input-group mb-5">
						<div class="form-control form-control-custom">
							<h5 class="font-weight-medium mb-3" align="center">쿠폰 적용불가</h5>
							<c:set var="totalprice" value="${subprice}" />
							<input id="total" type="hidden" name="totalprice" value="${totalprice }" step="1">
						</div>
						<div class="input-group-append">
							<button class="btn btn-primary" style="color: black; font-size: 0.8em;" disabled="disabled">Select Coupon</button>
						</div>
					</div>
					<div class="card border-secondary mb-5">
						<div class="card-header bg-secondary border-0">
							<h4 class="font-weight-semi-bold m-0">Payment</h4>
						</div>
						<div class="card-body">
							<div class="form-group">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment" id="paypal"> <label class="custom-control-label" for="paypal">신용카드</label>
								</div>
							</div>
							<div class="form-group">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment" id="directcheck"> <label class="custom-control-label" for="directcheck">삼성페이</label>
								</div>
							</div>
							<div class="">
								<div class="custom-control custom-radio">
									<input type="radio" class="custom-control-input" name="payment" id="banktransfer"> <label class="custom-control-label" for="banktransfer">무통장입금</label>
								</div>
							</div>
						</div>
						<div class="card-footer border-secondary bg-transparent">
							<button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3 " id="checkout-button">Place Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--Checkout End -->
	<script>
	//결제 
	
const shiptoCheckbox = document.getElementById('shipto');
const paymentRadios = document.getElementsByName('payment');
const placeOrderBtn = document.getElementById('checkout-button');

placeOrderBtn.addEventListener('click', function(event) {
	  event.preventDefault(); // 폼 제출을 막음

	  // Select Coupon 버튼 클릭 이벤트를 강제로 실행
	  $('button.btn.btn-primary').click();

	  if (!shiptoCheckbox.checked) {
	    alert('약관에 동의해주세요.');
	  } else if (!Array.from(paymentRadios).some(radio => radio.checked)) {
	    alert('결제 방법을 선택해주세요.');
	  } else {
	    // 결제 요청 함수 호출
	    iamport();
	  }
	});
function iamport() {
    var total = parseFloat($("#total").val()); // parseFloat로 숫자로 변환
    var pname = $("#pname").val();
    // 가맹점 식별코드
    IMP.init('imp36864364');
    
    // 결제 요청 함수 호출
    IMP.request_pay({
        pg: 'html5_inicis',
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: pname, // 결제창에서 보여질 이름
        amount: total, // 실제 결제되는 가격
        buyer_email: 'iamport@siot.do',
        buyer_name: '구매자이름',
        buyer_tel: '010-1234-5678',
        buyer_addr: '서울 강남구 대치동',
        buyer_postcode: '123-456'
    }, function(rsp) {
        if (rsp.success) {
            // 결제 성공 처리
            var msg = '결제가 완료되었습니다.';
        
            alert(msg);
            document.getElementById('frm').submit(); // 폼 제출
        } else {
            // 결제 실패 처리
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            alert(msg);
            document.getElementById('frm').submit(); // 폼 제출
        }
    });
}
	 //주문자 정보 동일
	 $(document).ready(function () {
    $("#useraddress").on("change", function () {
      if ($(this).is(":checked")) {
        $("input[name='name']").val($("input[name='name']").attr("placeholder")).prop("readonly", true);
        $("input[name='email']").val($("input[name='email']").attr("placeholder")).prop("readonly", true);
        $("input[name='phone']").val($("input[name='phone']").attr("placeholder")).prop("readonly", true);
        $("input[name='address1']").val($("input[name='address1']").attr("placeholder")).prop("readonly", true);
        $("input[name='address2']").val($("input[name='address2']").attr("placeholder")).prop("readonly", true);
        $("input[name='address3']").val($("input[name='address3']").attr("placeholder")).prop("readonly", true);
      } else {
        // Restore input fields to be editable and remove the value if the checkbox is unchecked.
        $("input[type='text']").val("").prop("readonly", false);
      }
    });
  });
	 
	// 다음 주소 연동
		function execution_daum_address() {

			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								// 조합된 참고항목을 해당 필드에 넣는다.
								// document.getElementById("sample6_extraAddress").value = extraAddr;
								addr += extraAddr;

							} else {
								//document.getElementById("sample6_extraAddress").value = '';
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							//document.getElementById('sample6_postcode').value = data.zonecode;
							//document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							$(".address_input_1").val(data.zonecode);
							$(".address_input_2").val(addr);

							//  document.getElementById("sample6_detailAddress").focus();

							// 상세주소 입력란 disabled 속성 변경 및 커서를 상세주소 필드로 이동한다.
							$(".address_input_3").attr("readonly", false);
							$(".address_input_3").focus();
						}
					}).open();
		}

</script>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>