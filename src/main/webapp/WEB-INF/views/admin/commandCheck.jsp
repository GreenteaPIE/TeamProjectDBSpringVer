<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if(window.name=="edit"){
	window.opener.parent.location.href = "BoardServlet?command=user_edit&userid=${param.userid}";
}else if(window.name == "delete"){
	alert("삭제되었습니다.");
	window.opener.parent.location.href="BoardServlet?command=user_delete&userid=${param.userid}";
}
window.close();
</script>
</body>
</html>