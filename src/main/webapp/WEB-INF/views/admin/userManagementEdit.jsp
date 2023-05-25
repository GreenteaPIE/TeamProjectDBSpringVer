<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- 
<link rel="stylesheet" type="text/css" href="css/shopuserTheme.css">
<script type="text/javascript" src="..resources/js/shopuser.js"></script>
 -->
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div id="wrap" align="center">
		<h1>유저 정보 수정</h1>
		<form action="userEditComplete.do" method="post" name="frm">
			<table class="list">
				<tr>
					<th>아이디</th>
					<td><input name="userid" value="${shopUser.userid }" readonly="readonly"></td>
					<th>비밀번호</th>
					<td><input type="text" name="pass" value="${shopUser.pass }" readonly="readonly"></td>
					<th>이름</th>
					<td><input type="text" name="name" value="${shopUser.name }" required="required"></td>
				</tr>
				<tr>
					<th>성별</th>
					<c:choose>
						<c:when test="${shopUser.gender ==1}">
							<td><input type="radio" name="gender" value="1" checked="checked"> 남자 <input type="radio" name="gender" value="2"> 여자</td>
						</c:when>
						<c:otherwise>
							<td><input type="radio" name="gender" value="1"> 남자 <input type="radio" name="gender" value="2" checked="checked"> 여자</td>
						</c:otherwise>
					</c:choose>
					<th>이메일</th>
					<td><input type="email" name="email" value="${shopUser.email }"></td>
					<th>등급</th>
					<td><select name="grade">
							<c:choose>
								<c:when test="${shopUser.grade == 0 }">
									<option value="1">관리자</option>
									<option value="0" selected="selected">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4">VIP</option>
									<option value="5">VVIP</option>
								</c:when>
								<c:when test="${shopUser.grade == 1 }">
									<option value="1" selected="selected">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4">VIP</option>
									<option value="5">VVIP</option>
								</c:when>
								<c:when test="${shopUser.grade == 2 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2" selected="selected">실버</option>
									<option value="3">골드</option>
									<option value="4">VIP</option>
									<option value="5">VVIP</option>
								</c:when>
								<c:when test="${shopUser.grade == 3 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3" selected="selected">골드</option>
									<option value="4">VIP</option>
									<option value="5">VVIP</option>
								</c:when>
								<c:when test="${shopUser.grade == 4 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4" selected="selected">VIP</option>
									<option value="5">VVIP</option>
								</c:when>
								<c:when test="${shopUser.grade == 5 }">
									<option value="1">관리자</option>
									<option value="0">브론즈</option>
									<option value="2">실버</option>
									<option value="3">골드</option>
									<option value="4">VIP</option>
									<option value="5" selected="selected">VVIP</option>
								</c:when>
							</c:choose>
					</select></td>
				</tr>
				<tr>
					<th>주소</th>
					<td><input type="text" name="address1" value="${shopUser.address1 }"></td>
					<th>상세 주소</th>
					<td><input type="text" name="address2" value="${shopUser.address2 }"></td>
					<th>우편번호</th>
					<td><input type="text" name="address3" value="${shopUser.address3 }"></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="phone" value="${shopUser.phone }" placeholder="01012341234"></td>
					<th>포인트</th>
					<td><input type="text" name="point" value="${shopUser.point }"></td>
					<th>가입일자</th>
					<td><fmt:formatDate value="${shopUser.enter }" /></td>
				</tr>
			</table>
			<input class="modify" value="수정" type="submit">
		</form>
	</div>
</body>
</html>