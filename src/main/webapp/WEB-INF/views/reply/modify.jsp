<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판 상세보기</title>
<!-- Libraries Stylesheet -->
<link href="../css/owl.carousel.min.css" rel="stylesheet">
<!-- Customized Bootstrap Stylesheet -->
<link href="../resources/css/style.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous">
	
</script>
</head>
</head>
<body>
	<form method="post" action="/reply/modify">
		<div class="container">
			<div class="form-group">
				<label for="writer">댓글 작성자</label> <input type="text" class="form-control" name="writer" id="writer" readonly="readonly" value="${reply.writer}">
			</div>
			<div class="form-group">
				<label for="content">댓글 내용</label>
				<textarea class="form-control" rows="5" name="content" id="content">${reply.content}</textarea>
			</div>
			<div class="form-group">
				<input type="hidden" name="num" value="${reply.num}"> <input type="hidden" name="rno" value="${reply.rno}">
			</div>
			<button type="submit" class="btn btn-primary">댓글 수정</button>
		</div>
	</form>
	<script>
		function closeWindowAndRefreshParent(ev) {
			ev.preventDefault();
			fetch('/reply/modify', {
				method : 'POST',
				headers : {
					'Content-Type' : 'application/x-www-form-urlencoded'
				},
				body : new URLSearchParams(new FormData(ev.target))
			}).then(function(response) {
				if (response.ok) {
					window.opener.location.reload();
					window.close();
				} else {
					alert('댓글 수정 실패');
				}
			});
		}

		document.querySelector("form").addEventListener("submit",
				closeWindowAndRefreshParent);
	</script>
</body>
</html>
