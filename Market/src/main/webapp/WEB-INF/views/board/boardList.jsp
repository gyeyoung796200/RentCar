<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/common/css/common.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	$(document).on('click','#btnWriteForm', function(e){
		
		e.preventDefault;
		
		location.href="${pageContext.request.contextPath}/board/boardWrite";
	});


</script>
</head>
<body>
	<br/><br/><br/><br/><br/><br/><br/>
	<article>
		<div class="container">
			<div class="table-responsive">
				<table class="table table-striped table-sm">
					<colgroup>
						<col style="width:5%;"/>
						<col style="width:auto;"/>
						<col style="width:15%;"/>
						<col style="width:10%;"/>
						<col style="width:10%;"/>
					</colgroup>
					
					<thead>
						<tr>
							<th>NO</th>
							<th>글제목</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>작성일</th>
						</tr>
					</thead>
					
					<tbody>
						<c:choose>
							<c:when test="${empty boardList }">
								<tr>
									<td align="center" colspan="5">게시글이 없습니다</td>
								</tr>
							</c:when>
			
							<c:when test="${!empty boardList }">
								<c:forEach var="list" items="${boardList }">
									<tr>
										<td><c:out value="${list.bid }"/></td>
										<td><a href="#" onclick="fn_contentView(<c:out value="${list.bid }"/>)"><c:out value="${list.title }"/></a></td>
										<td><c:out value="${list.reg_id }"/></td>
										<td><c:out value="${list.view_cnt }"/></td>
										<td><c:out value="${list.reg_dt }"/></td>
									</tr>
								</c:forEach>						
							</c:when>			
						</c:choose>
					</tbody>	
				</table>
			</div>

			<div>
				<input type="button" class="btn btn-sm btn-primary" id="btnWriteForm" value="글쓰기"/>
			</div>
			
			
			
			<div class="form-group row justify-content-center">
				<div class="w100" style="padding-right:10px">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="title">제목</option>
						<option value="Content">본문</option>
						<option value="reg_id">작성자</option>
					</select>
				</div>

				<div class="w300" style="padding-right:10px">
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
				</div>
	
				<div>
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
			</div>
			
			
		</div>
	</article>
</body>
</html>