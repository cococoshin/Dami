<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
    <title>아이디 중복 체크</title>
    
    <style type="text/css">
        #wrap {
            width: 490px;
            text-align :center;
            margin: 0 auto 0 auto;
        }
        
        #chk{
            text-align :center;
        }
        
        #cancelBtn{
            visibility:visible;
        }
        
         #useBtn{
             visibility:hidden;
        } 
 		/*  사용가는시 보이게할거 */
 		
 		<script src=""></script>
 		
   </style>
    
    <script type="text/javascript">
    
    
    var httpRequest = null;
    
    // httpRequest 객체 생성
    function getXMLHttpRequest(){
        var httpRequest = null;
    
        if(window.ActiveXObject){
            try{
                httpRequest = new ActiveXObject("Msxml2.XMLHTTP");    
            } catch(e) {
                try{
                    httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e2) { httpRequest = null; }
            }
        }
        else if(window.XMLHttpRequest){
            httpRequest = new window.XMLHttpRequest();
        }
        return httpRequest;    
    }

        // 이메일 입력란의 값을 가져온다.      
        function pValue(){
            document.getElementById("email1").value = opener.document.userInfo.email1.value;
            document.getElementById("email2").value = opener.document.userInfo.email2.value;           
        }
        
        // 이메일 중복체크
        function emailCheck(){
 			
        
            var email1 = document.getElementById("email1").value
            var email2 = document.getElementById("email2").value;
                    
			if(email1 == "" || email2 == ""){
				alert("이메일을 입력하지 않았습니다.");
                return false;
                
			} else{
								
				// 이메일 형식 검사 email2(사이트 주소 부분)의 형식이 OOO.OOO을 지키는지 확인
	            var regExp = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp.test(email2);
				if(!bool){
					alert("이메일 형식을 지켜주세요");
					return false;
				} else{
					var param = "email1="+email1 +"&" + "email2="+email2;
	                httpRequest = getXMLHttpRequest();
	                httpRequest.onreadystatechange = callback;
	                httpRequest.open("POST", "MemberEmailCheckServlet", true);    
	                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
	                httpRequest.send(param);
				} 
						
			} 
       
        }
        
        function callback(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){
                    alert("사용할수없는 이메일입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 0){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 이메일입니다.";
                }
            }
        }

        /* 입력 가능시 보이게, 불가능시 안보이게 (사용하기) */
           
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 emailCheck 값을 전달한다.
            opener.document.userInfo.emailDuplication.value ="emailCheck";
            // 회원가입 화면의 email입력란에 값을 전달
            opener.document.userInfo.email1.value = document.getElementById("email1").value;
            opener.document.userInfo.email2.value = document.getElementById("email2").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        } 
   		
      
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
    
</head>
<body onload="pValue()">
<div id="wrap">
    <br>
    <b><font size="4" color="gray">이메일 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
                            
			<input class ="form-control" type="text" id="email1" name="email1" maxLength="20" onkeydown="inputEmailChk()">@
			<input type="text" name="email2" id="email2" onfocus="inInput(this)" onblur="outInput(this)" placeholder="이메일 입력하세요" onkeydown="inputEmailChk()">
				<select onfocus="inInput(this)" onblur="outInput(this)" onChange="selectEmail(this.value)">
					<option onselect="focus">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="daum.net">daum.net</option>
			</select>
			<input type="button" value="중복확인" onclick="emailCheck()">													
        </form>
        <div id="msg"></div>
        <br>
        <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
        <input id="cancelBtn" type="button" value="취소" onclick="window.close()">
        
    </div>
</div>    
</body>
</html>
