

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Coding by CodingLab | www.codinglabweb.com -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <!----======== CSS ======== -->
    <link rel="stylesheet" href="css/mainstyle.css">
    
    <!----===== Boxicons CSS ===== -->
    <link href='https://unpkg.com/boxicons@2.1.1/css/boxicons.min.css' rel='stylesheet'>
    
	<link href="css/search/searchBox.css" rel="stylesheet">
	<link href="css/search/searchResult.css" rel="stylesheet">
    <title>Dashboard Sidebar Menu</title> 
</head>



    <jsp:include page="css/sideBar.jsp" flush="true"></jsp:include>
    
<!--///////////////////////////////////////////////////////////////////////////////////////////////////-->

    <section class="home">
		<jsp:include page="member/mypage.jsp" flush="true"></jsp:include>
    </section>

    <script src="js/script.js"></script>