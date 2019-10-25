<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function fn_chk(){
		
		var id = document.getElementById("id").value;
		var pw = document.getElementById("pw").value;
		
		if(id == "" || pw == ""){
			
			alert("값이 입력되지않았습니다");
			return false;
		}
		
		else{
			
			document.frmLogin.submit();
		}
	}
</script>


</head>
<body>

<c:if test="${result == 2 }">
<script>
	alert("로그인에 실패하였습니다");
</script>
</c:if>

<br/><br/><br/><br/><br/>
<div class="w3-card-4">
  <div class="w3-container w3-blue">
    <h2>로그인</h2>
  </div>
  <form class="w3-container" name="frmLogin" id="frmLogin" method="post" action="loginProc">
    <p>      
    <label class="w3-text-brown"><b>아이디</b></label>
    <input class="w3-input w3-border w3-sand" name="id" id="id" type="text"></p>
    <p>      
    <label class="w3-text-brown"><b>비밀번호</b></label>
    <input class="w3-input w3-border w3-sand" name="pw" id="pw" type="password"></p>
    <p>
    <input type="submit" value="확인" onclick="return fn_chk();" class="w3-btn w3-brown">
    <input type="reset" value="취소" class="w3-btn w3-gray">
    </p>
  </form>
  </div>
 


</body>
</html>