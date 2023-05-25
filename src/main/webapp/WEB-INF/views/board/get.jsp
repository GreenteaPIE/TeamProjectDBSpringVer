<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<script type="text/javascript" src="../js/freeboard.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div class="container">
		<div class="row">
			<table class="table" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
						<c:if test="${pageInfo.category eq 'F'}">
							<th colspan="4" style="background-color: #eeeeee; text-align: left;">
								<h4 style="font-family: sans-serif; font-weight: 600; margin: 0; padding: 0;">
									<span style="color: #333; margin-left: 30px;">자유 게시판</span>
								</h4>
							</th>
						</c:if>
						<c:if test="${pageInfo.category eq 'Q'}">
							<th colspan="4" style="background-color: #eeeeee; text-align: left;">
								<h4 style="font-family: sans-serif; font-weight: 600; margin: 0; padding: 0;">
									<span style="color: #333; margin-left: 30px;">질문 게시판</span>
								</h4>
							</th>
						</c:if>
						<c:if test="${pageInfo.category eq 'S'}">
							<th colspan="4" style="background-color: #eeeeee; text-align: left;">
								<h4 style="font-family: sans-serif; font-weight: 600; margin: 0; padding: 0;">
									<span style="color: #333; margin-left: 30px;">공지사항</span>
								</h4>
							</th>
						</c:if>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="text-align: left;" colspan="3"><span style="margin-left: 30px; font-size: 20px; font: bold;">${pageInfo.title}</span></td>
					</tr>
					<tr>
						<td style="text-align: left;"><span style="margin-left: 30px;">
								<c:out value="${pageInfo.userid}" />
								&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;
								<fmt:formatDate pattern="yyyy. MM. dd. HH:mm" value="${pageInfo.writedate}" />
							</span></td>
						<td colspan="1" style="text-align: right;"><span style="margin-right: 30px;">조회 ${pageInfo.readcount} &nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; 댓글 ${reply_Count}</span></td>
					</tr>
					<tr style="height: 500px;">
						<td colspan="4" style="text-align: left;"><span style="margin-left: 30px;">${pageInfo.content}</span>
					</tr>
				</tbody>
			</table>
		</div>
		<hr />
		<ol>
			<c:forEach items="${reply}" var="reply">
				<li>
					<div>
						<div class="d-flex justify-content-between">
							<p>${reply.writer}</p>
							<p>
								<fmt:formatDate value="${reply.regDate}" pattern="yyyy. MM. dd. HH:mm" />
							</p>
						</div>
						<p>${reply.content }</p>
						<c:if test="${reply.writer eq user.userid or user.userid eq 'admin'}">
							<p class="text-right">
								<a href="#" onclick="openModifyWindow('${pageInfo.num}', '${reply.rno}')" class="text-decoration-none">
									<button type="button" class="btn btn-sm btn-secondary text-right">수정</button>
								</a>
								<a href="/reply/delete?num=${pageInfo.num}&rno=${reply.rno}" class="text-decoration-none">
									<button type="button" class="btn btn-sm btn-primary text-right">삭제</button>
								</a>
							</p>
						</c:if>
						<hr />
					</div>
				</li>
			</c:forEach>
		</ol>
		<div>
			<form method="post" action="/reply/write" class="mt-3">
				<div class="row mb-3">
					<div class="col">
						<label for="writer" class="form-label">댓글 작성자</label> <input type="hidden" class="form-control" name="writer" id="writer" value="${user.userid}">
						<span>${user.userid}</span>
						<c:if test="${empty user.userid}">
							<b>로그인 필요</b>
						</c:if>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<label for="content" class="form-label">댓글 내용</label>
						<textarea id="content" name="content" class="form-control" rows="5"></textarea>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<c:if test="${not empty user.userid}">
							<input type="hidden" name="num" value="${pageInfo.num}">
							<button type="submit" class="btn btn-primary">댓글 작성</button>
						</c:if>
						<c:if test="${empty user.userid}">
							<input type="hidden" name="num" value="${pageInfo.num}">
							<button onclick="alert('로그인 후에 이용이 가능합니다.'); return false;" class="btn btn-primary">댓글 작성</button>
						</c:if>
					</div>
				</div>
			</form>
		</div>
	</div>
	<div class="text-center mt-3">
		<c:if test="${pageInfo.userid eq user.userid or user.userid eq 'admin'}">
			<button class="btn btn-primary" id="modify_btn">게시글 수정</button>
		</c:if>
		<button class="btn btn-primary" id="list_btn">게시글 리스트</button>
		<c:if test="${not empty user.userid}">
			<a href="/board/enroll" class="btn btn-primary pull-right" style="color: white;">게시판 등록</a>
		</c:if>
		<c:if test="${empty user.userid}">
			<button class="btn btn-primary" onclick="alert('로그인 후에 이용이 가능합니다.');">게시글 등록</button>
		</c:if>
	</div>
	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="num" name="num" value='<c:out value="${pageInfo.num}"/>'> <input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'> <input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'> <input type="hidden" name="type" value="${cri.type}"> <input type="hidden" name="keyword" value="${cri.keyword}">
	</form>
	<script>
		let form = $("#infoForm");

		$("#list_btn").on("click", function(e) {
			form.find("#num").remove();
			form.attr("action", "/board/list");
			form.submit();

		});
		$("#modify_btn").on("click", function(e) {
			form.attr("action", "/board/modify");
			form.submit();

		});

		function openModifyWindow(num, rno) {
			let url = "/reply/modify?num=" + num + "&rno=" + rno;
			window.open(url, "modifyWindow", "width=400, height=300");
		}
	</script>
	<hr>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
