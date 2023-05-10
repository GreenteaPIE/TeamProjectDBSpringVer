/**
 * 
 */
function calculateTotalPrice() {
	var totalPrice = 0;
	var checkboxes = document.querySelectorAll("#cartTable tbody input[type='checkbox']:checked");
	for (var i = 0; i < checkboxes.length; i++) {
		var row = checkboxes[i].parentNode.parentNode;
		var price = row.cells[2].textContent;
		totalPrice += parseInt(price.replace(/[^0-9]/g, ""));
	}
	document.getElementById("totalPrice").textContent = totalPrice.toLocaleString() + "원";
}

function go_cart() {
	if (document.frm.purchasedNum.value == "0") {
		alert("수량을 입력하여 주세요.");
		document.frm.purchasedNum.focus();
		return false;
	} else {
		document.frm.action = "DBServlet?command=add_cart";
		document.frm.submit();
	}
	
}