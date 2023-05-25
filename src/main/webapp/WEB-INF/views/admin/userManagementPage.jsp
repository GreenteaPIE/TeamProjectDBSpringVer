<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>유저 관리 페이지</title>
<style>
.list {
	width: 70%;
	border: none;
	table-layout: auto;
}

th {
	border: solid 1px gray;
	border-collapse: collapse;
	min-width: 100px;
	text-align: center;
}

td {
	border: solid 1px #0e0e0e;
	border-collapse: collapse;
	width: 100px;
	white-space: nowrap; /* 줄바꿈 방지 */
	overflow: hidden; /* 넘치는 부분 감추기 */
	text-overflow: ellipsis;
	width: 100px; /* 생략 부호(...)로 대체 */
	text-align: center;
}

.hiddentd {
	width: 100px;
	border: none;
	text-align: center;
}

.hiddenbutton {
	display: none;
}

.button:hover {
	background-color: pink;
	font-weight: 600;
}

tr:hover .hiddenbutton {
	display: block;
}

tr:hover .hiddentd {
	background-color: white;
}

.point {
	width: 10px;
}
</style>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div id="wrap" align="center">
		<h1>회원 목록</h1>
		<table class="list">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>성별</th>
				<th>이메일</th>
				<th>주소</th>
				<th>상세 주소</th>
				<th>우편번호</th>
				<th>전화번호</th>
				<th>등급</th>
				<th style="width: 50px;">포인트</th>
				<th>가입일자</th>
				<td style="border: none; color: white;">b u t t o n</td>
			</tr>
			<c:forEach var="shopUser" items="${shopUser }">
				<tr class="button">
					<td>${shopUser.userid }</td>
					<td>${shopUser.name }</td>
					<c:choose>
						<c:when test="${shopUser.gender==1}">
							<td>남자</td>
						</c:when>
						<c:when test="${shopUser.gender==2}">
							<td>여자</td>
						</c:when>
					</c:choose>
					<td>${shopUser.email }</td>
					<td>${shopUser.address1 }</td>
					<td>${shopUser.address2 }</td>
					<td>${shopUser.address3 }</td>
					<td>${shopUser.phone }</td>
					<c:choose>
						<c:when test="${shopUser.grade == 0 }">
							<td>브론즈</td>
						</c:when>
						<c:when test="${shopUser.grade == 1 }">
							<td>관리자</td>
						</c:when>
						<c:when test="${shopUser.grade == 2 }">
							<td>골드</td>
						</c:when>
						<c:when test="${shopUser.grade == 3 }">
							<td>플래티넘</td>
						</c:when>
						<c:when test="${shopUser.grade == 4 }">
							<td>VIP</td>
						</c:when>
						<c:when test="${shopUser.grade == 5 }">
							<td>VVIP</td>
						</c:when>
						<c:otherwise>
							<td>관리자</td>
						</c:otherwise>
					</c:choose>
					<td>${shopUser.point }</td>
					<td><fmt:formatDate value="${shopUser.enter }" /></td>
					<td class="hiddentd"><input type="button" class="btn-primary px-3 hiddenbutton" value="수정" onclick="open_win('/admin/userManagementEdit?userid=${shopUser.userid }')"> <input type="button" class="btn-primary px-3 delete hiddenbutton" value="삭제" onclick="location.href='/admin/userDelete?shopUserid=${shopUser.userid }'"></td>
				</tr>
			</c:forEach>
		</table>
		<br>
	</div>
	<hr>
	<script>
		function open_win(url) {
			// 새 창의 속성들을 설정하는 문자열입니다.
			var specs = "width=900,height=500,left=500,top=500";

			// 새 창을 엽니다.
			window.open(url, "_blank", specs);
		}
		
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
