<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<jsp:include page="header.jsp"></jsp:include>

</head>
<body>
	<hr>
	<!-- Categories Start -->
	<div class="container-fluid pt-5 ">
		<div class="row px-xl-5 pb-3">
			<c:forEach var="blist" items="${blist }">
				<div class="col-lg-4 col-md-6 pb-1">
					<div class="cat-item text-center" style="padding: 30px;">
						<p class="text-right"></p>
						<a href='/product/brandProductList?bname=<c:out value="${blist.bname }"/>' class="cat-img position-relative overflow-hidden mb-3">
							<img class="img-fluid" src="resources/img/${blist.imgurl}" alt="">
						</a>
						<h5 class="font-weight-semi-bold m-0"></h5>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<!-- Categories End -->
	<hr>
</body>
<jsp:include page="footer.jsp"></jsp:include>
</html>