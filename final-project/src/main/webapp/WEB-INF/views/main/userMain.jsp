<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <link href="resources/css/User_main.css" rel="stylesheet"> -->
<style>

	.content{
        width: 1570px;
        height: 800px;
        margin-top: 105px;
        background-color: khaki;
    }


    /* 메인 css */
    .main_profile_area{
        border: 1px solid black;
        width: 22%;
        height: 800px;
        margin-top: 105px;
        border-radius: 20px;
        background-color: lightblue;
    }

    #main_profile img{
        border: 1px solid black;
        width: 200px;
        height: 200px;
        border-radius: 100px;
        margin-top: 80px;
        
    }

    .main_profile_area a{
        text-decoration: none;
        color: black;
    }

    #main_profile_work {
        background-color: white;
        width: 310px;
        height: 260px;
        border-radius: 20px;
    }

    #mp_work_input button{
        background-color: #0E6251;
        width: 100px;
        border-radius: 50px;
    }
}</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	<div class="content">
        <div class="main_profile_area" align="center">
            <div id="main_profile">
                <img src="https://i.imgur.com/hczKIze.jpg" alt="">
                <p style="font-size: 30px; margin: 0 0 0 0;">권수지</p>
                <p>개발1팀 / 사원</p>
                <div>
                    <a href="#">마이페이지</a>
                    <a href="#">로그아웃</a>
                </div>
                <br>
            </div>

            <div id="main_profile_card" align="center">
                <div style="float: left; margin:0 0 0 65px;">
                    <a href="#">
                        <i class="fa-sharp fa-solid fa-address-card" style="color: #000000; font-size: 70px;"></i>
                        <p style="margin:0 0 0 0;">명함 보기</p>
                    </a>
                </div>
                <div>
                    <a href="#">
                        <i class="fa-sharp fa-regular fa-address-card" style="color: #000000; font-size: 70px;"></i>
                        <p>명함 신청</p>
                    </a>
                </div>
            </div>

            <div id="main_profile_work">
                <div id="mp_sysdate">
                        <br>
                        <p style="font-size: 22px; margin: 0 0 0 0;">2023년 5월 30일 화요일</p>
                        <h1 class="user_clock">PM 00:00:00</h1>
                        <!-- <span style="font-size: 45px; font-weight: bold;"></span> -->
                </div>

                <div id="mp_work_output">
                    <div style="margin-bottom: 4px;">
                        <span>출근 시간</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>09:30</span>
                    </div>
                    <div style="border: 1px solid black; width: 280px;"></div>
                    <div style="margin: 6px 0 12px 0;">
                        <span>퇴근 시간</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>09:30</span>
                    </div>
                </div>
                <div id="mp_work_input">
                    <button type="button" class="btn btn-primary" style="margin-right: 20px;">출근</button>
                    <button type="button" class="btn btn-primary">퇴근</button>
                </div>
            </div>
           
        </div>
    </div>
</body>
</html>