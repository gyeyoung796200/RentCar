<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<c:if test="${msg == 1 }">
	<script>
	alert("회원가입되었습니다");
	location.href="${pageContext.request.contextPath}/"
	</script>
</c:if>

<c:if test="${msg == 2 }">
	<script>
	alert("회원가입실패");
	location.href="${pageContext.request.contextPath}/member/joinForm"
	</script>
</c:if>


</body>
</html>