<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- 파라미터로 받아온 각각 다른영역값 설정 -->
	<c:set var="center" value="${center }"/>
	<c:set var="left" value="${left }"/>

	<c:if test="${center == null }">
		<c:set var="center" value="section/center.jsp"/>
	</c:if>
	

<div class="w3-top">
  <div class="w3-bar w3-white w3-wide w3-padding w3-card">
    <a href="${pageContext.request.contextPath }/" class="w3-bar-item w3-button"><b>GYEYOUNG</b>SHOP</a>
    <!-- Float links to the right. Hide them on small screens -->
    <div class="w3-right w3-hide-small">
      <a href="${pageContext.request.contextPath }/board/boardList" class="w3-bar-item w3-button">게시판</a>
      
      	<c:if test="${memberVO == null}">
      		<a href="${pageContext.request.contextPath }/member/joinForm" class="w3-bar-item w3-button">회원가입</a>
      		<a href="${pageContext.request.contextPath }/member/loginForm" class="w3-bar-item w3-button">로그인</a>
      	</c:if>
      
		<c:if test="${memberVO != null}">
      		<a href="${pageContext.request.contextPath }/member/info?id=${memberVO.id}" class="w3-bar-item w3-button">${memberVO.id }접속중</a>
      		<a href="${pageContext.request.contextPath }/member/logOut" class="w3-bar-item w3-button">로그아웃</a>
		</c:if>
    </div>
  </div>
</div>

	<jsp:include page="${center }"/>
	
	






</body>
</html>