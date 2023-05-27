<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<jsp:include page="../header.jsp"></jsp:include>
<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
</head>
<body>
	<hr>
	<div class="container">
		<form id="modifyForm" action="/board/modify" name="frm" method="post">
			<input type="hidden" name="num" value='<c:out value="${pageInfo.num}"/>'>
			<div class="row">
				<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 수정</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="1">작성자  <input type="hidden" class="form-control" name="userid" value="${pageInfo.userid }">${pageInfo.userid }
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="form-control" placeholder="${pageInfo.title}" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td>내용 <textarea class="form-control" id="content" name="content" style="height: 350px;"><c:out value="${pageInfo.content}" /></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="display: flex; justify-content: space-between;">
				<div style="margin-left: 30px;">
					<input id="modify_btn" type="button" class="btn btn-primary" value="등록">
					&nbsp;&nbsp; &nbsp;&nbsp;
					<input id="list_btn" type="button" class="btn btn-primary" value="목록">
				</div>
				<div>
					<input id="delete_btn" class="btn btn-primary" value="삭 제">
				</div>
			</div>
		</form>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="num" name="num" value='<c:out value="${pageInfo.num}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type}">
		<input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
	<script>
		let form = $("#infoForm"); // 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
		let mForm = $("#modifyForm"); // 페이지 데이터 수정 from

		/* 목록 페이지 이동 버튼 */
		$("#list_btn").on("click", function(e) {
			form.find("#num").remove();
			form.attr("action", "/board/list");
			form.submit();
		});

		/* 수정 하기 버튼 */
		$("#modify_btn").on("click", function(e) {
			mForm.submit();
		});

		/* 취소 버튼 */
		$("#cancel_btn").on("click", function(e) {
			form.attr("action", "/board/get");
			form.submit();
		});

		/* 삭제 버튼 */
		$("#delete_btn").on("click", function(e) {
			// 확인 메시지 추가
			if (confirm("게시글을 삭제 하시겠습니까?")) {
				form.attr("action", "/board/delete");
				form.attr("method", "post");
				form.submit();
			}
		});

		// 글쓰기 editor 및 사진 업로드 기능
		CKEDITOR.replace('content', {
			filebrowserUploadUrl : '/board/imageUpload.do',
			height : 500
		// Set the desired height value here
		});
	</script>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
