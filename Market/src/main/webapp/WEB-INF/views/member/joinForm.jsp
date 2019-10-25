<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function checkForm(){
		
		var id = document.getElementById('id');
		var pw = document.getElementById('pw') ;
		var pwConfirm = document.getElementById('pwConfirm') ;
		var name = document.getElementById('name') ;
		var email = document.getElementById('email') ;
		var birth = document.getElementById('birth') ;
		var addr3 = document.getElementById('addr3') ;
	
		
		if(id.value =="" || (id.value.length < 3 && id.value.length > 10 )){
			
			alert("아이디를 입력하지 않았거나 3자 미만이이거나 10자이상입니다");
			id.focus();
			return false;
			
		}
		
		if(pw.value =="" || pwConfirm.value ==""){
			
			alert("비밀번호를 입력하지 않았습니다");
			pw.focus();
			return false;
			
		}
		
		if(pw.value != pwConfirm.value ){
			
			alert("비밀번호가 일치하지않습니다");
			pw1.focus();
			return false;
			
		}
		
		if(name.value =="" ){
			
			alert("이름을 입력하지않았습니다 ");
			name.focus();
			return false;
			
		}
		
		if(email.value =="" ){
			
			alert("이메일을 입력하지않았습니다 ");
			email.focus();
			return false;
			
		}
		
		if(birth.value =="" ){
			
			alert("생일을 입력하지않았습니다 ");
			birth.focus();
			return false;
			
		}
		
		if(addr3.value =="" ){
			
			alert("상세 주소를 입력하지않았습니다 ");
			addr3.focus();
			return false;
			
		}
		
		else{
			
			document.frmJoin.submit();
		}
		
	}
</script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('addr1').value = data.zonecode;
                document.getElementById("addr2").value = roadAddr;
                

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
</script>
</head>
<body>

<c:if test="${result == 1 }">
	<script>
		alert("해당 아이디가 존재합니다");
	</script>
</c:if>



<br/><br/><br/><br/><br/><br/>
 <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원가입</h3><br/><br/>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" name="frmJoin" id="frmJoin" method="post" action="${pageContext.request.contextPath }/member/joinProc">
                	<div class="form-group">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control" name="id" id="id" placeholder="아이디를 입력해 주세요">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputPassword">비밀번호</label>
                        <input type="password" class="form-control" name="pw" id="pw" placeholder="비밀번호를 입력해 주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputPassword">비밀번호 확인</label>
                        <input type="password" class="form-control" name="pwConfirm" id="pwConfirm" placeholder="비밀번호를 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputName">이름</label>
                        <input type="text" class="form-control" name="name" id="name" placeholder="이름을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputEmail">이메일</label>
                        <input type="text" class="form-control" name="email" id="email" placeholder="이메일을 입력해주세요">
                    </div>
                    <div class="form-group">
                        <label for="inputGender">성별</label>
                        <select name="gender" id="gender">
							<option value="남">남</option>
							<option value="여">여</option>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">생년월일</label>
                        	<input type="date" class="form-control" id="birth" placeholder="Enter birth" name="birth">
                    </div>
                    
                    <div class="form-group">
     					<label  for="addr">주소</label>
				     			<input type="text" class="form-control" name="addr1" id="addr1" placeholder="우편번호">
								<input type="button" class="form-control" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
								<input type="text" class="form-control" name="addr2" id="addr2" placeholder="도로명/지번 선택">
								<input type="text" class="form-control" name="addr3" id="addr3" placeholder="상세주소">
								<span id="guide" style="color:#999;display:none"></span>
				    </div>

					<br/><br/> <hr/>
                    <div class="form-group text-center">
                      	<input type="button" class="btn btn-primary" value="가입" onclick="checkForm();"/>
        				<input type="reset"  class="btn btn-default" value="취소"/>
                    </div>
                </form>
            </div>
        </article>
</body>
</html>