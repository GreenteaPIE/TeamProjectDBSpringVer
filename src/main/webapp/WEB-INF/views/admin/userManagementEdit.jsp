<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link href="../resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" align="center">
		<h1>유저 정보 수정</h1>
		<form action="userEditComplete.do" method="post" name="frm" id="frm">
			<table class="table">
				<tr>
					<th>아이디</th>
					<td><input type="text" class="form-control" name="userid" value="${shopUser.userid }" readonly="readonly"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="text" class="form-control" name="pass" id="passwordField" value="${shopUser.pass}" data-value="${shopUser.pass}" readonly="readonly"></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" class="form-control" name="name" value="${shopUser.name }" required="required"> <c:choose>
							<c:when test="${shopUser.gender ==1}">
								<td><input type="radio" name="gender" value="1" checked="checked"> 남자 <input type="radio" name="gender" value="2"> 여자</td>
							</c:when>
							<c:otherwise>
								<td><input type="radio" name="gender" value="1"> 남자 <input type="radio" name="gender" value="2" checked="checked"> 여자</td>
							</c:otherwise>
						</c:choose></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input type="email" class="form-control" name="email" value="${shopUser.email }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" class="form-control" name="phone" value="${shopUser.phone }" placeholder="01012341234"></td>
				</tr>
				<tr>
					<th>포인트</th>
					<td><input type="text" class="form-control" name="point" value="${shopUser.point }"></td>
					</tr>
					<tr>
					<th>등급</th>
					<td><select name="grade">
							<c:choose>
								<c:when test="${shopUser.grade == 0 }">
									<option value="1">관리자</option>
									<option value="0" selected="selected">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4">다이아</option>
								</c:when>
								<c:when test="${shopUser.grade == 1 }">
									<option value="1" selected="selected">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4">다이아</option>
								</c:when>
								<c:when test="${shopUser.grade == 2 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2" selected="selected">실버</option>
									<option value="3">골드</option>
									<option value="4">다이아</option>
								</c:when>
								<c:when test="${shopUser.grade == 3 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3" selected="selected">골드</option>
									<option value="4">다이아</option>
								</c:when>
								<c:when test="${shopUser.grade == 4 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4" selected="selected">다이아</option>
								</c:when>
							</c:choose>
					</select></td>
				</tr>
				<tr>
					<th>우편번호</th>
					<td><input type="text" class="form-control" name="address1" value="${shopUser.address1 }"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" class="form-control" name="address2" value="${shopUser.address2 }"></td>
					<td><input type="text" class="form-control" name="address3" value="${shopUser.address3 }"></td>
				</tr>
				<tr>
					<th>가입일자</th>
					<td><fmt:formatDate value="${shopUser.enter }" /></td>
				</tr>
			</table>
			<input type="submit" class="btn btn-primary" value="수정">
		</form>
	</div>
	<script>
		$(document).ready(function() { // 비밀번호 필드의 원래 값 가져오기 
			var passwordField = $("#passwordField"); var passwordText = passwordField.val();
			// 비밀번호 필드의 값을 별표 문자로 교체
			var obscuredPassword = '*'.repeat(passwordText.length);
			passwordField.val(obscuredPassword);

			// 폼 제출 이벤트 처리
			$('#frm').submit(function(event) {
				event.preventDefault(); // 기본 제출 동작을 막습니다.

				passwordField.val(passwordText); // 전송 전 원래 비밀번호로 복원
				var formData = $(this).serialize(); // 폼 데이터를 직렬화합니다.
				passwordField.val(obscuredPassword); // 전송 후 별표 문자로 다시 변경

				// AJAX 요청
				$.ajax({
					url : '/admin/userEditComplete.do',
					type : 'post', // POST 방식으로 변경
					data : formData,
					success : function(response) {
						if (response == 'success') {
							alert("수정 완료");
							window.close();
							if (window.opener && !window.opener.closed) {
								window.opener.location.reload();
							}
						}
					},
					error : function(xhr, status, error) {
						// Ajax 요청이 실패했을 때 실행되는 콜백 함수입니다.
						console.error('오류가 발생했습니다:', error);
					}
				});
			});
		});
	</script>
</body>
</html>