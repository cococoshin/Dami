<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>���̵� �ߺ� üũ</title>

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
	/*  ��밡�½� ���̰��Ұ� */
	</style> 
 
    <script type="text/javascript">
 
        function cValue(){
            document.getElementById("userid").value = opener.document.userInfo.userid.value;
        }
        
    	function Check(){
    		console.log("�ߺ�Ȯ�� idüũ��")
    		$.ajax({
    			url : "IdCheckForm/idChk",
    			type : "post",
    			dataType : "json",
    			data : {"userid" : $("#userid").val()},
    			success : function(data){
    				if(data == 1){
    					alert("�ߺ��� ���̵��Դϴ�.");
						document.getElementById("cancelBtn").style.visibility='visible';
						document.getElementById("useBtn").style.visibility='hidden';
    				}else if(data == 0){
    					alert("��밡���� ���̵��Դϴ�.");
						document.getElementById("cancelBtn").style.visibility='hidden';
						document.getElementById("useBtn").style.visibility='visible';
    				}
    			}
    		})
    	}
    	
    	
        // ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
        function sendCheckValue(){
            // �ߺ�üũ ����� idCheck ���� �����Ѵ�.
            opener.document.userInfo.idChk.value ="Check";
            // ȸ������ ȭ���� ID�Է¶��� ���� ����
            opener.document.userInfo.userid.value = document.getElementById("userid").value; //üũ
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        }   	
    	
    	
    	
       /* 
        function callback(){
            if(httpRequest.readyState == 4){
                // ������� �����´�.
                var resultText = httpRequest.responseText;
                if(resultText == 1){
                    alert("����Ҽ����� ���̵��Դϴ�.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 0){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "��� ������ ���̵��Դϴ�.";
                }
            }
        }

        /* �Է� ���ɽ� ���̰�, �Ұ��ɽ� �Ⱥ��̰� (����ϱ�) */
           

   
   </script>
    
</head>
<body onload="cValue()">		<!-- �ߺ�üũ ������ ���̴� �� -->
<div id="wrap">
    <br>
    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
    	<div id="chk">
    	    <form id="checkForm">
     	       <input type="text" name="idinput" id="userid">
      	       <input type="button" value="�ߺ�Ȯ��" onclick="Check()">
      	  </form>
      	 		 <div id="msg"></div>
      	  <br>
      	  <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
      	  <input id="cancelBtn" type="button" value="���" onclick="window.close()">
        
    </div>
</div>    
</body>
</html>
