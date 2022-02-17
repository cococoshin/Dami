<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="com.dto.RestaurantDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.MenuDAO"%>
<%@page import="com.dto.MenuDTO"%>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

</script>
<%
	List<RestaurantDTO> rList = (List<RestaurantDTO>) session.getAttribute("recommendList");
	System.out.println(rList.size());	
%>

<br>
<br>
<%
	if (rList.size() == 0) {
%>
<h3>당신의 취향을 알려주세요</h3>
<%
	} else {
%>
<h3>당신이 좋아할만한 맛집이에요 ! </h3>
<div>
	<table>
		<tr>
			<%
				int i = 0;
						for (RestaurantDTO dto : rList) {
							//dto 정보 변수선언
							String rRestaurant = dto.getRestaurant();
							String rPhone1 = dto.getPhone1();
							String rPhone2 = dto.getPhone2();
							String rAddr1 = dto.getAddr1();
							String rAddr2 = dto.getAddr2();
							String rImage = dto.getImage();
							i += 1;
			%>
			<td>
				<table>
					<tr>
						<td align="center"><a href="?restaurant=<%=rRestaurant%>">
								<!-- 이미지 클릭시 상세페이지로 이동 -->
								<div class="scale">
									<img src="images/resImages/<%=rImage%>.jpg" width="200"
										height="300" class="image">
								</div>
						</a></td>
						<td width="15">
							<!-- 검색결과별 폭 조정 -->
						</td>
					</tr>
					<tr>
						<td align="center"><a class="aReview" href="?restaurant=<%=rRestaurant%>"><%=rRestaurant %></a>
						<!-- 상세페이지로 이동 --></td>
					</tr>
				</table>
			</td>
			<%
			if(i%4==0){ //메뉴를4개 보여주면 줄을 바꿈
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
		</tr>
	</table>
</div>
<%} %><!-- if-else문 종료 -->
<br>
<hr>
<br>