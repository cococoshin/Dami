<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<meta charset="UTF-8">
<nav class="sidebar close"> <!-- 사이드바 -->
        <header>
            <div class="image-text">
                <span class="image"><!-- 로고클릭시 메인으로 이동 -->
                  <a href="main">  <img src="images/Dami.png" alt="" > </a>                
                </span>

                <div class="text logo-text">
                    <span class="name">다 미</span>
                    <span class="profession">많을 多 맛 味</span>
                </div>
            </div>

            <i class='bx bx-chevron-right toggle'></i>
        </header>

        <div class="menu-bar">
            <div class="menu">
				<form action="loginCheck/Search" method="get" >
				<ul>
                <li class="search-box">
                    <i class='bx bx-search icon'></i>
                    <input type="text"  name="search" placeholder="Search...">
                    <span><input type="submit" value="검색"></span>	
                </li>
				</ul>
				</form>
                <ul class="menu-links">
                    <li class="nav-link">
                        <a href="loginCheck/menuGame">
                            <i class='bx bx-home-alt icon' ></i>
                            <span class="text nav-text">취향조사</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="loginCheck/myPage">
                            <i class='bx bx-bar-chart-alt-2 icon' ></i>
                            <span class="text nav-text">회원정보</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="loginCheck/resRecommend">
                            <i class='bx bx-bell icon'></i>
                            <span class="text nav-text">근처맛집찾기</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-pie-chart-alt icon' ></i>
                            <span class="text nav-text">찜하기</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-heart icon' ></i>
                            <span class="text nav-text">가본식당</span>
                        </a>
                    </li>

                    <li class="nav-link">
                        <a href="#">
                            <i class='bx bx-wallet icon' ></i>
                            <span class="text nav-text">블라블라</span>
                        </a>
                    </li>

                </ul>
            </div>

            <div class="bottom-content">
                <ul>
                <li class="">
                    <a href="loginCheck/logout">
                        <i class='bx bx-log-out icon' ></i>
                        <span class="text nav-text">Logout</span>
                    </a>
                </li>

                <li class="mode">
                    <div class="sun-moon">
                        <i class='bx bx-moon icon moon'></i>
                        <i class='bx bx-sun icon sun'></i>
                    </div>
                    <span class="mode-text text">Dark mode</span>

                    <div class="toggle-switch">
                        <span class="switch"></span>
                    </div>
                </li>
                </ul>
            </div>
        </div>

    </nav>
</html>