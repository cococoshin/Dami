<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
	</style> 
 
    <script type="text/javascript">
 
        function cValue(){
            document.getElementById("userid").value = opener.document.userInfo.userid.value;
        }
        
    	function Check(){
    		console.log("중복확인 id체크폼")
    		$.ajax({
    			url : "IdCheckForm/idChk",
    			type : "post",
    			dataType : "json",
    			data : {"userid" : $("#userid").val()},
    			success : function(data){
    				if(data == 1){
    					alert("중복된 아이디입니다.");
						document.getElementById("cancelBtn").style.visibility='visible';
						document.getElementById("useBtn").style.visibility='hidden';
    				}else if(data == 0){
    					alert("사용가능한 아이디입니다.");
						document.getElementById("cancelBtn").style.visibility='hidden';
						document.getElementById("useBtn").style.visibility='visible';
    				}
    			}
    		})
    	}
    	
    	
        // 사용하기 클릭 시 부모창으로 값 전달 
        function sendCheckValue(){
            // 중복체크 결과인 idCheck 값을 전달한다.
            opener.document.userInfo.idChk.value ="Check";
            // 회원가입 화면의 ID입력란에 값을 전달
            opener.document.userInfo.userid.value = document.getElementById("userid").value; //체크
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }   	
    	
    	
    	
       /* 
        function callback(){
            if(httpRequest.readyState == 4){
                // 결과값을 가져온다.
                var resultText = httpRequest.responseText;
                if(resultText == 1){
                    alert("사용할수없는 아이디입니다.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 0){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "사용 가능한 아이디입니다.";
                }
            }
        }

        /* 입력 가능시 보이게, 불가능시 안보이게 (사용하기) */
           

   
   </script>
    
</head>
<body onload="cValue()">		<!-- 중복체크 누르면 보이는 값 -->
<div id="wrap">
    <br>
    <b><font size="4" color="gray">아이디 중복체크</font></b>
    <hr size="1" width="460">
    <br>
    	<div id="chk">
    	    <form id="checkForm">
     	       <input type="text" name="idinput" id="userid">
      	       <input type="button" value="중복확인" onclick="Check()">
      	  </form>
      	 		 <div id="msg"></div>
      	  <br>
      	  <input id="useBtn" type="button" value="사용하기" onclick="sendCheckValue()">
      	  <input id="cancelBtn" type="button" value="취소" onclick="window.close()">
        
    </div>
</div>    
</body>
</html>
