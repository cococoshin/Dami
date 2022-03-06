<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/mypage.css">
<title>mypage</title>
<style>
 header {
    width: 100%;
    height: 100px;
    background-color: #bf7d7d;
}

footer {
    width: 100%;
    height: 100px;
    background-color: #2c0808;
}

#main {
    width: 100%;
    height: 700px;
    background-color: white;
}

#sidebar {
    float: left;
    width: 150px;
    height: 700px;
    background-color: #716a6a;
} 



     
    </style>
   <jsp:include page="common/top.jsp" flush="true"></jsp:include>
</head>
<body>

    <header>상단</header>
    <div id="main">main
    <jsp:include page="member/mypage.jsp" flush="true"></jsp:include>
        <div id="sidebar">사이드</div>
        
    </div>
    <footer>하단</footer>
</body>
</html>
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<link rel="stylesheet" href="css/mypage.css">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<title>Insert title here</title>

    <jsp:include page="member/mypage.jsp" flush="true"></jsp:include>
        
        