<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.MenuDTO"%>

<%@page import="java.util.List"%>
<%@page import="com.service.MenuService"%>

<%
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	//1. menuR에 고객취향테이블에서 받아온 데이터로 menu테이블에서 select한 메뉴들이 들어있습니다.
	//2. 이것이 null일때는 menuFinal에 준비중으로 담기게 했습니다.
	if(dto != null){
		String username = dto.getUsername();		
		String menuFinal = (String)request.getAttribute("menuFinal");			
		String menuImage = (String)request.getAttribute("menuImage");		
		
		System.out.println("menuFinalJSP" + menuFinal);
		System.out.println("menuImageJSP" + menuImage);

	
		if(menuFinal==null){ 
			 menuFinal = "준비 중";	}
		
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 맛슐랭. 틀린 입맛은 없어</title>
</head>
<body>
<div class="image">
<h1><%= username %>님께 추천드리는 메뉴는 <%= menuFinal %>입니다</h1>
<br>
<img src="images/menuImages/<%=menuImage%>.jpg" align = "center" width = "300" height = "400"><br><br>
</div>
<center>
	 <div class="button-3" >
    <div class="eff-2"></div>
    <a href="loginCheck/menuGame">취향 선택 Go!</a>
 	 </div>
	 <div class="button-1" >
    <div class="eff-1"></div>
    <a href="loginCheck/MenuResult">결과 더보기</a>
  </div>
 <div class="button-2" >
    <div class="eff-2"></div>
    <a href="main"> 돌아가기</a> <!-- 02/08 수정완료 : 이신영 -->
  </div><br>
  </center>

<%} %>

</body>
</html>