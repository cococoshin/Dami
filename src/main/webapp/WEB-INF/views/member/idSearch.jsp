<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
 select {
	margin-top: 7px;
	height: 30px; /* 30 */
	border-radius: 5px;
	border-color: gray;
	width: 104px;/* 104 */
	text-align: center;
}
select:focus {
	border-color: #9b59b6 !important;
}
select:selection {
	border-color: #9b59b6 !important;
}
</style>

<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<%//아이디 찾기 정보가 틀렸을 경우 메세지 출력
	String mesg = (String) request.getAttribute("mesg");
	if(mesg != null){
%>
<script type="text/javascript">
alert("<%=mesg%>");
</script>
<%
	}
%><!-- if end -->
<script type="text/javascript">
$(function() {
	$("#emailSelect").on("change", function() {//chage이벤트를 통해 option에서 선택한 값을 input에 넣어줌
		var email = $("#emailSelect").val();
		console.log(email);
		$("#email2").val(email);
	})//change event end
})
</script>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="title">아이디 찾기</div>
		<form action = "IdSearch" method="get">
				<div class = "user-details">
				<div class = "input-box">
					<span class="details">Full name</span>
					<input type="text" name="username" placeholder="이름을 입력하세요" required>
				</div>
		
				<div class = "input-box">
					<span class="details">Phone Number</span>
					<input type="text" name="phone" placeholder="연락처를 입력하세요" required>
				</div>
				
				<div class = "input-box">				
				<span class="details">E-mail</span>
				<input type="text" class="email" name="email1" style="width: 209px">@<input type="text" name="email2" id="email2" style="width: 209px" placeholder="직접 입력" required>
				
		
				<select id = "emailSelect">
					<option value="daum.net">daum.net</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="직접입력">직접 입력</option>
       			</select>
       
				</div>
			
			
			
			
			</div>
			<div class ="button">
				<input type="submit" value="아이디 찾기">
			</div>
			</form>
			</div>
	
	
	
	
	<!-- <form action="IdSearchServlet" method="get">
		<table>
			<tr>
				<td>이름</td>
				<td colspan="3"><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>휴대폰</td>
				<td><select name="phone1">
						<option value="011">011</option>
						<option value="010">010</option>
				</select> 
				-<input type="text" name="phone2"> 
				-<input type="text" name="phone3"></td>

			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="text" name="email1">@
				<input type="text" name="email2" id="email2" placeholder="직접 입력">
				<select id = "emailSelect">
					<option value="daum.net">daum.net</option>
					<option value="naver.com">naver.com</option>
       			</select>
				<input type="submit" value="메일 보내기"></td>
			</tr>
		</table>
	</form> -->
</body>
</html>