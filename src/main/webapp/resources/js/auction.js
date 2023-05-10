/**
 * 
 */

 function priceCheck(){
	 if(document.frm.price.value.length ==0){
		alert("입찰가를 입력하세요.");
		return false;
	}
	if(document.frm.price.value < document.frm.currentPrice.value ){
		alert("현재가보다 높은 가격을 입력해야합니다.")
		return false;
	}
	return true;
 }