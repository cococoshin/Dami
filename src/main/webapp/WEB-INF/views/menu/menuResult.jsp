<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MemberDTO"%>
<%@page import="com.dto.MenuDTO"%>
<%@page import="com.dto.RestaurantDTO"%>

<%@page import="java.util.List"%>
<%@page import="com.service.MenuService"%>

<style> /* 이거 왜 css적용이안돼지..???;;;; */
.restaurantTable{
	margin : auto;
    width : 80%;
}
</style>


<%
	MemberDTO dto = (MemberDTO)session.getAttribute("login");
	//1. menuR에 고객취향테이블에서 받아온 데이터로 menu테이블에서 select한 메뉴들이 들어있습니다.
	//2. 이것이 null일때는 menuFinal에 준비중으로 담기게 했습니다.
	if(dto != null){ //로그인체크
		String username = dto.getUsername();		
		
		List<RestaurantDTO> recommendResList = (List<RestaurantDTO>) request.getAttribute("recommendResList");
		System.out.println("\nrecommendResList"+recommendResList+"\nrecommendResList");

		System.out.println("check");
 
		String menuFinal = (String)request.getAttribute("menuFinal");         
		String menuImage = (String)request.getAttribute("menuImage");      
		      
		System.out.println("menuFinalJSP" + menuFinal);
		System.out.println("menuImageJSP" + menuImage);

		   
		if(menuFinal==null){ 
			menuFinal = "준비 중";   }
		
/* 		System.out.println("selected: "+ menuR);	
		String menuFinal = null;
		String menuImage = null;		 */
/* 		if(menuR==null){ 
			 menuFinal = "준비 중";	}
		else if(menuR!=null){
	//3. 결과버튼을 눌러서 값이 생성되면 menuR의 배열중 첫번째것을 선택하여 menuFinal변수에 담습니다.
	//4. 아래 출력페이지에서 menuFinal변수에 담긴 메뉴를 추천해 주게 됩니다. 
	// 	 이때 결과 버튼을 다시 누르면 list에 담긴 메뉴가 여러개면 랜덤하게 MenuSelect 서블릿에서 받아오기 때문에 그중 하나를 바꿔가며 추천해줍니다.
				String menu = menuR.get(0);
				menuFinal = menu;
//				MenuService service = new MenuService();	
//				menuImage = service.getMenuImage(menuFinal); */
			
			
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 맛슐랭. 틀린 입맛은 없어</title>
</head>
<body>

<!-- menu추천 -->
<div class="image">
<h1><%= username %>님께 추천드리는 메뉴는 <%= menuFinal %>입니다</h1>
<br>
<img src="images/menuImages/<%=menuImage%>.jpg" align = "center" width = "300" height = "400"><br><br>
</div>



<!-- restaurant추천 -->
<div class="image">
<h1><%= menuFinal %>, 맛보실 수 있는 식당입니다</h1>
<br>
</div>


	<%
	int i = 0;
	for(RestaurantDTO rdto : recommendResList){
	//dto 정보 변수선언
 	String rRestaurant = rdto.getRestaurant();
	String rPhone1 = rdto.getPhone1();
	String rPhone2 = rdto.getPhone2();
	String rAddr1 = rdto.getAddr1();
	String rAddr2 = rdto.getAddr2();
	String rImage = rdto.getImage();
	i += 1;

%>
			<table class = restaurantTable>
				<tr>
					<td align="center">
						<a href = "?restaurant=<%=rRestaurant%>"><!-- 이미지 클릭시 상세페이지로 이동 -->
							<div class="scale"><img src = "images/resImages/<%=rImage%>.jpg" width="200" height="300" class="image">
							</div>
						</a>
<!-- 					</td>
					<td width="15">검색결과별 폭 조정
					</td> -->
				</tr>
				<tr>
					<td align="center">
						<a class = "aReview" href = "?restaurant=<%=rRestaurant%>"><%=rRestaurant %></a><!-- 상세페이지로 이동 -->
					</td>
				</tr>
			</table>
		<%
			if(i%5==0){ //메뉴를 5개 보여주면 줄을 바꿈
		%>
		<tr>
			<td height="10">
		</tr>
		<%
			}//end if
		%>
<%
}//end for
%>

<br>




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