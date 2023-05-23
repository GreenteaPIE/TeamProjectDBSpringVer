function plus() {
			// input 태그 가져오기
			var quantityInput = document.getElementsByName("quantity")[0];
			// 수량 증가
			var quantity = parseInt(quantityInput.value);
			quantityInput.value = quantity + 0;
			// form 제출 방지
			event.preventDefault();
		}
		function minus() {
			// input 태그 가져오기
			var quantityInput = document.getElementsByName("quantity")[0];
			// 수량 감소
			var quantity = parseInt(quantityInput.value);
			if (quantity > 1) {
				quantityInput.value = quantity - 0;
			}
			// form 제출 방지
			event.preventDefault();
		}
		