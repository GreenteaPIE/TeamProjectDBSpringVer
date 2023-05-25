<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js" integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU=" crossorigin="anonymous"></script>
<jsp:include page="../header.jsp"></jsp:include>
</head>
<body>
	<hr>
	<div class="container">
		<div style="height: 550px">
			<div class="row">
				<table class="table" style="text-align: center; border: 1px solid #dddddd">
					<thead>
						<tr>
							<th style="background-color: #eeeeee; text-align: center;">번호</th>
							<th style="background-color: #eeeeee; text-align: center;">분류</th>
							<th style="background-color: #eeeeee; text-align: center; width: 40%;">제목</th>
							<th style="background-color: #eeeeee; text-align: center;">작성자</th>
							<th style="background-color: #eeeeee; text-align: center;">작성일</th>
							<th style="background-color: #eeeeee; text-align: center;">조회수</th>
						</tr>
					</thead>
					<c:forEach items="${list}" var="list">
						<%--     <c:if test="${list.userid == admin2 }"> --%>
						<tr class="record">
							<td><c:out value="${list.num}" /></td>
							<td><c:choose>
									<c:when test="${list.category == 'F'}">[자&nbsp;&nbsp;&nbsp;유]</c:when>
									<c:when test="${list.category == 'Q'}">[질&nbsp;&nbsp;&nbsp;문]</c:when>
									<c:when test="${list.category == 'S'}">[공지사항]</c:when>
								</c:choose></td>
							<td style="text-align: left;"><a class="move" href='<c:out value="${list.num}"/>'>
									<c:out value="${list.title}" />
									(
									<c:out value="${list.reply_count}" />
									)
								</a></td>
							<td><c:out value="${list.userid}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd" value="${list.writedate}" /></td>
							<td><c:out value="${list.readcount}" /></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</div>
		<div>
			<c:if test="${not empty user.userid}">
				<a href="/board/enroll" class="btn btn-primary pull-right" style="color: white;">게시판 등록</a>
			</c:if>
			<c:if test="${empty user.userid}">
				<a href="#" onclick="alert('로그인 후에 이용이 가능합니다.'); return false;" class="btn btn-primary pull-right" style="color: white;">게시판 등록</a>
			</c:if>
		</div>
		<div class="search_wrap">
			<div class="search_area">
				<select name="type">
					<option value="" <c:out value="${pageMaker.cri.type == null?'selected':'' }"/>>--</option>
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'?'selected':'' }"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'?'selected':'' }"/>>내용</option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'?'selected':'' }"/>>작성자</option>
					<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'?'selected':'' }"/>>제목 + 내용</option>
					<option value="TW" <c:out value="${pageMaker.cri.type eq 'TW'?'selected':'' }"/>>제목 + 작성자</option>
					<option value="TCW" <c:out value="${pageMaker.cri.type eq 'TCW'?'selected':'' }"/>>제목 + 내용 + 작성자</option>
				</select> <input type="text" name="keyword" value="${pageMaker.cri.keyword}">
				<button class="btn btn-primary pull-right">Search</button>
			</div>
		</div>
		<!-- 페이징 -->
		<div class="col-12 pb-1">
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<nav aria-label="Page navigation">
						<ul id="pageInfo" class="pagination justify-content-center mb-3">
							<!-- 이전 페이지 버튼 -->
							<c:if test="${pageMaker.prev}">
								<li class="page-item"><a class="page-link" href="${pageMaker.startPage-1}" aria-label="Previous">
										<span aria-hidden="true">&laquo;</span>
										<span class="sr-only">Previous</span>
									</a></li>
							</c:if>
							<!-- 각 번호 페이지 버튼 -->
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<li class="page-item ${pageMaker.cri.pageNum == num ? 'active' : ''}"><a class="page-link" href="${num}">${num}</a></li>
							</c:forEach>
							<!-- 다음 페이지 버튼 -->
							<c:if test="${pageMaker.next}">
								<li class="page-item"><a class="page-link" href="${pageMaker.endPage + 1}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
										<span class="sr-only">Next</span>
									</a></li>
							</c:if>
						</ul>
					</nav>
				</div>
			</div>
			<form id="moveForm" method="get">
				<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}"> <input type="hidden" name="amount" value="${pageMaker.cri.amount}"> <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}"> <input type="hidden" name="type" value="${pageMaker.cri.type}"> <input type="hidden" name="category" value="${pageMaker.cri.category}">
			</form>
		</div>
	</div>
	<hr>
	<script>
		$(document).ready(function() {

			let result = '<c:out value="${result}"/>';

			checkAlert(result);

			function checkAlert(result) {

				if (result === '') {
					return;
				}

				if (result === "enrol success") {
					alert("등록이 완료되었습니다.");
				}
				if (result === "modify success") {
					alert("수정이 완료되었습니다.");
				}
				if (result === "delete success") {
					alert("삭제가 완료되었습니다.");
				}
			}

		});

		let moveForm = $("#moveForm");

		$(".move").on(
				"click",
				function(e) {
					e.preventDefault();

					moveForm.append("<input type='hidden' name='num' value='"
							+ $(this).attr("href") + "'>");
					moveForm.attr("action", "/board/get");
					moveForm.submit();
				});

		$("#pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name='pageNum']").val($(this).attr("href"));
			moveForm.attr("action", "/board/list");
			moveForm.submit();

		});

		$(".search_area button").on("click", function(e) {
			e.preventDefault();

			let type = $(".search_area select").val();
			let keyword = $(".search_area input[name='keyword']").val();
			let category = $("input[name='category']").val();

			if (!type) {
				alert("검색 종류를 선택하세요.");
				return false;
			}

			if (!keyword) {
				alert("키워드를 입력하세요.");
				return false;
			}

			moveForm.find("input[name='type']").val(type);
			moveForm.find("input[name='keyword']").val(keyword);
			moveForm.find("input[name='category']").val(category);
			moveForm.find("input[name='pageNum']").val(1);
			moveForm.submit();
		});
	</script>
</body>
<jsp:include page="../footer.jsp"></jsp:include>
</html>
