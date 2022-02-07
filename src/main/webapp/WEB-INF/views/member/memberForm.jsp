<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>회원가입 화면</title>




<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script>
	function selectEmail(email){
		if(email != "직접입력"){
			document.getElementById("email2").value = email;
			document.getElementById("email2").readOnly = true;
		}else{
			document.getElementById("email2").readOnly = false;
			document.getElementById("email2").value = "";
	                document.getElementById("email2").focus();
		}
	}
</script>

<script type="text/javascript">
    
    function checkValue()
    {
        if(!document.userInfo.userid.value){
            alert("아이디를 입력하세요.");
            return false;
        }
        

         if(document.userInfo.idDuplication.value != "idCheck"){
        	alert("아이디 중복체크 해주세요");
        	return false;
        } 
        
        
        if(!document.userInfo.passwd.value){
            alert("비밀번호를 입력하세요.");
            return false;
        }
        
        if(document.userInfo.passwd.value != document.userInfo.passwd2.value ){
            alert("비밀번호를 동일하게 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.username.value){
            alert("이름을 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.email1.value || !document.userInfo.email2.value){
            alert("이메일을 입력하세요.");
            return false;
        }
        
       
        if(document.userInfo.emailDuplication.value != "emailCheck"){
        	alert("이메일 중복체크 해주세요");
        	return false;
        } 
        
        if(!document.userInfo.phone1.value){
            alert("전화번호를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.post.value) {
            alert("주소를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.addr1.value) {
            alert("도로명주소를 입력하세요.");
            return false;
        }
        
        if(!document.userInfo.addr2.value) {
            alert("지번을 입력하세요.");
            return false;
        }
        
   }
    
    
/*         function goLoginForm() {
        location.href="first.jsp";
   		} */
	
        		
        // 입력변경 감지
    	function inputIdChk(){
    		document.userInfo.idDuplication.value ="idUncheck";
    	}
    	
    	// 입력변경 감지
    	function inputEmailChk(){
    		document.userInfo.emailDuplication.value ="emailUncheck";
    	}
    	   	
    	
    	
        function openIdChk(){
        	window.name="parentForm";
//        	window.open("member/IdCheckForm.jsp","chkForm", "width=500, height=300"); 
        	window.open("IdCheckForm","chkForm", "width=500, height=300"); 
        }
        
        function openEmailChk(){
        	window.name="parentForm";
        	window.open("emailCheckForm","chkForm", "width=600, height=300");    		
        }
        
 	
	</script>



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

</head>
<body>
	<div id="header">
		<a href="first.jsp" target="_self" title="gomain"><img src="images/Dami.png" id="logo"></a> <!-- 수정필요 -->
	</div>

	<div class="wrap">
		<div class="content">
	     
	           <form method="post" action="MemberAdd" name="userInfo" onsubmit="return checkValue()"> <!-- 조건확인 -->
		        	<div>
		        		<h2 class="title">아이디</h2>
		                <span class="box id">
		                	<input type="text" name="userid" class="int" maxlength="20" onkeydown="inputIdChk()" placeholder="아이디 입력하세요"> 
		                </span>    
					</div>
					
					<div class="check">
		        		<input type="button" value="중복확인" class="id2" onclick="openIdChk()">    
						<input type="hidden" name="idDuplication" value="idUncheck">    
					</div>
					<!-- 중복체크 -->	
						
		        	<div>
		        		<h2 class="title">비밀번호</h2>
		                <span class="box int passwd">
		                	<input type="password" name="passwd" class="int" maxlength="15" placeholder="비밀번호 입력하세요">
		                </span>    
					</div>
					
		        	<div>
		        		<h2 class="title">비밀번호 확인</h2>
		                <span class="box int passwd2">
		                	<input type="password" name="passwd2" class="int" maxlength="15" placeholder="비밀번호 확인하세요">
		                </span>    
					</div>

		        	<div>
		        		<h2 class="title">이름</h2>
		                <span class="box name">
		                        <input type="text" name="username" class="int" maxlength="4" placeholder="이름 입력하세요">
		                </span>    
					</div>		                    

					<div>
		        		<h2 class="title">이메일</h2>
		        		<span class="box email">
							<input class ="form-control" type="text" id="email1" name="email1" maxLength="20" placeholder="이메일 입력하세요" onkeydown="inputEmailChk()">@
							<input type="text" name="email2" id="email2" onfocus="inInput(this)" onblur="outInput(this)" placeholder="이메일 입력하세요"/ onkeydown="inputEmailChk()">
								<select onfocus="inInput(this)" onblur="outInput(this)" onChange="selectEmail(this.value)">
									<option onselect="focus">직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="google.com">google.com</option>
									<option value="daum.net">daum.net</option>
								</select>
						</span>
					</div>
					
					<div class="check">
						<input type="button" value="중복확인" onclick="openEmailChk()">
						<input type="hidden" name="emailDuplication" value="emailUncheck"> 						
					</div>
		          	 <!-- 중복체크 -->	
		          	 
		        	<div>
		        		<h2 class="title">전화번호</h2>
		                <span class="box phone">
		                        <input type="text" name="phone" class="int" maxlength="11" placeholder="전화번호 입력하세요">
		                </span>    
					</div>		          
					
		        	<div>
		        		<h2 class="title">주소</h2>
		                <span class="box post">
	                   		<input type="text" name="post" class="int" id="sample4_postcode" placeholder="우편번호 입력하세요">
							<input type="button" id="find" onclick="sample4_execDaumPostcode()" value="우편번호 찾기">

		                </span>
		                <span class="box addr">
							<input type="text" name="addr1" class="int" id="sample4_roadAddress" placeholder="도로명주소 입력하세요">
							<input type="text" name="addr2" class="int" id="sample4_jibunAddress" placeholder="지번주소 입력하세요">		                
		                </span>    
					</div><br>
					
					<div>
						<span class="btn_area">
							<input type="submit" id="btnjoin" value="가입">  <!-- <input type="button" value="취소" onclick="goLoginForm()"> -->
						</span>
					</div>
		             
			</form>
	    </div>
	</div>
</body>
</html>
