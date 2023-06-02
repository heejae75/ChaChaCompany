<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        
        :root{
            --header-height: 3rem;
            --nav-width: 68px;
            --menubar-color: #0E6251; /*메뉴바 색상*/
            --menubar-font-color: white; /*메뉴바 글씨 색상*/
            --header-color: red; /*헤더 색상*/
            --body-font: ; /*폰트*/
            --normal-font-size: 1rem; /*기본 글씨 크기*/
            --z-fixed: 100; /*?*/
        }*,

        ::before, ::after{
            box-sizing: border-box;
        }

        body{
            position: relative;
            margin: var(--header-height) 0 0 0;
            padding: 0 1rem;
            font-family: var(--body-font);
            font-size: var(--normal-font-size);
            transition: .5s;
        }

        a{
            text-decoration: none;
        }

        .header{
            width: 100%;
            height: var(--header-height);
            position: fixed;
            top: 0;
	        left: 0;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 1rem;
            background-color: var(--header-color);
            z-index: var(--z-fixed);
            transition: .5s;
        }

        
        .head{
            color: var(--menubar-color);
            font-size: 1.5rem;
            cursor: pointer;
        }
        
        .header_right{
            display: flex;
            /* padding: .5rem 1rem 0 0; */
            column-gap: 2rem;
            font-size: 1.5rem;
            cursor: pointer;
        }
        /* 왜 있는 것일까 */
        /* .header_profile{

        } */

        .header_profile img{
            border: 1px solid black;
            width: 35px;
            height: 35px;
            display: flex;
            justify-content: center;
            border-radius: 50%;
            cursor: pointer;
        }

        .menubar{
            position: fixed;
            background-color: var(--menubar-color);
            top: 0;
            left: -30%;
            width: var(--nav-width);
            height: 100vh;
            padding: .5rem 1rem 0 0;
            transition: .5s;

            z-index: var(--z-fixed);
        }

        /* 이해 잘 못함 */
        .nav{
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            overflow: hidden;
        }

        .nav_logo, .nav_link{
            display: grid;
            grid-template-columns: max-content max-content;
            align-items: center;
            column-gap: 1rem;
	        padding: .5rem 0 .5rem 1.5rem; 
        }

        .nav_link{
            position: relative;
            color: var(--menubar-font-color);
            margin-bottom: 1.5rem;
            transition: .3s;
        }

        .nav_link:hover{
            color: var(--white-color);
        }

        .show{
    	left: 0;
    }

        .body-pd{
    	padding-left: calc(var(--nav-width) + 1rem);
    }
    .active{
    	color: var(--white-color);
    }
    .active::before{
	    content: '';
	    position: absolute;
	    left: 0;
	    width: 2px;
	    height: 32px;
	    background-color: var(--white-color);
    }
    .height-100{
    	height:100vh;
    }
    @media screen and (min-width: 768px){
    body{
	    margin: calc(var(--header-height) + 1rem) 0 0 0;
	    padding-left: calc(var(--nav-width) + 2rem);
    }
    .header{
	    height: calc(var(--header-height) + 1rem);
	    padding: 0 2rem 0 calc(var(--nav-width) + 2rem);
    }
    .header_profile{
	    width: 40px;
	    height: 40px;
    }
    .header_profile img{
    	width: 45px;
    }
    .menubar{
    	left: 0;
    	padding: 1rem 1rem 0 0;
    }
    .show{
    	width: calc(var(--nav-width) + 156px);
    }
    .body-pd{
    	padding-left: calc(var(--nav-width) + 188px)
    }
    }


    </style>
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
    
                        <a href="list.no" class="nav_link">
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