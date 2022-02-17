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
<%//메세지 출력
	String mesg = (String) request.getAttribute("mesg");
	String userid = (String) request.getAttribute("userid");
	System.out.println("\npwRemake"+userid+"pwRemake\n");
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
	//passwd 일치여부 체크
	$("#passwd2").on("keyup", function() {
		var pw = $("#passwd").val()
		var pw2 = $("#passwd2").val()
		if(pw == pw2){
			$("#checkPw").text("비밀번호 일치");
		} else{
			$("#checkPw").text("비밀번호 불일치");
		}
	})
})


</script>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="title">새로운 비밀번호로 변경하기</div>
		<form action = "newPw"> <!-- 기존에 썻던 비밀번호인지 확인 후 변경해주기 -->
			<input name="userid" type="hidden" value = <%=userid %>><br>
			<div class = "user-details">
				<div class="input-box">
					<span class="details">비밀번호</span> 
					<input id = "passwd" name="passwd" type="password" placeholder="비밀번호 입력하세요" required>
				</div>
				<div class="input-box">
					<span class="details">비밀번호 확인</span> 
					<input id = "passwd2" name="passwd2" type="password" placeholder="비밀번호 입력하세요" required>
				</div>
				<b><div id = "checkPw" style="color: red;"></div></b>
			</div>
			<div class ="button">
				<input type="submit" value="비밀번호 변경하기">
			</div>
			</form>
			
	
	</div>
</body>
<!-- <body>
<h1>비밀번호 찾기</h1>
	<form action="PwSearchServlet" method="get">
		<table>
			<tr>
				<td>아이디</td>
				<td colspan="3"><input type="text" name="userid"></td>
			</tr>
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
	</form>
</body> -->
</html>