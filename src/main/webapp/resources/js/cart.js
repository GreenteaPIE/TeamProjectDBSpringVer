/*
function validateForm1() {
	var purchasedNum = parseInt(document.forms["frm"]["purchasedNum"].value);
	if (purchasedNum <= 0) {
		alert("구매 수량은 1 이상이어야 합니다.");
		return false;
	}
	
}

function checkSelectAll() { // 0414 정자윤 추가사항
	// 전체 체크박스
	const checkboxes
		= document.querySelectorAll('input[name="cartNum"]');
	// 선택된 체크박스
	const checked
		= document.querySelectorAll('input[name="cartNum"]:checked');
	// select all 체크박스
	const cartNum
		= document.querySelector('input[name="cartNum"]');

	if (checkboxes.length === checked.length) {
		cartNum.checked = true;
	} else {
		cartNum.checked = false;
	}

}

function selectAll(cartNum) { // 0414 정자윤 추가사항
	const checkboxes
		= document.getElementsByName('cartNum');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = cartNum.checked
	})
}





function minus(cartNum) {
		var quantity = parseInt(document.getElementById("quantity-" + cartNum).textContent);
		if (quantity > 1) {
			quantity--;
			document.getElementById("quantity-" + cartNum).textContent = quantity;
			updateCart(cartNum, quantity);
		}
	}

	function plus(cartNum) {
		var quantity = parseInt(document.getElementById("quantity-" + cartNum).textContent);
		quantity++;
		document.getElementById("quantity-" + cartNum).textContent = quantity;
		updateCart(cartNum, quantity);
	}
	function calculateSubPrice() {
	var totalPrice = 0;
	var checkboxes = document.querySelectorAll();
	for (var i = 0; i < checkboxes.length; i++) {
		var row = checkboxes[i].parentNode.parentNode;
		var price = row.cells[5].textContent;
		totalPrice += parseInt(price.replace(/[^0-9]/g, ""));
	}
	document.getElementById("subPrice").textContent = totalPrice.toLocaleString() + "원";
}

 */




function setPSize() {
	var radios = document.getElementsByName('psize');
	var pSize;
	for (var i = 0; i < radios.length; i++) {
		if (radios[i].checked) {
			pSize = radios[i].value;
			break;
		}
	}
	document.getElementsByName("pSize")[0].value = pSize;
}


