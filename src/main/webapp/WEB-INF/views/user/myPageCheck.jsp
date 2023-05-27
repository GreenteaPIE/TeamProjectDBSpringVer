<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
<%@ include file="../header.jsp"%>
</head>
<body>
	<hr>
	<form id="infochk_form" method="post">
		<div class="form-group input-group fg-x700">
			<div class="col-lg-4"></div>
			<div class="col-lg-4">
				<div class="jumbotron" style="padding-top: 20px;">
					<h3 style="text-align: center;">정보 확인</h3>
					<div class="form-group">
						<input type="text" class="form-control id_input" placeholder="아이디" name="userid" value="${user.userid }" maxlength="20" readonly="readonly">
					</div>
					<div class="form-group">
						<input type="password" class="form-control pw_input" placeholder="비밀번호" name="pass" maxlength="20">
					</div>
					<input type="button" class="btn btn-primary form-control info_chk_btn" value="확인"> <input type="reset" class="btn btn-primary form-control" value="취소">
					<hr>
					<c:if test="${result==0}">
						<div class="login_warn">ID 또는 비밀번호를 잘못 입력 하셨습니다.</div>
					</c:if>
				</div>
			</div>
			<div class="col-lg-4"></div>
		</div>
	</form>
	<script>
		/* 로그인 버튼 클릭 */
		$(".info_chk_btn").click(function() {
			//alert("로그인 버튼 작동");

			// 로그인 메서드 서버 요청
			$("#infochk_form").attr("action", "/user/mypagechk");
			$("#infochk_form").submit();
		});
	</script>
	<hr>
</body>
<%@ include file="../footer.jsp"%>
</html>