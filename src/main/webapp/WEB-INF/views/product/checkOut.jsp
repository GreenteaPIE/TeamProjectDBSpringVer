<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
	<form action="/product/purchased" method="post" name="frm" id="frm">
		<!-- 가지고 넘어가야 할 값들 
		cart = psize, num, quantity, price, cartnum -> 0 으로 변경
		product = imgurl, pname
		coupon = cnum -> 0으로 변경
		user = userid
		totalprice
		 -->
		
		<input type="hidden" name="userid" value="${user.userid }">
		
		<input type="hidden" name="totalprice" value="3000">
		<!-- pname 과 imgurl 은 num(product)를 가져가서 productvo에서 불러오기 -->
		<input type="hidden" name="cnum" value="3">
		<!-- cnum 쿠폰등록 번호 를 가져가서 result ->0 로 변경하기 -->
		
		<div class="container-fluid pt-5">
			<div class="row px-xl-5">
				<div class="col-lg-8">
					<div class="mb-4">
						<h4 class="font-weight-semi-bold mb-4">Billng Address</h4>
						<div class="row">
							<div class="col-md-6 form-group">
								<label>이름</label> <input class="form-control" type="text" name="name" value="${user.name }" readonly>
							</div>
							<div class="col-md-6 form-group">
								<label>E-mail</label> <input class="form-control" type="text" name="email" value="${user.email }" readonly>
							</div>
							<div class="col-md-6 form-group">
								<label>전화번호</label> <input class="form-control" type="text" name="phone" value="${user.phone }" readonly>
							</div>
							<div class="col-md-6 form-group">
								<label>우편번호</label> <input class="form-control" type="text" name="address1" value="${user.address1 }" readonly>
							</div>
							<div class="col-md-6 form-group">
								<label>주소</label> <input class="form-control" type="text" name="address2" value="${user.address2 }" readonly>
							</div>
							<div class="col-md-6 form-group">
								<label>상세주소</label> <input class="form-control" type="text" name="zipcode" value="${user.address3 }" readonly>
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
							<c:forEach var="cart" items="${clist}">
								<c:forEach var="plist" items="${plist}">
									<c:if test="${cart.num == plist.num}">
										<div class="d-flex justify-content-between">
											<p>${plist.pname}</p>
											<p>
												<fmt:setLocale value="ko_KR" />
												<fmt:formatNumber type="currency" value="${cart.price * cart.quantity}" currencySymbol="₩" />
											</p>
										</div>
										<input type="hidden" name="pname" value="${plist.pname}">
										<input type="hidden" name="imgurl" value="${plist.imgUrl}">
										<input type="hidden" name="psize" value="${cart.psize }">
										<input type="hidden" name="quantity" value="${cart.quantity }">
										<input type="hidden" name="num" value="${cart.num }">
										<input type="hidden" name="cartnum" value="${cart.cartnum }">
										<!-- cartnum 을 가져가서 result -> 0으로 변경하기 -->
										<input type="hidden" name="price" value="${cart.price }">
										<!-- 할인된 가격은 cart에 저장되어있기 때문에 주문상세에서 불러오려면 cart에 저장된 price를 들고가야함 -->
										<c:set var="subprice" value="${subprice + cart.price * cart.quantity}" />
									</c:if>
								</c:forEach>
							</c:forEach>
							<br>
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
									<input id="total" type="hidden" name="totalprice" value="${subprice}">
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
							<select name="coupon" class="select-no-outline">
								<c:forEach var="coup" items="${couplist}">
									<c:if test="${coup.couponresult != 0 }">
										<option value="${coup.discountprice}" data-num="${coup.cnum}">${coup.couponname}</option>
									</c:if>
								</c:forEach>
							</select>
						</div>
						<div class="input-group-append">
							<button class="btn btn-primary">Select Coupon</button>
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
							<button class="btn btn-lg btn-block btn-primary font-weight-bold my-3 py-3" id="checkout-button">Place Order</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!--Checkout End -->
	<script>
const shiptoCheckbox = document.getElementById('shipto');
const paymentRadios = document.getElementsByName('payment');
const placeOrderBtn = document.getElementById('checkout-button');

placeOrderBtn.addEventListener('click', function(event) {
  event.preventDefault(); // 폼 제출을 막음

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

function numberWithCommas(x) {
	  return x.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
	}

	$(document).ready(function () {
	  $("button.btn.btn-primary").on("click", function (e) {
	    e.preventDefault();

	    var discountPrice = parseFloat($("select[name='coupon']").val());
	    var coupNum = $("select[name='coupon'] option:selected").data("cnum");
	    var subPrice = parseFloat(
	      $("#subtotalPrice").text().replace(/[^0-9.]/g, "")
	    );
	    var totalPrice = parseFloat(
	      $("#totalDisplayPrice").text().replace(/[^0-9.]/g, "")
	    );

	    if (subPrice - discountPrice < 0) {
	      alert("상품 가격 보다 높은 할인쿠폰을 사용 하실 수 없습니다");
	      $("select[name='coupon']").prop("selectedIndex", 0);
	    } else {
	      var newTotalPrice = subPrice - discountPrice;

	      // Update the discount price
	      $("#DiscountPrice").html(
	        "₩" + numberWithCommas(discountPrice.toFixed(0))
	      );

	      $("#subtotalPrice").html("₩" + numberWithCommas(subPrice.toFixed(0)));
	      $("#totalDisplayPrice").html(
	        "₩" + numberWithCommas(newTotalPrice.toFixed(0))
	      );
	      $("#total").val(newTotalPrice);

	      // Assign the coupNum value to the input field with the 'cnum' name
	      $("input[name='cnum']").val(coupNum);
	    }
	  });
	});
</script>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>