<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<html>
<head>
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
 		
 		<script src=""></script>
 		
   </style>
    
    <script type="text/javascript">
    
    
    var httpRequest = null;
    
    // httpRequest ��ü ����
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

        // �̸��� �Է¶��� ���� �����´�.      
        function pValue(){
            document.getElementById("email1").value = opener.document.userInfo.email1.value;
            document.getElementById("email2").value = opener.document.userInfo.email2.value;           
        }
        
        // �̸��� �ߺ�üũ
        function emailCheck(){
 			
        
            var email1 = document.getElementById("email1").value
            var email2 = document.getElementById("email2").value;
                    
			if(email1 == "" || email2 == ""){
				alert("�̸����� �Է����� �ʾҽ��ϴ�.");
                return false;
                
			} else{
								
				// �̸��� ���� �˻� email2(����Ʈ �ּ� �κ�)�� ������ OOO.OOO�� ��Ű���� Ȯ��
	            var regExp = /[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
				var bool = regExp.test(email2);
				if(!bool){
					alert("�̸��� ������ �����ּ���");
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
                // ������� �����´�.
                var resultText = httpRequest.responseText;
                if(resultText == 1){
                    alert("����Ҽ����� �̸����Դϴ�.");
                    document.getElementById("cancelBtn").style.visibility='visible';
                    document.getElementById("useBtn").style.visibility='hidden';
                    document.getElementById("msg").innerHTML ="";
                } 
                else if(resultText == 0){ 
                    document.getElementById("cancelBtn").style.visibility='hidden';
                    document.getElementById("useBtn").style.visibility='visible';
                    document.getElementById("msg").innerHTML = "��� ������ �̸����Դϴ�.";
                }
            }
        }

        /* �Է� ���ɽ� ���̰�, �Ұ��ɽ� �Ⱥ��̰� (����ϱ�) */
           
        // ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
        function sendCheckValue(){
            // �ߺ�üũ ����� emailCheck ���� �����Ѵ�.
            opener.document.userInfo.emailDuplication.value ="emailCheck";
            // ȸ������ ȭ���� email�Է¶��� ���� ����
            opener.document.userInfo.email1.value = document.getElementById("email1").value;
            opener.document.userInfo.email2.value = document.getElementById("email2").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        } 
   		
      
    	function selectEmail(email){
    		if(email != "�����Է�"){
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
    <b><font size="4" color="gray">�̸��� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
                            
			<input class ="form-control" type="text" id="email1" name="email1" maxLength="20" onkeydown="inputEmailChk()">@
			<input type="text" name="email2" id="email2" onfocus="inInput(this)" onblur="outInput(this)" placeholder="�̸��� �Է��ϼ���" onkeydown="inputEmailChk()">
				<select onfocus="inInput(this)" onblur="outInput(this)" onChange="selectEmail(this.value)">
					<option onselect="focus">�����Է�</option>
					<option value="naver.com">naver.com</option>
					<option value="google.com">google.com</option>
					<option value="daum.net">daum.net</option>
			</select>
			<input type="button" value="�ߺ�Ȯ��" onclick="emailCheck()">													
        </form>
        <div id="msg"></div>
        <br>
        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
        <input id="cancelBtn" type="button" value="���" onclick="window.close()">
        
    </div>
</div>    
</body>
</html>
