<%@page import="com.dto.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">
    $(document).ready(function(){
    	//form 서브밋
 $("form").on("submit",function(event){		
	 var userid = $("#userid").val();
	 var passwd = $("#passwd").val();
    		if(userid.length==0){
    			alert("userid 필수")
    			$("#userid").focus();
    			event.preventDefault();
    		}else if(passwd.length==0){
    			alert("passwd 필수")
    			$("#passwd").focus();
    			event.preventDefault();
    		}
    	});
//비번확인
 $("#passwd2").on("keyup",function(){
		var passwd = $("#passwd").val();
		var mesg = "비번 불일치";
		if(passwd == $(this).val()){
			mesg = "비번 일치";
		}
		$("#result2").text(mesg);
	});
	
//이메일 선택
 $("#emailSelect").on("change",function(){
		var email = $(this).val();
		  $("#email2").val(email);
	});
	
 $("#userid").on("keyup",function(event){	
	 $.ajax({
			type : "GET",
			url : "MemberIdCheckServlet",
			dataType : "text",
			data : {
				userid : $("#userid").val()
			},
			success : function(responseData, status, xhr) {
			    $("#result").text(responseData);
			},
			error : function(xhr, status, error) {
				console.log("error");
			}
		});
});
 
 $("#goMain").on("click", function() {
	location.href = "main";
})
 
 });
</script>    
<%
   MemberDTO dto =(MemberDTO)session.getAttribute("login");
   String userid = dto.getUserid();
   String username = dto.getUsername();
   String post = dto.getPost();
   String addr1 = dto.getAddr1();
   String addr2 = dto.getAddr2();
   String phone = dto.getPhone();
   String email1 = dto.getEmail1();
   String email2 = dto.getEmail2();
%>

	
<div class="wrap">
	
	<div class="content">
		<div id="header">
			<h1>회원 정보</h1>
		</div>

		<form action="loginCheck/memberUpdate" method="post">
			<input type="hidden" value="<%= userid %>" name="userid" >
			<h2>아이디: <%= userid %></h2>
			<br> 
			<h2>이름:<%= username %></h2>
			<br>
			<h2>우편번호:<%= post %></h2>			 
			<input type="text" value="<%= post %>" name="post" id="sample4_postcode"  placeholder="우편번호"><input type="button" id="find" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
			<h2>주소:<%= addr1 %> <%= addr2 %></h2>
			<input type="text" value="<%= addr1 %>" name="addr1" id="sample4_roadAddress" placeholder="도로명주소">
			<input type="text" value="<%= addr2 %>" name="addr2" id="sample4_jibunAddress" placeholder="지번주소">
			<span id="guide" style="color:#999"></span>
			<br>
			<h2>전화번호:<%= phone %></h2>
			<input type="text" value="<%= phone %>" name="phone" >
<%-- 			<input type="text" value="<%= phone2 %>" name="phone2" >
			-<input type="text" value="<%= phone3 %>" name="phone3" > --%>
			<br>
			<h2>이메일:<%= email1 %>@<%= email2 %></h2>
				<input type="text" value="<%= email1 %>" name="email1" id="email1">@
			       <input type="text" value="<%= email2 %>" name="email2" id="email2" placeholder="직접입력">
			       <select id="emailSelect">
			        <option value="daum.net">daum.net</option>
			        <option value="naver.com">naver.com</option>
			        <option value="google.com">google.com</option>
			        <option value="">직접입력</option>
			       </select>
			<br>
			<input type="submit" value="수정">
			<input type="reset" value="취소">
			<input type="button" value="돌아가기" id="goMain">
		</form>
	</div>
</div>






<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample4_roadAddress').value = fullRoadAddr;
                document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    //예상되는 도로명 주소에 조합형 주소를 추가한다.
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';

                } else {
                    document.getElementById('guide').innerHTML = '';
                }
            }
        }).open();
    }
</script>