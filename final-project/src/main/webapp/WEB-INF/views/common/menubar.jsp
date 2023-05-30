<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="resources/css/menubar.css" rel="stylesheet">
</head>
<body id="body-pd">
    <div class="header" id="header">
        <div class="head">
            <i class="fa-sharp fa-solid fa-bars" id="header-toggle" style="color: #ffffff;"></i>
            <!-- <img src="resource/메뉴.png" id="header-toggle" alt="" style="width:20px; height:20px"> -->
        </div>

        <div class="header_right">
            <div class="header_letter">
                <i class="fa-sharp fa-solid fa-paper-plane" style="color: #ffffff;"></i>
            </div>

            <div class="header_mail">
                <i class="fa-sharp fa-solid fa-envelope" style="color: #ffffff;"></i>
            </div>

            <div class="header_chat">
                <i class="fa-sharp fa-solid fa-comments" style="color: #ffffff;"></i>
                <!-- <img src="resource/메뉴.png" alt="" style="width:20px; height:20px"> -->
            </div>

            <div class="header_alarm">
                <i class="fa-sharp fa-solid fa-bell" style="color: #ffffff;"></i>
            </div>
            
            <div class="header_profile">
                <img src="https://i.imgur.com/hczKIze.jpg" alt="" >
            </div>  

        </div>
    </div>

    <div class="menubar" id="nav-bar">
        <nav class="nav"> <!--nav는 블럭요소, span은 인라인요소-->
            <div>
                <a href="#" class="nav_logo"> <!--로고 부분-->
                    <img src="" alt="">
                    <span class="nav_logo_name">로고</span>
                </a>

                <div>
                    <a href="#" class="nav_link active">
                        <i class="fa-sharp fa-solid fa-house" id="menu_img" style="color: #ffffff;"></i>
                        <!-- <img src="resource/메뉴.png" alt="" id="menu_img" style="width:20px; height:20px"> -->
                        <span class="nav_name">홈</span>
                    </a>

                    <div class="nav_list">
                      <a href="#" class="nav_link">
                            <i class="fa-sharp fa-solid fa-business-time" style="color: #ffffff;"></i>
                            <span class="nav_name">근태관리</span>
                        </a>
    
                        <a href="home.ap" class="nav_link">
                            <i class="fa-sharp fa-solid fa-pen-to-square" style="color: #ffffff;"></i>
                            <span class="nav_name">전자결재</span>
                        </a>
    
                        <a href="#" class="nav_link">
                            <i class="fa-sharp fa-solid fa-users" style="color: #ffffff;"></i>
                            <span class="nav_name">인사관리</span>
                        </a>
    
                        <a href="#" class="nav_link">
                            <i class="fa-sharp fa-solid fa-calendar-day" style="color: #ffffff;"></i>
                            <span class="nav_name">일정관리</span>
                        </a>
    
                        <a href="#" class="nav_link">
                            <i class="fa-sharp fa-solid fa-newspaper" style="color: #ffffff;"></i>
                            <span class="nav_name">커뮤니티</span>
                        </a>
                    </div>
                </div>
            </div>

            <a href="#" class="nav_link">
                <i class="fa-sharp fa-solid fa-right-from-bracket" style="color: #ffffff;"></i>
                <span class="nav_name">로그아웃</span>
            </a>
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
		// change icon
		toggle.classList.toggle('bx-x')
		// add padding to body
		bodypd.classList.toggle('body-pd')
		// add padding to header
		headerpd.classList.toggle('body-pd')
		})
		}
		}

		showNavbar('header-toggle','nav-bar','body-pd','header')

		/*===== LINK ACTIVE =====*/
		const linkColor = document.querySelectorAll('.nav_link')

		function colorLink(){
		if(linkColor){
		linkColor.forEach(l=> l.classList.remove('active'))
		this.classList.add('active')
		}
		}
		linkColor.forEach(l=> l.addEventListener('click', colorLink))

		 // Your code to run since DOM is loaded and ready
		});
    </script>
</body>
</html>