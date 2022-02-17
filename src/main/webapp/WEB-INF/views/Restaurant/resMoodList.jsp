<%@page import="java.util.ArrayList"%>
<%@page import="com.dto.RestaurantDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>




<!-- <table width="100%" cellspacing="500" cellpadding="0">

	<tr>
		<td> -->
			<table align="center" width="710"  height="0" cellspacing="0" cellpadding="0"
				border="0">
				
				<tr>
					<td height="5"></td>
				</tr>
				<!-- <tr>
					<td height="1000" colspan="8" bgcolor="CECECE"></td>
				</tr> -->
				<tr>
					<td height="10"></td>
				</tr>

				<tr>				

 
  <%
 List<RestaurantDTO> list = (List<RestaurantDTO>)session.getAttribute("resList");
 List<String> moodList = (List<String>)session.getAttribute("mood");
 %>
 <h3><%=moodList.get(0) %>식당에서 한 끼 어떠세요?</h3>
<%
	int i = 0;
	for (RestaurantDTO dto : list) {
		String restaurant = dto.getRestaurant();
		String Image = dto.getImage();
		String addr2 = dto.getAddr2();
		String mood = dto.getMood();
		System.out.println("\n\nmood" + mood + "\n\n");
		System.out.println("\n\nmoodList.get(0)" + moodList.get(0) + "\n\n");
		if (mood.equals(moodList.get(0))) {
			System.out.println("\n\nif문통과" + "\n\n");
			i += 1;
%>
						<td>
							<table style='padding:15px'>
								<tr>
									<td>
										<%-- <a href="GoodsRetrieveServlet?gCode=<%=gCode %>"><!-- 이미지링크 -->  --%>
											<img src="images/resImages/<%=Image %>.jpg" border="0" align="center" width="200">
									<!-- 	</a> -->
									</td>
								</tr>
								<tr>
								
									<td height="10">
								</tr>
								<tr>
									<td  align ="center">
										 <a class= "a_black" href="#"> 
										<%= restaurant%><br>
										</a>
										<font color="gray">
										 --------------------
										</font>
									</td>
									
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td  align ="center">
									<%-- 	<%= addr2%> --%>
									</td>
								</tr>
								<tr>
									<td height="10">
								</tr>
								<tr>
									<td class="td_red" align ="center"><font color="red"><strong>
									<%-- <%= addr2%> --%>	</strong></font></td>
								</tr>
							</table>
						</td>
					<!-- 한줄에 4개씩 보여주기 -->	
				   <%
				      if(i%4==0){
				   %>
				       <tr>
				        <td height="10">
				       </tr>
	<%
		} //end if
	%>
	<%
		} //end 외부 if
	%>

	<%
		} //end for
	%>
			</table>

	<tr>
		<td height="10">
	</tr>
	<br>
	<hr>
	<br>