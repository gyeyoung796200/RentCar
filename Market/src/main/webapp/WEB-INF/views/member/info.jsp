<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>
	function fn_delete(id){
		
		if(confirm("삭제하시겠습니까?")){
			
			location.href="${pageContext.request.contextPath}/member/deleteMember?id="+id;
			
		}
		
		else{
			
			return false;
		}
	}

	
	function fn_modify(){
		
		if(confirm("수정하시겠습니까?")){
			
			document.frmInfo.submit();
			
		}
	}
</script>
</head>
<body>

<br/><br/><br/><br/><br/><br/>
 <article class="container">
            <div class="page-header">
                <div class="col-md-6 col-md-offset-3">
                <h3>회원정보</h3><br/><br/>
                </div>
            </div>
            <div class="col-sm-6 col-md-offset-3">
                <form role="form" name="frmInfo" id="frmInfo" method="post" action="${pageContext.request.contextPath }/member/modifyForm">
                	<div class="form-group">
                        <label for="inputId">아이디</label>
                        <input type="text" class="form-control" name="id" id="id" value="${memberVO.id }" readonly="readonly">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputName">이름</label>
                        <input type="text" class="form-control" name="name" id="name" value="${memberVO.name }" readonly="readonly">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputEmail">이메일</label>
                        <input type="text" class="form-control" name="email" id="email" value="${memberVO.email }" readonly="readonly">
                    </div>
                    
                    <div class="form-group">
                        <label for="inputGender">성별</label>
                        <select name="gender" id="gender">
							<option value="${memberVO.gender }">${memberVO.gender }</option>
						</select>
                    </div>
                    <div class="form-group">
                        <label for="inputtelNO">생년월일</label>
                        	<input type="date" class="form-control" id="birth" value="${memberVO.birth }" readonly="readonly">
                    </div>
                    
                   <div class="form-group">
				     	<label for="addr">주소</label>
				     			<input type="text" class="form-control" name="addr1" id="addr1"  value="${memberVO.addr1 }" readonly="readonly">
								<input type="text" class="form-control" name="addr2" id="addr2"  value="${memberVO.addr2 }" readonly="readonly">
								<input type="text" class="form-control" name="addr3" id="addr3"  value="${memberVO.addr3 }" readonly="readonly">
				    </div>

                    <div class="form-group">
     					<label class="INfoAddr">가입날짜</label>
				     		<input type="text" class="form-control" name="regdate" id="regdate" value="${memberVO.regdate }" readonly="readonly">
				    </div>				    

					<br/><br/> <hr/>
                    <div class="form-group text-center">
                      	<input type="submit" class="btn btn-primary" value="수정하기" onclick="fn_modify();"/>
                      	<input type="button" class="btn btn-danger" value="삭제" onclick="fn_delete('${memberVO.id}');">
        				<input type="reset"  class="btn btn-default" value="메인" onclick="location.href"/>
                    </div>
                </form>
            </div>
        </article>
        
</body>
</html>