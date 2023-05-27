<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<jsp:include page="../header.jsp"></jsp:include>
<body>
	<hr>
	<script type="text/javascript" src="../js/freeboard.js"></script>
	<script src="//cdn.ckeditor.com/4.21.0/standard/ckeditor.js"></script>
	<div class="container">
		<form action="/board/enroll" name="frm" method="post" enctype="multipart/form-data">
			<div class="row">
				<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시글 등록</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td colspan="1"><select name="category" id="categorySelect">
									<option value="F">자유게시판</option>
									<option value="Q">질문게시판</option>
									<c:if test="${user.userid eq 'admin'}">
										<option value="S">공지사항</option>
									</c:if>
							</select></td>
							<td colspan="1">작성자  <input type="hidden" class="form-control" name="userid" value="${user.userid }">${user.userid }
							</td>
						</tr>
						<tr>
							<td colspan="2"><input type="text" class="form-control" placeholder="글 제목" name="title" maxlength="50"></td>
						</tr>
						<tr>
							<td colspan="2"><textarea id="content" name="content" class="form-control" placeholder="글 내용"></textarea></td>
						</tr>
					</tbody>
				</table>
			</div>
			<div style="margin-left: 30px;">
				<input type="button" class="btn btn-primary pull-right" value="등록" onclick="if(boardCheck()) go_fbw();">&nbsp;&nbsp;<input type="button" class="btn btn-primary pull-right" value="목록" onclick="history.back(-1)">
			</div>
		</form>
	</div>
	<script type="text/javascript">
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
