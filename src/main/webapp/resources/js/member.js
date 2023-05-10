function go_save() {
  
   if (!checkName(formm.name.value)) {
            return false;
        }
  if (!checkUserId(formm.userid.value)) {
            return false;
        }
       
        if (!checkMail(formm.email.value)) {
            return false;
        }
          if (!checkPhone(formm.phone.value)) {
            return false;   
             
        }  if (!checkPassword(formm.userid.value, formm.pass.value,  formm.passCheck.value)) {
            return false;
        }
        
     
	  alert("DB에 가입하신 것을 축하드립니다.");
	return true;
	
}
    

        
   
   
   
  
    // 공백확인 함수
    function checkExistData(value, dataName) {
        if (value == "") {
            alert(dataName + " 입력해주세요!");
            return false;
        }
        return true;
    }
 
    function checkUserId(userid) {
        //Id가 입력되었는지 확인하기
        if (!checkExistData(userid, "아이디를"))
            return false;
 
        var idRegExp = /^[a-zA-z0-9]{4,12}$/; //아이디 유효성 검사
        if (!idRegExp.test(userid)) {
            alert("아이디는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            formm.userid.value = "";
            formm.userid.focus();
            return false;
        }
        if (document.formm.reid.value.length == 0) {
		alert("ID중복 체크를 하지 않았습니다.");
		frm.userid.focus();
		return false;
		}
		
        return true; //확인이 완료되었을 때
    }
 
    function checkPassword(userid, pass, passCheck) {
        //비밀번호가 입력되었는지 확인하기
        if (!checkExistData(pass, "비밀번호를"))
            return false;
        //비밀번호 확인이 입력되었는지 확인하기
        if (!checkExistData(passCheck, "비밀번호 확인을"))
            return false;
 
        var password1RegExp = /^[a-zA-z0-9]{4,12}$/; //비밀번호 유효성 검사
        if (!password1RegExp.test(pass)) {
            alert("비밀번호는 영문 대소문자와 숫자 4~12자리로 입력해야합니다!");
            formm.pass.value = "";
            formm.passCheck.focus();
            return false;
        }
        //비밀번호와 비밀번호 확인이 맞지 않다면..
        if (pass != passCheck) {
            alert("두 비밀번호가 맞지 않습니다.");
            formm.pass.value = "";
            formm.passCheck.value = "";
            formm.passCheck.focus();
            return false;
        }
 
        //아이디와 비밀번호가 같을 때..
        if (userid == pass) {
            alert("아이디와 비밀번호는 같을 수 없습니다!");
            formm.pass.value = "";
            formm.passCheck.value = "";
            formm.passCheck.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    function checkMail(email) {
        //mail이 입력되었는지 확인하기
        if (!checkExistData(email, "이메일을"))
            return false;
 
        var emailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
        if (!emailRegExp.test(email)) {
            alert("이메일 형식이 올바르지 않습니다!");
            formm.email.value = "";
            formm.email.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
    }
 
    function checkName(name) {
        if (!checkExistData(name, "이름을"))
            return false;
 
        var nameRegExp = /^[가-힣]{2,4}$/;
        if (!nameRegExp.test(name)) {
            alert("이름이 올바르지 않습니다.");
            return false;
        }
        return true; //확인이 완료되었을 때
    }
    function checkPhone(phone) {
        //phone가 입력되었는지 확인하기
        if (!checkExistData(phone, "전화번호를"))
            return false;
 
        var phoneRegExp = /^[0-9]{4,20}$/; //전화번호 유효성 검사
        if (!phoneRegExp.test(phone)) {
            alert("전화번호는 숫자로 입력해야합니다!");
            formm.phone.value = "";
            formm.phone.focus();
            return false;
        }
        return true; //확인이 완료되었을 때
        
    }
 
    
    function submitForm() {
    if (checkUserId(document.formm.userid.value)) {
        document.formm.submit();
    }
}
    
 


function idcheck() {
  if (document.formm.userid.value == "") {
    alert('아이디를 입력해주세요.');
    document.formm.userid.focus();
    return;
  }
  var url = "DBServlet?command=id_check_form&id=" 
+ document.formm.userid.value;
  window.open( url, "_blank_1",
"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=330, height=200");
}



