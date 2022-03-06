<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="js/jquery-3.3.1.js"></script>
<script type="text/javascript">


</script>


<title>Insert title here</title>
</head>
<body>
<section class="restaurant-detail">
            <header>
              <div class="restaurant_title_wrap">
                <span class="title">
                  <h1 class="restaurant_name">${resInfo.restaurant}</h1>
                    <strong class="rate-point">
                      <span>4.8</span>
                    </strong>

                  <p class="branch"></p>
                </span>

                <div class="restaurant_action_button_wrap">

                  <button class="review_writing_button" data-restaurant_key="LtQEW4w1BZMm">
                    <i class="review_writing_button_icon"></i>
                    <span class="review_writing_button_text">리뷰쓰기</span>
                  </button>

                  <div class="wannago_wrap">
                    <button class="btn-type-icon favorite wannago_btn " data-restaurant_uuid="407982" data-action_id=""></button>
                    <p class="wannago_txt"></p>
                  </div>
                </div>
              </div>

            
            </header>
            <table class="">
              <caption>레스토랑 상세 정보</caption>

              <tbody>
                <tr class="">
                  <th></th>
                  <td><img src="images/resImages/${resInfo.image}.jpg" border="0" align="center" width="200">
                  </td>
                </tr>
                <tr class="">
                  <th>주소</th>
                  <td>${resInfo.addr1} ${resInfo.addr2}
                  </td>
                </tr>

                <tr class="">
                  <th>전화번호</th>
                  <td>${resInfo.phone1}-${resInfo.phone2}-${resInfo.phone3}</td>
                </tr>

                <tr>
                  <th>음식 종류</th>
                  <td>
                    <span>${resInfo.category}</span>
                  </td>
                </tr>

                <tr>
                  <th>가격대</th>
                  <td>${resInfo.price}</td>
                </tr>

                <tr>
                  <th>주차</th>
                  <td>${resInfo.parking} </td>
                </tr>

                <tr>
                  <th style="">영업시간</th>
                  <td>${resInfo.time}</td>
                </tr>

                <tr>
                  <th style="">쉬는시간</th>
                  <td>${resInfo.breaktime}</td>
                </tr>
                <tr>
                  <th style="">분위기</th>
                  <td>${resInfo.mood}</td>
                </tr>




                <tr>
                  <th>메뉴</th>
                  <td class="">
 <c:forEach var="dto" items="${menuInfo}" varStatus="status">
                        <li class="">
                          <span class="">${dto.menu}  </span>
                            <span class="">${dto.price }</span>
                        </li>
                  </c:forEach>      
                    
                  </td>
                </tr>

              </tbody>
            </table>