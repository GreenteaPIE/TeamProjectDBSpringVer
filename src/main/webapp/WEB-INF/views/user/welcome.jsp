<!DOCTYPE html><%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
<title>Welcome</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet" />
<style>
body {
	background-color: white;
	color: #333333;
	font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
}

.hw, .pw {
	color: black;
}

.welcomecontainer {
	text-align: center;
	margin: 0 auto;
}

.btn-w {
	background-color: #333333;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.btn-w:hover {
	background-color: #666666;
	color: white;
}
</style>
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<div class="welcomecontainer">
		<h1 class="hw">DB의 파트너가 되신걸 환영합니다.</h1>
		<p class="pw">회원 가입이 완료되었습니다.</p>
		<div style="width: 100%; height: 400px;">
			<img src="../resources/img/welcome.png" alt="Welcome Image" style="width: 100%; height: 400px;">
		</div>
		<br> <br>
		<div class="d-inline-flex">
			<a href="/">
				<input type="button" class="btn-w" value="확인">
			</a>
		</div>
	</div>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
