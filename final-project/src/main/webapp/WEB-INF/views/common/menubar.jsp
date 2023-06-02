<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.1/js/bootstrap.min.js"></script>
   <!--  <script src="js/simple-sidebar.js"></script> -->
    <!--아이콘 cdn-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link href="resources/css/menubar.css" rel="stylesheet">
</head>
<body id="body-pd">
    <div class="header" id="header">
    	
    	<!-- 헤더 메뉴버튼  -->
        <div class="head">
            <i class="fa-sharp fa-solid fa-bars fa-lg" id="header-toggle" style="color: #0E6251;"></i>
        </div>

		<!-- 헤더 오른쪽  -->
        <div class="header_right">
        	<!-- 쪽지  -->
            <div class="header_letter">
            	<a href="#">
                	<i class="fa-sharp fa-solid fa-paper-plane fa-lg" style="color: #0E6251;"></i>
            	</a>
            </div>

			<!-- 메일  -->
            <div class="header_mail">
            	<a href="#">
                	<i class="fa-sharp fa-solid fa-envelope fa-lg" style="color: #0E6251;"></i>
                </a>
            </div>

			<!-- 실시간 채팅  -->
            <div class="header_chat">
            	<a href="#">
                	<i class="fa-sharp fa-solid fa-comments fa-lg" style="color: #0E6251;"></i>
                </a>
            </div>

			<!-- 알림  -->
            <div class="header_alert">
            	<a href="#">
                	<i class="fa-sharp fa-solid fa-bell fa-lg" style="color: #0E6251;"></i>
                </a>
            </div>
            
            <!-- 회원 프로필  -->
            <div class="header_profile">
            	<a href="#">
                	<img src="https://i.imgur.com/hczKIze.jpg" alt="" >
                </a>
            </div>  
        </div>
    </div>

    <div class="menubar" id="nav-bar">
        <nav class="nav"> <!--nav는 블럭요소, span은 인라인요소-->
            <div>
            	<!--로고 부분-->
                <a href="#" class="nav_logo"> 
                    <img src="" alt="">
                    <span class="nav_logo_name">로고</span>
                </a>

                <div class="sidebar-nav">
                    <ul>
                        <!--  홈  -->
                        <li>
                            <a href="home.ma" class="nav_link active">
                                <i class="fa-sharp fa-solid fa-house fa-xl" id="menu_img" style="color: #ffffff;"></i>
                                &nbsp;
                                <span class="nav_name">홈</span>
                            </a>
                        </li>
                        
                        <!-- 근태관리  -->
                        <li>
                            <a href="#" class="nav_link">
                                <i class="fa-sharp fa-solid fa-business-time" style="color: #ffffff; font-size: 22px;"></i>
                                &nbsp;
                                <span class="nav_name">근태관리</span>
                            </a>
                        </li>

						<!-- 전자결재 -->
                        <li class ="menu">
                            <a href="home.ap" class="nav_link" data-toggle="collapse" data-target="">
                                <i class="fa-sharp fa-solid fa-pen-to-square fa-xl" style="color: #ffffff;"></i>
                                &nbsp;
                                <span class="nav_name">전자결재</span>
                            </a>
                            <ul id="menu_submenu" class="collapse">
                                <li>
                                    <a href="#">결재홈</a>
                                </li>
                                <li>
                                    <a href="#">결재 작성</a>
                                </li>
                                <li>
                                    <a href="#">결재함</a>
                                </li>
                            </ul>
                        </li>
                        
                        <!-- 인사관리  -->
                        <li>
                            <a href="#" class="nav_link">
                                <i class="fa-sharp fa-solid fa-users" style="color: #ffffff; font-size: 21px;"></i>
                                &nbsp;
                                <span class="nav_name">인사관리</span>
                            </a>
                        </li>

						<!-- 일정관리  -->
                        <li>
                            <a href="#" class="nav_link">
                                <i class="fa-sharp fa-solid fa-calendar-day" style="color: #ffffff; font-size: 28px;"></i>
                                &nbsp;
                                <span class="nav_name">일정관리</span>
                            </a>
                        </li>
                        
                        <!--커뮤니티  -->
                        <li>
                            <a href="#" class="nav_link">
                                <i class="fa-sharp fa-solid fa-newspaper fa-xl" style="color: #ffffff; font-size: 28px;"></i>
                                &nbsp;
                                <span class="nav_name">커뮤니티</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

			<!-- 로그아웃  -->
            <div class="nav_logout">
                <a href="#" class="nav_link">
                    <i class="fa-sharp fa-solid fa-right-from-bracket fa-xl" style="color: #ffffff;"></i>
                    <span class="nav_name">로그아웃</span>
                </a>
            </div>
        </nav>
    </div>

    <script>
        document.addEventListener("DOMContentLoaded", function(event) {
	        const showNavbar = (toggleId, navId, bodyId, headerId) =>{
			const toggle = document.getElementById(toggleId),
			nav = document.getElementById(navId),
			bodypd = document.getElementById(bodyId),
			headerpd = document.getElementById(headerId)

			// Validate that all variables exist
			if(toggle && nav && bodypd && headerpd){
				toggle.addEventListener('click', ()=>{
				// show navbar
				nav.classList.toggle('show')
				// add padding to body
				bodypd.classList.toggle('body-pd')
				// add padding to header
				headerpd.classList.toggle('body-pd')
				})
			}
			}

			showNavbar('header-toggle','nav-bar','body-pd','header')
	
			const linkColor = document.querySelectorAll('.nav_link')
	
			function colorLink(){
				if(linkColor){
					linkColor.forEach(l=> l.classList.remove('active'))
					this.classList.add('active')
				}
			}
			
			linkColor.forEach(l=> l.addEventListener('click', colorLink))
		});


        $(document).ready(function(){
		    $("#header-toggle").click(function() {
		        var submenu = $(this).parents('.header').next(".menubar").find("#menu_submenu");
		
		        if(submenu.is(":visible")) {
		            submenu.slideUp();
		        }
		    });
		});

        $(document).ready(function(){
            $(".menu>a").click(function() {
                var submenu = $(this).next("#menu_submenu");

                if(submenu.is(":visible")) {
                    submenu.slideUp();
                }else {
                    submenu.slideDown();
                }
            });
        });
        
    </script>
</body>
</html>