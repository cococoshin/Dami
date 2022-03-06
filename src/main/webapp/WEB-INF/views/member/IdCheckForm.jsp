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

        // ���̵� �Է¶��� ���� �����´�.
        // #����. �������� �߸��ԷµǾ� �־ ����(id -> userid)
        function pValue(){
            document.getElementById("userId").value = opener.document.userInfo.userid.value;
        }
        
        // ���̵� �ߺ�üũ
        function idCheck(){
 			
        	console.log('ID�ߺ��˻�');
            var id = document.getElementById("userId").value;
 
            if (!id) {
                alert("���̵� �Է����� �ʾҽ��ϴ�.");
                return false;
            } 
            else if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
                alert("�ѱ� �� Ư�����ڴ� ���̵�� ����Ͻ� �� �����ϴ�.");
                return false;
            } 
            else {
                var param = "id="+id;
                httpRequest = getXMLHttpRequest();
                httpRequest.onreadystatechange = callback;
                httpRequest.open("POST", "MemberIdCheck", true);    
                httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded'); 
                httpRequest.send(param);
            }

        }
        
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
           
        // ����ϱ� Ŭ�� �� �θ�â���� �� ���� 
        function sendCheckValue(){
            // �ߺ�üũ ����� idCheck ���� �����Ѵ�.
            opener.document.userInfo.idDuplication.value ="idCheck";
            // ȸ������ ȭ���� ID�Է¶��� ���� ����
            opener.document.userInfo.userid.value = document.getElementById("userId").value;
            
            if (opener != null) {
                opener.chkForm = null;
                self.close();
            }    
        } 
   
   </script>
    
</head>
<body onload="pValue()">		<!-- �ߺ�üũ ������ ���̴� �� -->
<div id="wrap">
    <br>
    <b><font size="4" color="gray">���̵� �ߺ�üũ</font></b>
    <hr size="1" width="460">
    <br>
    <div id="chk">
        <form id="checkForm">
            <input type="text" name="idinput" id="userId">
            <input type="button" value="�ߺ�Ȯ��" onclick="idCheck()">
        </form>
        <div id="msg"></div>
        <br>
        <input id="useBtn" type="button" value="����ϱ�" onclick="sendCheckValue()">
        <input id="cancelBtn" type="button" value="���" onclick="window.close()">
        
    </div>
</div>    
</body>
</html>
