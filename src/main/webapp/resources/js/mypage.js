/**
 * 
 */


//function openModal() {
//	
//	var myModal = new bootstrap.Modal(document.getElementById('passCheckModal'))
//	myModal.show()
//}

function openPassCheckModal() {
	var modal = document.getElementById("passCheckModal");
	modal.style.display = "block";
}

function closePassCheckModal() {
	var modal = document.getElementById("passCheckModal");
	modal.style.display = "none";
	document.frmModal.pass.value = "";
}

function sha256(plain) {
    const encoder = new TextEncoder();
    const data = encoder.encode(plain);
    return crypto.subtle.digest('SHA-256', data).then(buffer => {
        return Array.prototype.map.call(new Uint8Array(buffer), x => ('00' + x.toString(16)).slice(-2)).join('');
    });
}

function passwordCheck() {
    const inputPass = document.getElementById('pass').value;
    sha256(inputPass).then(hashedPass => {
        const loginUser = JSON.parse(sessionStorage.getItem('loginUser'));
        if (hashedPass === loginUser.pass) {
            document.frmModal.submit();
            
           location.href = 'DBServlet?command=user_info'; 
        } else {
            alert('비밀번호가 일치하지 않습니다.');
        }
    });
}




function passconf() {
	const password = document.getElementById('pass');
	const confirmPassword = document.getElementById('pass-conf');
	const invalidFeedback = confirmPassword.querySelectorAll('.invalid-feedback');

	confirmPassword.onchange = function() {
		if (confirmPassword.value !== password.value) {
			confirmPassword.setCustomValidity('비밀번호가 일치하지 않습니다.');
			invalidFeedbacks[1].style.display = 'block';
			invalidFeedbacks[2].style.display = 'none';
		} else if (confirmPassword.value.length == 0) {
			confirmPassword.setCustomValidity('비밀번호 확인을 입력해주세요.');
			invalidFeedbacks[1].style.display = 'none';
			invalidFeedbacks[2].style.display = 'block';
			//		} else if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(confirmPassword.value)) {
			//			confirmPassword.setCustomValidity('비밀번호는 영문 대소문자와 숫자를 모두 포함해야 합니다.');
			//			invalidFeedbacks[0].style.display = 'none';
			//			invalidFeedbacks[1].style.display = 'block';
		} else {
			confirmPassword.setCustomValidity('');
			invalidFeedbacks[0].style.display = 'none';
			invalidFeedbacks[1].style.display = 'none';
		}
	};

	var accordions = document.querySelectorAll('#accordion .card-header button');

	for (var i = 0; i < accordions.length; i++) {
		accordions[i].addEventListener('click', function() {
			var parent = this.parentElement.parentElement;
			var body = this.nextElementSibling;

			if (parent.classList.contains('active')) {
				parent.classList.remove('active');
				body.style.maxHeight = null;
			} else {
				for (var j = 0; j < accordions.length; j++) {
					accordions[j].parentElement.parentElement.classList.remove('active');
					accordions[j].nextElementSibling.style.maxHeight = null;
				}

				parent.classList.add('active');
				body.style.maxHeight = body.scrollHeight + 'px';
			}
		});
	}
	
	

	


}